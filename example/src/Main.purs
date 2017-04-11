module Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (log, CONSOLE)
import Control.Monad.Eff.Ref (newRef, readRef, writeRef, REF)

import Data.Array.ST (pushSTArray)
import Data.Maybe (Maybe(..))
import Data.Traversable (for_)

import DOM (DOM)

import Ace as Ace
import Ace.Anchor as Anchor
import Ace.BackgroundTokenizer as BackgroundTokenizer
import Ace.Config as Config
import Ace.Document as Document
import Ace.Editor as Editor
import Ace.EditSession as Session
import Ace.Ext.LanguageTools as LanguageTools
import Ace.Ext.LanguageTools.Completer as Completer
import Ace.KeyBinding as KeyBinding
import Ace.Range as Range
import Ace.ScrollBar as ScrollBar
import Ace.Search as Search
import Ace.Selection as Selection
import Ace.TokenIterator as TokenIterator
import Ace.UndoManager as UndoManager

foreign import rules :: Ace.Rules
foreign import onLoad :: forall e. Eff e Unit -> Eff e Unit

main :: forall e. Eff (ref ::REF, console :: CONSOLE, ace :: Ace.ACE, dom :: DOM|e) Unit
main = onLoad $ do
  _ <- Config.set Config.basePath "foo"

  -- Create an editor
  editor <- Ace.edit "editor" Ace.ace
  session <- Editor.getSession editor
  document <- Session.getDocument session
  _ <- Editor.setValue "blablabla \n tr  test boo boo" Nothing editor

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
        Ace.Position {row: startRow, column: startColumn}
          <- Anchor.getPosition startAnchor
        Ace.Position {row: endRow, column: endColumn}
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
        Ace.Position {row: startRow, column: startColumn}
          <- Anchor.getPosition startAnchor
        Ace.Position {row: endRow, column: endColumn}
          <- Anchor.getPosition endAnchor
        selectedRange <- Editor.getSelectionRange editor
        newRange <-
          if kstring == "backspace"
          then Range.create startRow startColumn endRow (endColumn + 1)
          else if kstring == "delete" || (kstring == "d" && hs == 1)
               then Range.create startRow (startColumn - 1) endRow endColumn
               else Range.create startRow startColumn endRow endColumn
        intersected <- Range.intersects newRange selectedRange
        pure if intersected
             then Just {command: Ace.Null, passEvent: false}
             else Nothing

  -- Set the theme
  Editor.setTheme "ace/theme/chrome" editor

  -- Log some events
  editor `Editor.onCopy` \s -> log ("Text copied: " <> s)
  editor `Editor.onPaste` \_ -> log "Text pasted."
  editor `Editor.onBlur` log "Editor lost focus."
  editor `Editor.onFocus` log "Editor gained focus."

  -- Get the editor session


  -- Set the mode
  Session.setMode "ace/mode/javascript" session
  -- Get the mode
  mode <- Session.getMode session
  -- Create another edit session with this mode
  session1 <- Ace.createEditSession "" mode Ace.ace

  -- Get the document for the session
  document `Document.onChange` \(Ace.DocumentEvent {action: ty}) ->
    log ("Document changed: " <> Ace.showDocumentEventType ty)
  Document.setNewLineMode Ace.Windows document

  -- Add an anchor at the start of the document and listen for updates
  anchor <- Document.createAnchor 0 0 document
  -- Check initial anchor position
  position <- Anchor.getPosition anchor

  log $ "Initial anchor position: "
      <> show (Ace.getRow position)
      <> ", "
      <> show (Ace.getColumn position)
      <> ". Should be 0, 0"

  -- Update the anchor position
  Anchor.setPosition 0 1 true anchor
  -- Listen for anchor position changes
  anchor `Anchor.onChange` \e -> do
    log $ "New anchor position: "
       <> show (Ace.getRow e.value)
       <> ", "
       <> show (Ace.getColumn e.value)
    -- Unlisten
    Anchor.detach anchor

  -- Add a dynamic marker
  Session.addDynamicMarker (\html _ -> pushSTArray html "<i>!</i>") true session

  -- Get the background tokenizer and trace the tokens and state on the first line
  backgroundTokenizer <- Session.getBackgroundTokenizer session
  tokens <- BackgroundTokenizer.getTokens 0 backgroundTokenizer
  log $ "tokens " <> show (map (\o -> o.value) tokens)
  state <- BackgroundTokenizer.getState 0 backgroundTokenizer
  log $ "state " <> state

  -- Create a scroll bar and apply it to
  ctr <- Editor.getContainer editor
  vr <- Editor.getRenderer editor
  scrollBar <- ScrollBar.create ctr vr
  scrollBar `ScrollBar.onScroll` log "Scrolled"

  -- Create a search class
  search <- Search.create
  _ <- Search.set { needle: "boo"
             , backwards: false
             , wrap: false
             , caseSensitive: false
             , wholeWord: true
             , regExp: false
             , skipCurrent: false
             } search
  range' <- Search.find session search
  for_ range' \r -> Session.addFold "fold" r session

  -- Gutter decorations
  Session.addGutterDecoration 0 "?" session

  -- Markers
  for_ range' \r -> Session.addMarker r "1" "2" false session

  -- Wrap limit
  _ <- Session.adjustWrapLimit 20 session

  -- Move the cursor
  Editor.moveCursorTo 0 Nothing Nothing editor


  Session.setMode "ace/mode/text" session
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
  -- miscTests

  pure unit


