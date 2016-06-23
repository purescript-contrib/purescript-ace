module Ace.Editor
  ( blockIndent
  , blockOutdent
  , blur
  , centerSelection
  , clearSelection
  , copyLinesDown
  , copyLinesUp
  , create
  , destroy
  , find
  , findNext
  , findPrevious
  , focus
  , getBehavioursEnabled
  , getContainer
  , getCopyText
  , getCursorPosition
  , getCursorPositionScreen
  , getDragDelay
  , getFirstVisibleRow
  , getHighlightActiveLine
  , getHighlightSelectedWord
  , getKeyboardHandler
  , getLastSearchOptions
  , getLastVisibleRow
  , getNumberAt
  , getOverwrite
  , getPasteEventText
  , setPasteEventText
  , getPrintMarginColumn
  , getReadOnly
  , getRenderer
  , getScrollSpeed
  , getSelection
  , getSelectionRange
  , getSelectionStyle
  , getSession
  , getShowFoldWidgets
  , getShowInvisibles
  , getShowPrintMargin
  , getTheme
  , getValue
  , getWrapBehavioursEnabled
  , gotoLine
  , gotoPageDown
  , gotoPageUp
  , indent
  , insert
  , isFocused
  , isInMultiSelectMode
  , isRowFullyVisible
  , isRowVisible
  , jumpToMatching
  , modifyNumber
  , moveCursorTo
  , moveCursorToPosition
  , moveLinesDown
  , moveLinesUp
  , navigateDown
  , navigateFileEnd
  , navigateFileStart
  , navigateLeft
  , navigateLineEnd
  , navigateLineStart
  , navigateRight
  , navigateTo
  , navigateUp
  , navigateWordLeft
  , navigateWordRight
  , onBlur
  , onFocus
  , onCopy
  , onPaste
  , onChangeSession
  , onChangeSelectionStyle
  , redo
  , remove
  , removeLines
  , removeToLineEnd
  , removeToLineStart
  , removeWordLeft
  , removeWordRight
  , replaceAll
  , replace
  , resize
  , scrollPageDown
  , scrollPageUp
  , scrollToLine
  , scrollToRow
  , selectAll
  , selectMoreLines
  , selectPageDown
  , selectPageUp
  , setBehavioursEnabled
  , setDragDelay
  , setFontSize
  , setHighlightActiveLine
  , setHighlightSelectedWord
  , setKeyboardHandler
  , setOverwrite
  , setPrintMarginColumn
  , setReadOnly
  , setScrollSpeed
  , setSelectionStyle
  , setSession
  , setShowFoldWidgets
  , setShowInvisibles
  , setShowPrintMargin
  , setStyle
  , setTheme
  , setValue
  , setWrapBehavioursEnabled
  , splitLine
  , toLowerCase
  , toUpperCase
  , toggleCommentLines
  , toggleOverwrite
  , transposeLetters
  , undo
  , unsetStyle
  , setMinLines
  , setMaxLines
  , setAutoScrollEditorIntoView
  , setEnableLiveAutocompletion
  , setEnableBasicAutocompletion
  , setEnableSnippets
  , getKeyBinding
  ) where

import Prelude

import Ace.Types (KeyBinding, ACE, Editor, EditSession, VirtualRenderer, SearchOptions, Position, Range, Selection, PasteEvent)
import Control.Monad.Eff (Eff)
import Data.Function.Uncurried (Fn2, runFn2, Fn3, runFn3, Fn4, runFn4, Fn5, runFn5)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import DOM.HTML.Types (HTMLElement)

foreign import onImpl
  :: forall ev eff a
   . Fn3 String (ev -> Eff (ace :: ACE | eff) a) Editor (Eff (ace :: ACE | eff) Unit)

