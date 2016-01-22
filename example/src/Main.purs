module Main where

import Prelude

import Data.Maybe
import Data.Array.ST (pushSTArray)
import DOM (DOM())

import Control.Monad.Eff
import Control.Monad.Eff.Console (print, log, CONSOLE())
import Control.Monad.Eff.Ref (newRef, readRef, writeRef, REF())

import Ace
import Ace.Types

import Ace.Config as Config
import Ace.Editor as Editor
import Ace.EditSession as Session
import Ace.Anchor as Anchor
import Ace.BackgroundTokenizer as BackgroundTokenizer
import Ace.Document as Document
import Ace.Range as Range
import Ace.ScrollBar as ScrollBar
import Ace.Search as Search
import Ace.Selection as Selection
import Ace.Tokenizer as Tokenizer
import Ace.TokenIterator as TokenIterator
import Ace.UndoManager as UndoManager
import Ace.VirtualRenderer as VirtualRenderer
import Ace.Ext.LanguageTools as LanguageTools
import Ace.Ext.LanguageTools.Completer as Completer
import Ace.KeyBinding as KeyBinding

foreign import rules :: Rules
foreign import onLoad :: forall e. Eff e Unit -> Eff e Unit

main :: forall e. Eff (ref ::REF, console :: CONSOLE, ace :: ACE, dom :: DOM|e) Unit
main = onLoad $ do
  Config.set Config.basePath "foo"

  -- Create an editor
  editor <- Ace.edit "editor" ace
  session <- Editor.getSession editor
  document <- Session.getDocument session
  Editor.setValue "blablabla \n tr  test boo boo" Nothing editor

  startAnchor <- Document.createAnchor 1 5 document
  endAnchor <- Document.createAnchor 1 9 document
  Anchor.setInsertRight true endAnchor

  range <- Range.create 1 4 1 10
  markerRef <-
    Session.addMarker
      range
      "readonly-highlight"
      "string"
      false
      session
    >>= newRef

  let rerenderMarker _ = do
        readRef markerRef >>= flip Session.removeMarker session
        Position {row: startRow, column: startColumn}
          <- Anchor.getPosition startAnchor
        Position {row: endRow, column: endColumn}
          <- Anchor.getPosition endAnchor
        markRange <- Range.create
                       startRow
                       (startColumn - one)
                       endRow
                       (endColumn + one)
        newMId <- Session.addMarker
                  markRange
                  "readonly-highlight"
                  "string"
                  false
                  session

        writeRef markerRef newMId
        pure unit

  Anchor.onChange startAnchor rerenderMarker
  Anchor.onChange endAnchor rerenderMarker

  Editor.getKeyBinding editor
    >>= KeyBinding.addKeyboardHandler \{editor} hs kstring kcode evt -> do
      if hs == -1 || (kcode <= 40 && kcode >= 37)
        then pure Nothing
        else do
        Position {row: startRow, column: startColumn}
          <- Anchor.getPosition startAnchor
        Position {row: endRow, column: endColumn}
          <- Anchor.getPosition endAnchor
        selectedRange <- Editor.getSelectionRange editor
        newRange <- if kstring /= "backspace"
                    then Range.create startRow startColumn endRow endColumn
                    else Range.create startRow startColumn endRow (endColumn + one)
        intersected <- Range.intersects newRange selectedRange
        pure if intersected
             then Just {command: Null, passEvent: false}
             else Nothing

  -- Set the theme
  Editor.setTheme "ace/theme/chrome" editor

  -- Log some events
  editor `Editor.onCopy` \s -> log ("Text copied: " ++ s)
  editor `Editor.onPaste` \_ -> log "Text pasted."
  editor `Editor.onBlur` log "Editor lost focus."
  editor `Editor.onFocus` log "Editor gained focus."

  -- Get the editor session


  -- Set the mode
  Session.setMode "ace/mode/javascript" session
  -- Get the mode
  mode <- Session.getMode session
  -- Create another edit session with this mode
  session1 <- Ace.createEditSession "" mode ace

  -- Get the document for the session
  document <- Session.getDocument session
  document `Document.onChange` \(DocumentEvent {action: ty}) ->
    log ("Document changed: " ++ showDocumentEventType ty)
  Document.setNewLineMode Windows document

  -- Add an anchor at the start of the document and listen for updates
  anchor <- Document.createAnchor 0 0 document
  -- Check initial anchor position
  position <- Anchor.getPosition anchor

  log $ "Initial anchor position: "
      <> show (getRow position)
      <> ", "
      <> show (getColumn position)
      <> ". Should be 0, 0"

  -- Update the anchor position
  Anchor.setPosition 0 1 true anchor
  -- Listen for anchor position changes
  anchor `Anchor.onChange` \e -> do
    log $ "New anchor position: "
       ++ show (getRow e.value)
       ++ ", "
       ++ show (getColumn e.value)
    -- Unlisten
    Anchor.detach anchor

  -- Add a dynamic marker
  Session.addDynamicMarker (\html _ -> pushSTArray html "<i>!</i>") true session

  -- Get the background tokenizer and trace the tokens and state on the first line
  backgroundTokenizer <- Session.getBackgroundTokenizer session
  tokens <- BackgroundTokenizer.getTokens 0 backgroundTokenizer
  print $ map (\o -> o.value) tokens
  state <- BackgroundTokenizer.getState 0 backgroundTokenizer
  log state

  -- Create a scroll bar and apply it to
  ctr <- Editor.getContainer editor
  vr <- Editor.getRenderer editor
  scrollBar <- ScrollBar.create ctr vr
  scrollBar `ScrollBar.onScroll` log "Scrolled"

  -- Create a search class
  search <- Search.create
  Search.set { needle: "to the console"
             , backwards: false
             , wrap: false
             , caseSensitive: false
             , wholeWord: true
             , regExp: false
             , skipCurrent: false
             } search
  range <- Search.find session search
  Session.addFold "fold" range session

  -- Gutter decorations
  Session.addGutterDecoration 0 "?" session

  -- Markers
  Session.addMarker range "1" "2" false session

  -- Wrap limit
  Session.adjustWrapLimit 20 session

  -- Move the cursor
  Editor.moveCursorTo 0 Nothing Nothing editor