miscTests :: forall e. Eff (console :: CONSOLE, ace :: Ace.ACE |e) Unit
miscTests = void do
  editor <- Ace.edit "tests" Ace.ace
  session <- Editor.getSession editor
  document <- Session.getDocument session

  range <- Range.create 0 0 0 1

  ctr <- Editor.getContainer editor
  vr <- Editor.getRenderer editor
  scrollBar <- ScrollBar.create ctr vr

  search <- Search.create

  backgroundTokenizer <- Session.getBackgroundTokenizer session

  anchor <- Document.createAnchor 0 0 document

  _ <- Anchor.getPosition anchor
  _ <- Anchor.getDocument anchor
  Anchor.setPosition 0 0 true anchor
  Anchor.detach anchor

  position <- Document.indexToPosition 0 0 document

  tokenIterator <- TokenIterator.create session 0 0

  _ <- TokenIterator.stepForward tokenIterator
  _ <- TokenIterator.stepBackward tokenIterator
  _ <- TokenIterator.getCurrentToken tokenIterator
  _ <- TokenIterator.getCurrentTokenRow tokenIterator
  _ <- TokenIterator.getCurrentTokenColumn tokenIterator

  BackgroundTokenizer.setDocument document backgroundTokenizer
  BackgroundTokenizer.fireUpdateEvent 0 0 backgroundTokenizer
  BackgroundTokenizer.start 0 backgroundTokenizer
  BackgroundTokenizer.stop backgroundTokenizer
  _ <- BackgroundTokenizer.getTokens 0 backgroundTokenizer
  _ <- BackgroundTokenizer.getState 0 backgroundTokenizer

  _ <- Document.getValue document
  _ <- Document.createAnchor 0 0 document
  _ <- Document.getNewLineCharacter document
  _ <- Document.getNewLineMode document
  _ <- Document.isNewLine "" document
  _ <- Document.getLine 0 document
  _ <- Document.getLines 0 0 document
  _ <- Document.getAllLines document
  _ <- Document.getLength document
  _ <- Document.getTextRange range document
  Document.insert position "" document
  Document.insertNewLine position document
  Document.remove range document
  Document.removeInLine 0 0 0 document
  _ <- Document.removeLines 0 0 document
  Document.removeNewLine 0 document
  Document.replace range "" document
  _ <- Document.indexToPosition 0 0 document
  _ <- Document.positionToIndex position 0 document


  undoManager <- UndoManager.create

  Session.findMatchingBracket position session
  Session.screenToDocumentColumn 0 0 session
  Session.highlight "" session
  Session.setDocument document session
  _ <- Session.getDocument session
  Session.resetRowCache 0 session
  Session.setValue "" session
  Session.setMode "" session
  _ <- Session.getValue session
  _ <- Session.getSelection session
  _ <- Session.getState 0 session
  _ <- Session.getTokens 0 session
  _ <- Session.getTokenAt 0 0 session
  Session.setUndoManager undoManager session
  _ <- Session.getUndoManager session
  _ <- Session.getTabString session
  Session.setUseSoftTabs true session
  _ <- Session.getUseSoftTabs session
  Session.setTabSize 0 session
  _ <- Session.getTabSize session
  Session.setOverwrite true session
  _ <- Session.getOverwrite session
  Session.toggleOverwrite session
  Session.addGutterDecoration 0 "" session
  Session.removeGutterDecoration 0 "" session
  _ <- Session.getBreakpoints session
  Session.setBreakpoints [] session
  Session.clearBreakpoints session
  Session.setBreakpoint 0 "" session
  Session.clearBreakpoint 0 session
  _ <- Session.addMarker range "" "" true session
  Session.setAnnotations [] session
  _ <- Session.getAnnotations session
  Session.clearAnnotations session
  Session.detectNewLine "" session
  _ <- Session.getWordRange 0 0 session
  _ <- Session.getAWordRange 0 0 session
  Session.setNewLineMode "" session
  _ <- Session.getNewLineMode session
  Session.setUseWorker true session
  _ <- Session.getUseWorker session
  _ <- Session.getMode session
  Session.setScrollTop 0 session
  _ <- Session.getScrollTop session
  Session.setScrollLeft 0 session
  _ <- Session.getScrollLeft session
  _ <- Session.getScreenWidth session
  _ <- Session.getLine 0 session
  _ <- Session.getLines 0 0 session
  _ <- Session.getLength session
  _ <- Session.getTextRange range session
  Session.insert position "" session
  Session.remove range session
  Session.setUndoSelect true session
  Session.replace range "" session
  Session.indentRows 0 0 "" session
  Session.outdentRows range session
  _ <- Session.moveLinesUp 0 0 session
  _ <- Session.moveLinesDown 0 0 session
  _ <- Session.duplicateLines 0 0 session
  Session.setUseWrapMode true session
  _ <- Session.getUseWrapMode session
  Session.setWrapLimitRange 0 0 session
  _ <- Session.adjustWrapLimit 0 session
  _ <- Session.getWrapLimit session
  _ <- Session.getWrapLimitRange session
  _ <- Session.getDisplayTokens "" 0 session
  _ <- Session.getStringScreenWidth "" 0 0 session
  _ <- Session.getRowLength 0 session
  _ <- Session.getScreenLastRowColumn 0 session
  _ <- Session.getDocumentLastRowColumn 0 0 session
  _ <- Session.getDocumentLastRowColumnPosition 0 0 session
  _ <- Session.getRowSplitData session
  _ <- Session.getScreenTabSize 0 session
  _ <- Session.screenToDocumentPosition 0 0 session
  _ <- Session.documentToScreenPosition 0 0 session
  _ <- Session.documentToScreenColumn 0 0 session
  _ <- Session.documentToScreenRow 0 0 session
  _ <- Session.getScreenLength session

  Editor.selectMoreLines 0 editor
  Editor.setKeyboardHandler "" editor
  _ <- Editor.getKeyboardHandler editor
  Editor.setSession session editor
  _ <- Editor.getSession editor
  _ <- Editor.setValue "" Nothing editor
  _ <- Editor.getValue editor
  _ <- Editor.getSelection editor
  Editor.resize Nothing editor
  Editor.setTheme "" editor
  _ <- Editor.getTheme editor
  Editor.setStyle "" editor
  Editor.unsetStyle editor
  Editor.setFontSize "" editor
  Editor.focus editor
  _ <- Editor.isFocused editor
  Editor.blur editor
  _ <- Editor.getCopyText editor
  Editor.insert "" editor
  Editor.setOverwrite true editor
  _ <- Editor.getOverwrite editor
  Editor.toggleOverwrite editor
  Editor.setScrollSpeed 0.0 editor
  _ <- Editor.getScrollSpeed editor
  Editor.setDragDelay 0.0 editor
  _ <- Editor.getDragDelay editor
  Editor.setSelectionStyle "" editor
  _ <- Editor.getSelectionStyle editor
  Editor.setHighlightActiveLine true editor
  _ <- Editor.getHighlightActiveLine editor
  Editor.setHighlightSelectedWord true editor
  _ <- Editor.getHighlightSelectedWord editor
  Editor.setShowInvisibles true editor
  _ <- Editor.getShowInvisibles editor
  Editor.setShowPrintMargin true editor
  _ <- Editor.getShowPrintMargin editor
  Editor.setPrintMarginColumn 0 editor
  _ <- Editor.getPrintMarginColumn editor
  Editor.setReadOnly true editor
  _ <- Editor.getReadOnly editor
  Editor.setBehavioursEnabled true editor
  _ <- Editor.getBehavioursEnabled editor
  Editor.setWrapBehavioursEnabled true editor
  _ <- Editor.getWrapBehavioursEnabled editor
  Editor.setShowFoldWidgets true editor
  _ <- Editor.getShowFoldWidgets editor
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
  _ <- Editor.getNumberAt editor
  Editor.modifyNumber 0.0 editor
  Editor.removeLines editor
  _ <- Editor.moveLinesDown editor
  _ <- Editor.moveLinesUp editor
  _ <- Editor.copyLinesUp editor
  _ <- Editor.copyLinesDown editor
  _ <- Editor.getFirstVisibleRow editor
  _ <- Editor.getLastVisibleRow editor
  _ <- Editor.isRowVisible 0 editor
  _ <- Editor.isRowFullyVisible 0 editor
  Editor.selectPageDown editor
  Editor.selectPageUp editor
  Editor.gotoPageDown editor
  Editor.gotoPageUp editor
  Editor.scrollPageDown editor
  Editor.scrollPageUp editor
  Editor.scrollToRow editor
  Editor.centerSelection editor
  _ <- Editor.getCursorPosition editor
  _ <- Editor.getCursorPositionScreen editor
  _ <- Editor.getSelectionRange editor
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
  _ <- Editor.getLastSearchOptions editor
  Editor.find "" Nothing Nothing editor
  Editor.findNext Nothing Nothing editor
  Editor.findPrevious Nothing Nothing editor
  Editor.undo editor
  Editor.redo editor
  Editor.destroy editor

  _ <- Range.isEmpty range
  _ <- Range.isEqual range range
  _ <- Range.toString range
  _ <- Range.contains 0 0 range
  _ <- Range.compareRange range range
  _ <- Range.comparePoint range range
  _ <- Range.containsRange range range
  _ <- Range.intersects range range
  _ <- Range.isEnd 0 0 range
  _ <- Range.isStart 0 0 range
  Range.setStart 0 0 range
  Range.setEnd 0 0 range
  _ <- Range.inside 0 0 range
  _ <- Range.insideStart 0 0 range
  _ <- Range.insideEnd 0 0 range
  _ <- Range.compare 0 0 range
  _ <- Range.compareStart 0 0 range
  _ <- Range.compareEnd 0 0 range
  _ <- Range.compareInside 0 0 range
  _ <- Range.clipRows 0 0 range
  _ <- Range.extend 0 0 range
  _ <- Range.isMultiLine range
  _ <- Range.clone range
  _ <- Range.collapseRows range
  _ <- Range.toScreenRange session range
  _ <- Range.fromPoints range range

  _ <- ScrollBar.getWidth scrollBar
  ScrollBar.setHeight 0 scrollBar
  ScrollBar.setInnerHeight 0 scrollBar
  ScrollBar.setScrollTop 0 scrollBar

  _ <- Search.find session search
  _ <- Search.findAll session search
  _ <- Search.replace "" "" search

  selection <- Session.getSelection session

  Selection.moveCursorWordLeft selection
  Selection.moveCursorWordRight selection
  Selection.fromOrientedRange range selection
  _ <- Selection.getAllRanges selection
  Selection.addRange range selection
  _ <- Selection.isEmpty selection
  _ <- Selection.isMultiLine selection
  _ <- Selection.getCursor selection
  Selection.setSelectionAnchor 0 0 selection
  _ <- Selection.getSelectionAnchor selection
  _ <- Selection.getSelectionLead selection
  Selection.shiftSelection 0 selection
  _ <- Selection.isBackwards selection
  _ <- Selection.getRange selection
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
  _ <- Selection.getWordRange selection
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

  _ <- UndoManager.undo Nothing undoManager
  UndoManager.redo true undoManager
  UndoManager.reset undoManager
  _ <- UndoManager.hasUndo undoManager
  _ <- UndoManager.hasRedo undoManager
  pure unit