onBlur
  :: forall eff a
   . Editor -> (Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onBlur self fn = runFn3 onImpl "blur" (\_ -> fn) self

onFocus
  :: forall eff a
   . Editor -> (Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onFocus self fn = runFn3 onImpl "focus" (\_ -> fn) self

onCopy
  :: forall eff a
   . Editor -> (String -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onCopy self fn = runFn3 onImpl "copy" fn self

onPaste
  :: forall eff a
   . Editor
  -> (PasteEvent -> Eff (ace :: ACE | eff) a)
  -> Eff (ace :: ACE | eff) Unit
onPaste self fn = runFn3 onImpl "paste" fn self

foreign import getPasteEventText
  :: forall eff. PasteEvent -> Eff (ace :: ACE | eff) String

foreign import setPasteEventTextImpl
  :: forall eff. Fn2 String PasteEvent (Eff (ace :: ACE | eff) Unit)

setPasteEventText :: forall eff. String -> PasteEvent -> Eff (ace :: ACE | eff) Unit
setPasteEventText text e = runFn2 setPasteEventTextImpl text e

onChangeSession
  :: forall eff
   . Editor
  -> ({ oldSession :: EditSession, session :: EditSession }
     -> Eff (ace :: ACE | eff) Unit)
  -> Eff (ace :: ACE | eff) Unit
onChangeSession self fn = runFn3 onImpl "changeSession" fn self

onChangeSelectionStyle
  :: forall eff
   . Editor -> Eff (ace :: ACE | eff) Unit -> Eff (ace :: ACE | eff) Unit
onChangeSelectionStyle self fn =
  runFn3 onImpl "changeSelectionStyle" (\_ -> fn) self

foreign import getRenderer
  :: forall eff. Editor -> Eff (ace :: ACE | eff) VirtualRenderer

foreign import isInMultiSelectMode
  :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean

foreign import selectMoreLinesImpl
  :: forall eff. Fn2 Int Editor (Eff (ace :: ACE | eff) Unit)

selectMoreLines :: forall eff. Int -> Editor -> Eff (ace :: ACE | eff) Unit
selectMoreLines n self = runFn2 selectMoreLinesImpl n self

foreign import getContainer
  :: forall eff. Editor -> Eff (ace :: ACE | eff) HTMLElement

foreign import setKeyboardHandlerImpl
  :: forall eff. Fn2 String Editor (Eff (ace :: ACE | eff) Unit)

setKeyboardHandler :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
setKeyboardHandler keyboardHandler self =
  runFn2 setKeyboardHandlerImpl keyboardHandler self

foreign import getKeyboardHandler
  :: forall eff. Editor -> Eff (ace :: ACE | eff) String

foreign import setSessionImpl
  :: forall eff. Fn2 EditSession Editor (Eff (ace :: ACE | eff) Unit)

setSession :: forall eff. EditSession -> Editor -> Eff (ace :: ACE | eff) Unit
setSession session self = runFn2 setSessionImpl session self

foreign import getSession
  :: forall eff. Editor -> Eff (ace :: ACE | eff) EditSession

foreign import setValueImpl
  :: forall eff. Fn3 String (Nullable Int) Editor (Eff (ace :: ACE | eff) String)

setValue
  :: forall eff. String -> Maybe Int -> Editor -> Eff (ace :: ACE | eff) String
setValue val cursorPos self = runFn3 setValueImpl val (toNullable cursorPos) self

foreign import getValue
  :: forall eff. Editor -> Eff (ace :: ACE | eff) String

foreign import getSelection
  :: forall eff. Editor -> Eff (ace :: ACE | eff) Selection

foreign import resizeImpl
  :: forall eff. Fn2 (Nullable Boolean) Editor (Eff (ace :: ACE | eff) Unit)

resize :: forall eff. Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
resize force self = runFn2 resizeImpl (toNullable force) self

foreign import setThemeImpl
  :: forall eff. Fn2 String Editor (Eff (ace :: ACE | eff) Unit)

setTheme :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
setTheme theme self = runFn2 setThemeImpl theme self

foreign import getTheme :: forall eff. Editor -> Eff (ace :: ACE | eff) String

foreign import setStyleImpl
  :: forall eff. Fn2 String Editor (Eff (ace :: ACE | eff) Unit)

setStyle :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
setStyle style self = runFn2 setStyleImpl style self

foreign import unsetStyle
  :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import setFontSizeImpl
  :: forall eff. Fn2 String Editor (Eff (ace :: ACE | eff) Unit)

setFontSize :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
setFontSize size self = runFn2 setFontSizeImpl size self

foreign import focus :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import isFocused :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import blur :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import getCopyText :: forall eff. Editor -> Eff (ace :: ACE | eff) String

foreign import insertImpl
  :: forall eff. Fn2 String Editor (Eff (ace :: ACE | eff) Unit)

insert :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
insert text self = runFn2 insertImpl text self

foreign import setOverwriteImpl
  :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setOverwrite :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setOverwrite overwrite self = runFn2 setOverwriteImpl overwrite self

foreign import getOverwrite :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean

foreign import toggleOverwrite :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import setScrollSpeedImpl
  :: forall eff. Fn2 Number Editor (Eff (ace :: ACE | eff) Unit)

setScrollSpeed :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Unit
setScrollSpeed speed self = runFn2 setScrollSpeedImpl speed self

foreign import getScrollSpeed
  :: forall eff. Editor -> Eff (ace :: ACE | eff) Number

foreign import setDragDelayImpl
  :: forall eff. Fn2 Number Editor (Eff (ace :: ACE | eff) Unit)

setDragDelay :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Unit
setDragDelay dragDelay self = runFn2 setDragDelayImpl dragDelay self

foreign import getDragDelay
  :: forall eff. Editor -> Eff (ace :: ACE | eff) Number

foreign import setSelectionStyleImpl
  :: forall eff. Fn2 String Editor (Eff (ace :: ACE | eff) Unit)

setSelectionStyle :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
setSelectionStyle style self = runFn2 setSelectionStyleImpl style self

foreign import getSelectionStyle
  :: forall eff. Editor -> Eff (ace :: ACE | eff) String

foreign import setHighlightActiveLineImpl
  :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setHighlightActiveLine
  :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setHighlightActiveLine shouldHighlight self =
  runFn2 setHighlightActiveLineImpl shouldHighlight self

foreign import getHighlightActiveLine
  :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import setHighlightSelectedWordImpl
  :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setHighlightSelectedWord
  :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setHighlightSelectedWord shouldHighlight self =
  runFn2 setHighlightSelectedWordImpl shouldHighlight self

foreign import getHighlightSelectedWord
  :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean

foreign import setShowInvisiblesImpl
  :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setShowInvisibles :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setShowInvisibles showInvisibles self =
  runFn2 setShowInvisiblesImpl showInvisibles self

foreign import getShowInvisibles
  :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean

foreign import setShowPrintMarginImpl
  :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setShowPrintMargin :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setShowPrintMargin showPrintMargin self =
  runFn2 setShowPrintMarginImpl showPrintMargin self

foreign import getShowPrintMargin
  :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean

foreign import setPrintMarginColumnImpl
  :: forall eff. Fn2 Int Editor (Eff (ace :: ACE | eff) Unit)

setPrintMarginColumn :: forall eff. Int -> Editor -> Eff (ace :: ACE | eff) Unit
setPrintMarginColumn showPrintMargin self =
  runFn2 setPrintMarginColumnImpl showPrintMargin self

foreign import getPrintMarginColumn
  :: forall eff. Editor -> Eff (ace :: ACE | eff) Int

foreign import setReadOnlyImpl
  :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setReadOnly :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setReadOnly readOnly self = runFn2 setReadOnlyImpl readOnly self

foreign import getReadOnly :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean

foreign import setBehavioursEnabledImpl
  :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setBehavioursEnabled :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setBehavioursEnabled enabled self = runFn2 setBehavioursEnabledImpl enabled self

foreign import getBehavioursEnabled
  :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean

foreign import setWrapBehavioursEnabledImpl
  :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setWrapBehavioursEnabled
  :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setWrapBehavioursEnabled enabled self =
  runFn2 setWrapBehavioursEnabledImpl enabled self

foreign import getWrapBehavioursEnabled
  :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import setShowFoldWidgetsImpl
  :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setShowFoldWidgets :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setShowFoldWidgets show self = runFn2 setShowFoldWidgetsImpl show self

foreign import getShowFoldWidgets
  :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import removeImpl
  :: forall eff. Fn2 String Editor (Eff (ace :: ACE | eff) Unit)

remove :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
remove dir self = runFn2 removeImpl dir self

foreign import removeWordRight :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import removeWordLeft :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import removeToLineStart :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import removeToLineEnd :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import splitLine :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import transposeLetters :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import toLowerCase :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import toUpperCase :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import indent :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import blockIndent :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import blockOutdentImpl
  :: forall eff. Fn2 (Nullable String) Editor (Eff (ace :: ACE | eff) Unit)

blockOutdent :: forall eff. Maybe String -> Editor -> Eff (ace :: ACE | eff) Unit
blockOutdent arg self = runFn2 blockOutdentImpl (toNullable arg) self

foreign import toggleCommentLines
  :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import getNumberAt :: forall eff. Editor -> Eff (ace :: ACE | eff) Number

foreign import modifyNumberImpl
  :: forall eff. Fn2 Number Editor (Eff (ace :: ACE | eff) Unit)

modifyNumber :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Unit
modifyNumber amount self = runFn2 modifyNumberImpl amount self

foreign import removeLines :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import moveLinesDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Int

foreign import moveLinesUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Int

foreign import copyLinesUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Int

foreign import copyLinesDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Int

foreign import getFirstVisibleRow :: forall eff. Editor -> Eff (ace :: ACE | eff) Int

foreign import getLastVisibleRow :: forall eff. Editor -> Eff (ace :: ACE | eff) Int

foreign import isRowVisibleImpl :: forall eff. Fn2 Int Editor (Eff (ace :: ACE | eff) Boolean)

isRowVisible :: forall eff. Int -> Editor -> Eff (ace :: ACE | eff) Boolean
isRowVisible row self = runFn2 isRowVisibleImpl row self

foreign import isRowFullyVisibleImpl
  :: forall eff. Fn2 Int Editor (Eff (ace :: ACE | eff) Boolean)

isRowFullyVisible :: forall eff. Int -> Editor -> Eff (ace :: ACE | eff) Boolean
isRowFullyVisible row self = runFn2 isRowFullyVisibleImpl row self

foreign import selectPageDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import selectPageUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import gotoPageDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import gotoPageUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import scrollPageDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import scrollPageUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import scrollToRow :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import scrollToLineImpl :: forall eff. Fn5 Int Boolean Boolean (Eff (ace :: ACE | eff) Unit) Editor (Eff (ace :: ACE | eff) Unit)

scrollToLine
  :: forall eff
   . Int -> Boolean -> Boolean -> Eff (ace :: ACE | eff) Unit -> Editor
  -> Eff (ace :: ACE | eff) Unit
scrollToLine line center animate callback self =
  runFn5 scrollToLineImpl line center animate callback self

foreign import centerSelection :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import getCursorPosition
  :: forall eff. Editor -> Eff (ace :: ACE | eff) Position

foreign import getCursorPositionScreen
  :: forall eff. Editor -> Eff (ace :: ACE | eff) Int

foreign import getSelectionRange :: forall eff. Editor -> Eff (ace :: ACE | eff) Range

foreign import selectAll :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import clearSelection :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import moveCursorToImpl
  :: forall eff
   . Fn4 Int (Nullable Int) (Nullable Boolean) Editor (Eff (ace :: ACE | eff) Unit)

moveCursorTo
  :: forall eff
   . Int -> Maybe Int -> Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
moveCursorTo row column animate self =
  runFn4 moveCursorToImpl row (toNullable column) (toNullable animate) self

foreign import moveCursorToPositionImpl
  :: forall eff. Fn2 Position Editor (Eff (ace :: ACE | eff) Unit)

moveCursorToPosition
  :: forall eff. Position -> Editor -> Eff (ace :: ACE | eff) Unit
moveCursorToPosition position self = runFn2 moveCursorToPositionImpl position self

foreign import jumpToMatching :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import gotoLineImpl
  :: forall eff
   . Fn4 Int (Nullable Int) (Nullable Boolean) Editor (Eff (ace :: ACE | eff) Unit)

gotoLine
  :: forall eff
   . Int -> Maybe Int -> Maybe Boolean -> Editor
  -> Eff (ace :: ACE | eff) Unit
gotoLine lineNumber column animate self =
  runFn4 gotoLineImpl lineNumber (toNullable column) (toNullable animate) self

foreign import navigateToImpl
  :: forall eff. Fn3 Int Int Editor (Eff (ace :: ACE | eff) Unit)

navigateTo :: forall eff. Int -> Int -> Editor -> Eff (ace :: ACE | eff) Unit
navigateTo row column self = runFn3 navigateToImpl row column self

foreign import navigateUpImpl
  :: forall eff. Fn2 (Nullable Int) Editor (Eff (ace :: ACE | eff) Unit)

navigateUp :: forall eff. Maybe Int -> Editor -> Eff (ace :: ACE | eff) Unit
navigateUp times self = runFn2 navigateUpImpl (toNullable times) self

foreign import navigateDownImpl
  :: forall eff. Fn2 (Nullable Int) Editor (Eff (ace :: ACE | eff) Unit)

navigateDown :: forall eff. Maybe Int -> Editor -> Eff (ace :: ACE | eff) Unit
navigateDown times self = runFn2 navigateDownImpl (toNullable times) self

foreign import navigateLeftImpl :: forall eff. Fn2 (Nullable Int) Editor (Eff (ace :: ACE | eff) Unit)

navigateLeft :: forall eff. Maybe Int -> Editor -> Eff (ace :: ACE | eff) Unit
navigateLeft times self = runFn2 navigateLeftImpl (toNullable times) self

foreign import navigateRightImpl
  :: forall eff. Fn2 Int Editor (Eff (ace :: ACE | eff) Unit)

navigateRight :: forall eff. Int -> Editor -> Eff (ace :: ACE | eff) Unit
navigateRight times self = runFn2 navigateRightImpl times self

foreign import navigateLineStart :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import navigateLineEnd :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import navigateFileEnd :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import navigateFileStart :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import navigateWordRight :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import navigateWordLeft :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import replaceImpl
  :: forall eff
   . Fn3 String (Nullable SearchOptions) Editor (Eff (ace :: ACE | eff) Unit)

replace
  :: forall eff
   . String -> Maybe SearchOptions -> Editor
  -> Eff (ace :: ACE | eff) Unit
replace replacement options self =
  runFn3 replaceImpl replacement (toNullable options) self

foreign import replaceAllImpl
  :: forall eff
   . Fn3 String (Nullable SearchOptions) Editor (Eff (ace :: ACE | eff) Unit)

replaceAll
  :: forall eff
   . String -> Maybe SearchOptions -> Editor
  -> Eff (ace :: ACE | eff) Unit
replaceAll replacement options self =
  runFn3 replaceAllImpl replacement (toNullable options) self

foreign import getLastSearchOptions
  :: forall eff. Editor -> Eff (ace :: ACE | eff) SearchOptions

foreign import findImpl
  :: forall eff
   . Fn4 String (Nullable SearchOptions) (Nullable Boolean) Editor
         (Eff (ace :: ACE | eff) Unit)

find
  :: forall eff
   . String -> Maybe SearchOptions -> Maybe Boolean -> Editor
  -> Eff (ace :: ACE | eff) Unit
find needle options animate self =
  runFn4 findImpl needle (toNullable options) (toNullable animate) self

foreign import findNextImpl
  :: forall eff
   . Fn3 (Nullable SearchOptions) (Nullable Boolean) Editor
         (Eff (ace :: ACE | eff) Unit)

findNext
  :: forall eff
   . Maybe SearchOptions -> Maybe Boolean -> Editor
  -> Eff (ace :: ACE | eff) Unit
findNext options animate self =
  runFn3 findNextImpl (toNullable options) (toNullable animate) self

foreign import findPreviousImpl
  :: forall eff
   . Fn3 (Nullable SearchOptions) (Nullable Boolean) Editor
         (Eff (ace :: ACE | eff) Unit)

findPrevious
  :: forall eff
   . Maybe SearchOptions -> Maybe Boolean -> Editor
  -> Eff (ace :: ACE | eff) Unit
findPrevious options animate self =
  runFn3 findPreviousImpl (toNullable options) (toNullable animate) self

foreign import undo :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import redo :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import destroy :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit

foreign import createImpl
  :: forall eff
   . Fn2 VirtualRenderer (Nullable EditSession) (Eff (ace :: ACE | eff) Editor)

create
  :: forall eff
   . VirtualRenderer -> Maybe EditSession
  -> Eff (ace :: ACE | eff) Editor
create renderer session = runFn2 createImpl renderer (toNullable session)

foreign import setOption
  :: forall a eff. String -> a -> Editor -> Eff (ace :: ACE | eff) Unit

setMinLines :: forall eff. Int -> Editor ->  Eff (ace :: ACE | eff) Unit
setMinLines = setOption "minLines"

setMaxLines :: forall eff. Int -> Editor ->  Eff (ace :: ACE | eff) Unit
setMaxLines = setOption "maxLines"

setAutoScrollEditorIntoView
  :: forall eff. Boolean -> Editor ->  Eff (ace :: ACE | eff) Unit
setAutoScrollEditorIntoView = setOption "autoScrollEditorIntoView"

setEnableBasicAutocompletion
  :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setEnableBasicAutocompletion = setOption "enableBasicAutocompletion"

setEnableLiveAutocompletion
  :: forall eff . Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setEnableLiveAutocompletion = setOption "enableLiveAutocompletion"

setEnableSnippets
  :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setEnableSnippets = setOption "enableSnippets"


foreign import getKeyBinding
  :: forall eff. Editor -> Eff (ace :: ACE | eff) KeyBinding