--  Session.setMode "ace/mode/text" session
  languageTools <- LanguageTools.languageTools
  Editor.setEnableBasicAutocompletion true editor
  completer <-
    Completer.mkCompleter
    (\_ _ _ inp cb -> do
        cb $ pure [ { value: inp <> "!!"
                    , score: 100.0
                    , caption: pure "???"
                    , meta: "!!"
                    }
                  , { value: "abcde"
                    , score: 200.0
                    , caption: Nothing
                    , meta: "abcde"
                    } ] )
  LanguageTools.addCompleter completer languageTools


  -- Misc. Tests
  miscTests

  pure unit


miscTests :: forall e. Eff (console :: CONSOLE, ace :: ACE |e) Unit
miscTests = void do
  editor <- Ace.edit "tests" ace
  session <- Editor.getSession editor
  document <- Session.getDocument session

  range <- Range.create 0 0 0 1

  ctr <- Editor.getContainer editor
  vr <- Editor.getRenderer editor
  scrollBar <- ScrollBar.create ctr vr

  search <- Search.create

  backgroundTokenizer <- Session.getBackgroundTokenizer session

  anchor <- Document.createAnchor 0 0 document

  Anchor.getPosition anchor
  Anchor.getDocument anchor
  Anchor.setPosition 0 0 true anchor
  Anchor.detach anchor

  position <- Document.indexToPosition 0 0 document

  tokenIterator <- TokenIterator.create session 0 0

  TokenIterator.stepForward tokenIterator
  TokenIterator.stepBackward tokenIterator
  TokenIterator.getCurrentToken tokenIterator
  TokenIterator.getCurrentTokenRow tokenIterator
  TokenIterator.getCurrentTokenColumn tokenIterator

  BackgroundTokenizer.setDocument document backgroundTokenizer
  BackgroundTokenizer.fireUpdateEvent 0 0 backgroundTokenizer
  BackgroundTokenizer.start 0 backgroundTokenizer
  BackgroundTokenizer.stop backgroundTokenizer
  BackgroundTokenizer.getTokens 0 backgroundTokenizer
  BackgroundTokenizer.getState 0 backgroundTokenizer

  Document.getValue document
  Document.createAnchor 0 0 document
  Document.getNewLineCharacter document
  Document.getNewLineMode document
  Document.isNewLine "" document
  Document.getLine 0 document
  Document.getLines 0 0 document
  Document.getAllLines document
  Document.getLength document
  Document.getTextRange range document
  Document.insert position "" document
  Document.insertNewLine position document
  Document.remove range document
  Document.removeInLine 0 0 0 document
  Document.removeLines 0 0 document
  Document.removeNewLine 0 document
  Document.replace range "" document
  Document.indexToPosition 0 0 document
  Document.positionToIndex position 0 document


  undoManager <- UndoManager.create

  Session.findMatchingBracket position session
  Session.screenToDocumentColumn 0 0 session
  Session.highlight "" session
  Session.setDocument document session
  Session.getDocument session
  Session.resetRowCache 0 session
  Session.setValue "" session
  Session.setMode "" session
  Session.getValue session
  Session.getSelection session
  Session.getState 0 session
  Session.getTokens 0 session
  Session.getTokenAt 0 0 session
  Session.setUndoManager undoManager session
  Session.getUndoManager session
  Session.getTabString session
  Session.setUseSoftTabs true session
  Session.getUseSoftTabs session
  Session.setTabSize 0 session
  Session.getTabSize session
  Session.setOverwrite true session
  Session.getOverwrite session
  Session.toggleOverwrite session
  Session.addGutterDecoration 0 "" session
  Session.removeGutterDecoration 0 "" session
  Session.getBreakpoints session
  Session.setBreakpoints [] session
  Session.clearBreakpoints session
  Session.setBreakpoint 0 "" session
  Session.clearBreakpoint 0 session
  Session.addMarker range "" "" true session
  Session.setAnnotations [] session
  Session.getAnnotations session
  Session.clearAnnotations session
  Session.detectNewLine "" session
  Session.getWordRange 0 0 session
  Session.getAWordRange 0 0 session
  Session.setNewLineMode "" session
  Session.getNewLineMode session
  Session.setUseWorker true session
  Session.getUseWorker session
  Session.getMode session
  Session.setScrollTop 0 session
  Session.getScrollTop session
  Session.setScrollLeft 0 session
  Session.getScrollLeft session
  Session.getScreenWidth session
  Session.getLine 0 session
  Session.getLines 0 0 session
  Session.getLength session
  Session.getTextRange range session
  Session.insert position "" session
  Session.remove range session
  Session.setUndoSelect true session
  Session.replace range "" session
  Session.indentRows 0 0 "" session
  Session.outdentRows range session
  Session.moveLinesUp 0 0 session
  Session.moveLinesDown 0 0 session
  Session.duplicateLines 0 0 session
  Session.setUseWrapMode true session
  Session.getUseWrapMode session
  Session.setWrapLimitRange 0 0 session
  Session.adjustWrapLimit 0 session
  Session.getWrapLimit session
  Session.getWrapLimitRange session
  Session.getDisplayTokens "" 0 session
  Session.getStringScreenWidth "" 0 0 session
  Session.getRowLength 0 session
  Session.getScreenLastRowColumn 0 session
  Session.getDocumentLastRowColumn 0 0 session
  Session.getDocumentLastRowColumnPosition 0 0 session
  Session.getRowSplitData session
  Session.getScreenTabSize 0 session
  Session.screenToDocumentPosition 0 0 session
  Session.documentToScreenPosition 0 0 session
  Session.documentToScreenColumn 0 0 session
  Session.documentToScreenRow 0 0 session
  Session.getScreenLength session

  Editor.selectMoreLines 0 editor
  Editor.setKeyboardHandler "" editor
  Editor.getKeyboardHandler editor
  Editor.setSession session editor
  Editor.getSession editor
  Editor.setValue "" Nothing editor
  Editor.getValue editor
  Editor.getSelection editor
  Editor.resize Nothing editor
  Editor.setTheme "" editor
  Editor.getTheme editor
  Editor.setStyle "" editor
  Editor.unsetStyle editor
  Editor.setFontSize "" editor
  Editor.focus editor
  Editor.isFocused editor
  Editor.blur editor
  Editor.getCopyText editor
  Editor.insert "" editor
  Editor.setOverwrite true editor
  Editor.getOverwrite editor
  Editor.toggleOverwrite editor
  Editor.setScrollSpeed 0.0 editor
  Editor.getScrollSpeed editor
  Editor.setDragDelay 0.0 editor
  Editor.getDragDelay editor
  Editor.setSelectionStyle "" editor
  Editor.getSelectionStyle editor
  Editor.setHighlightActiveLine true editor
  Editor.getHighlightActiveLine editor
  Editor.setHighlightSelectedWord true editor
  Editor.getHighlightSelectedWord editor
  Editor.setShowInvisibles true editor
  Editor.getShowInvisibles editor
  Editor.setShowPrintMargin true editor
  Editor.getShowPrintMargin editor
  Editor.setPrintMarginColumn 0 editor
  Editor.getPrintMarginColumn editor
  Editor.setReadOnly true editor
  Editor.getReadOnly editor
  Editor.setBehavioursEnabled true editor
  Editor.getBehavioursEnabled editor
  Editor.setWrapBehavioursEnabled true editor
  Editor.getWrapBehavioursEnabled editor
  Editor.setShowFoldWidgets true editor
  Editor.getShowFoldWidgets editor
  Editor.remove "" editor
  Editor.removeWordRight editor
  Editor.removeWordLeft editor
  Editor.removeToLineStart editor
  Editor.removeToLineEnd editor
  Editor.splitLine editor
  Editor.transposeLetters editor
  Editor.toLowerCase editor
  Editor.toUpperCase editor
  Editor.indent editor
  Editor.blockIndent editor
  Editor.blockOutdent Nothing editor
  Editor.toggleCommentLines editor
  Editor.getNumberAt editor
  Editor.modifyNumber 0.0 editor
  Editor.removeLines editor
  Editor.moveLinesDown editor
  Editor.moveLinesUp editor
  Editor.copyLinesUp editor
  Editor.copyLinesDown editor
  Editor.getFirstVisibleRow editor
  Editor.getLastVisibleRow editor
  Editor.isRowVisible 0 editor
  Editor.isRowFullyVisible 0 editor
  Editor.selectPageDown editor
  Editor.selectPageUp editor
  Editor.gotoPageDown editor
  Editor.gotoPageUp editor
  Editor.scrollPageDown editor
  Editor.scrollPageUp editor
  Editor.scrollToRow editor
  Editor.centerSelection editor
  Editor.getCursorPosition editor
  Editor.getCursorPositionScreen editor
  Editor.getSelectionRange editor
  Editor.selectAll editor
  Editor.clearSelection editor
  Editor.moveCursorTo 0 Nothing Nothing editor
  Editor.moveCursorToPosition position editor
  Editor.jumpToMatching editor
  Editor.gotoLine 0 Nothing Nothing editor
  Editor.navigateTo 0 0 editor
  Editor.navigateUp Nothing editor
  Editor.navigateDown Nothing editor
  Editor.navigateLeft Nothing editor
  Editor.navigateRight 0 editor
  Editor.navigateLineStart editor
  Editor.navigateLineEnd editor
  Editor.navigateFileEnd editor
  Editor.navigateFileStart editor
  Editor.navigateWordRight editor
  Editor.navigateWordLeft editor
  Editor.replace "" Nothing editor
  Editor.replaceAll "" Nothing editor
  Editor.getLastSearchOptions editor
  Editor.find "" Nothing Nothing editor
  Editor.findNext Nothing Nothing editor
  Editor.findPrevious Nothing Nothing editor
  Editor.undo editor
  Editor.redo editor
  Editor.destroy editor

  Range.isEmpty range
  Range.isEqual range range
  Range.toString range
  Range.contains 0 0 range
  Range.compareRange range range
  Range.comparePoint range range
  Range.containsRange range range
  Range.intersects range range
  Range.isEnd 0 0 range
  Range.isStart 0 0 range
  Range.setStart 0 0 range
  Range.setEnd 0 0 range
  Range.inside 0 0 range
  Range.insideStart 0 0 range
  Range.insideEnd 0 0 range
  Range.compare 0 0 range
  Range.compareStart 0 0 range
  Range.compareEnd 0 0 range
  Range.compareInside 0 0 range
  Range.clipRows 0 0 range
  Range.extend 0 0 range
  Range.isMultiLine range
  Range.clone range
  Range.collapseRows range
  Range.toScreenRange session range
  Range.fromPoints range range

  ScrollBar.getWidth scrollBar
  ScrollBar.setHeight 0 scrollBar
  ScrollBar.setInnerHeight 0 scrollBar
  ScrollBar.setScrollTop 0 scrollBar

  Search.find session search
  Search.findAll session search
  Search.replace "" "" search

  selection <- Session.getSelection session

  Selection.moveCursorWordLeft selection
  Selection.moveCursorWordRight selection
  Selection.fromOrientedRange range selection
  Selection.getAllRanges selection
  Selection.addRange range selection
  Selection.isEmpty selection
  Selection.isMultiLine selection
  Selection.getCursor selection
  Selection.setSelectionAnchor 0 0 selection
  Selection.getSelectionAnchor selection
  Selection.getSelectionLead selection
  Selection.shiftSelection 0 selection
  Selection.isBackwards selection
  Selection.getRange selection
  Selection.clearSelection selection
  Selection.selectAll selection
  Selection.setRange range true selection
  Selection.selectTo 0 0 selection
  Selection.selectUp selection
  Selection.selectDown selection
  Selection.selectRight selection
  Selection.selectLeft selection
  Selection.selectLineStart selection
  Selection.selectLineEnd selection
  Selection.selectFileEnd selection
  Selection.selectFileStart selection
  Selection.selectWordRight selection
  Selection.selectWordLeft selection
  Selection.getWordRange selection
  Selection.selectWord selection
  Selection.selectAWord selection
  Selection.selectLine selection
  Selection.moveCursorUp selection
  Selection.moveCursorDown selection
  Selection.moveCursorLeft selection
  Selection.moveCursorRight selection
  Selection.moveCursorLineStart selection
  Selection.moveCursorLineEnd selection
  Selection.moveCursorFileEnd selection
  Selection.moveCursorFileStart selection
  Selection.moveCursorLongWordRight selection
  Selection.moveCursorLongWordLeft selection
  Selection.moveCursorBy 0 0 selection
  Selection.moveCursorTo 0 0 Nothing selection
  Selection.moveCursorToScreen 0 0 true selection

  UndoManager.undo Nothing undoManager
  UndoManager.redo true undoManager
  UndoManager.reset undoManager
  UndoManager.hasUndo undoManager
  UndoManager.hasRedo undoManager
