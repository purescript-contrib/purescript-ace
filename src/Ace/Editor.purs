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
  , setNavigateWithinSoftTabs
  , setPlaceholder
  , getKeyBinding
  ) where

import Prelude

import Ace.Types (KeyBinding, Editor, EditSession, VirtualRenderer, SearchOptions, Position, Range, Selection, PasteEvent)
import Effect (Effect)
import Data.Function.Uncurried (Fn2, runFn2, Fn3, runFn3, Fn4, runFn4, Fn5, runFn5)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Web.HTML.HTMLElement (HTMLElement)

foreign import onImpl
  :: forall ev a
   . Fn3 String (ev -> Effect a) Editor (Effect Unit)

onBlur
  :: forall a
   . Editor
  -> (Effect a)
  -> Effect Unit
onBlur self fn = runFn3 onImpl "blur" (\_ -> fn) self

onFocus
  :: forall a
   . Editor
  -> (Effect a)
  -> Effect Unit
onFocus self fn = runFn3 onImpl "focus" (\_ -> fn) self

onCopy
  :: forall a
   . Editor
  -> (String -> Effect a)
  -> Effect Unit
onCopy self fn = runFn3 onImpl "copy" fn self

onPaste
  :: forall a
   . Editor
  -> (PasteEvent -> Effect a)
  -> Effect Unit
onPaste self fn = runFn3 onImpl "paste" fn self

foreign import getPasteEventText
  :: PasteEvent -> Effect String

foreign import setPasteEventTextImpl
  :: Fn2 String PasteEvent (Effect Unit)

setPasteEventText :: String -> PasteEvent -> Effect Unit
setPasteEventText text e = runFn2 setPasteEventTextImpl text e

onChangeSession
  :: Editor
  -> ( { oldSession :: EditSession, session :: EditSession }
       -> Effect Unit
     )
  -> Effect Unit
onChangeSession self fn = runFn3 onImpl "changeSession" fn self

onChangeSelectionStyle
  :: Editor -> Effect Unit -> Effect Unit
onChangeSelectionStyle self fn =
  runFn3 onImpl "changeSelectionStyle" (\_ -> fn) self

foreign import getRenderer
  :: Editor -> Effect VirtualRenderer

foreign import isInMultiSelectMode
  :: Editor -> Effect Boolean

foreign import selectMoreLinesImpl
  :: Fn2 Int Editor (Effect Unit)

selectMoreLines :: Int -> Editor -> Effect Unit
selectMoreLines n self = runFn2 selectMoreLinesImpl n self

foreign import getContainer
  :: Editor -> Effect HTMLElement

foreign import setKeyboardHandlerImpl
  :: Fn2 String Editor (Effect Unit)

setKeyboardHandler :: String -> Editor -> Effect Unit
setKeyboardHandler keyboardHandler self =
  runFn2 setKeyboardHandlerImpl keyboardHandler self

foreign import getKeyboardHandler
  :: Editor -> Effect String

foreign import setSessionImpl
  :: Fn2 EditSession Editor (Effect Unit)

setSession :: EditSession -> Editor -> Effect Unit
setSession session self = runFn2 setSessionImpl session self

foreign import getSession
  :: Editor -> Effect EditSession

foreign import setValueImpl
  :: Fn3 String (Nullable Int) Editor (Effect String)

setValue
  :: String -> Maybe Int -> Editor -> Effect String
setValue val cursorPos self = runFn3 setValueImpl val (toNullable cursorPos) self

foreign import getValue
  :: Editor -> Effect String

foreign import getSelection
  :: Editor -> Effect Selection

foreign import resizeImpl
  :: Fn2 (Nullable Boolean) Editor (Effect Unit)

resize :: Maybe Boolean -> Editor -> Effect Unit
resize force self = runFn2 resizeImpl (toNullable force) self

foreign import setThemeImpl
  :: Fn2 String Editor (Effect Unit)

setTheme :: String -> Editor -> Effect Unit
setTheme theme self = runFn2 setThemeImpl theme self

foreign import getTheme :: Editor -> Effect String

foreign import setStyleImpl
  :: Fn2 String Editor (Effect Unit)

setStyle :: String -> Editor -> Effect Unit
setStyle style self = runFn2 setStyleImpl style self

foreign import unsetStyle
  :: Editor -> Effect Unit

foreign import setFontSizeImpl
  :: Fn2 String Editor (Effect Unit)

setFontSize :: String -> Editor -> Effect Unit
setFontSize size self = runFn2 setFontSizeImpl size self

foreign import focus :: Editor -> Effect Unit

foreign import isFocused :: Editor -> Effect Unit

foreign import blur :: Editor -> Effect Unit

foreign import getCopyText :: Editor -> Effect String

foreign import insertImpl
  :: Fn2 String Editor (Effect Unit)

insert :: String -> Editor -> Effect Unit
insert text self = runFn2 insertImpl text self

foreign import setOverwriteImpl
  :: Fn2 Boolean Editor (Effect Unit)

setOverwrite :: Boolean -> Editor -> Effect Unit
setOverwrite overwrite self = runFn2 setOverwriteImpl overwrite self

foreign import getOverwrite :: Editor -> Effect Boolean

foreign import toggleOverwrite :: Editor -> Effect Unit

foreign import setScrollSpeedImpl
  :: Fn2 Number Editor (Effect Unit)

setScrollSpeed :: Number -> Editor -> Effect Unit
setScrollSpeed speed self = runFn2 setScrollSpeedImpl speed self

foreign import getScrollSpeed
  :: Editor -> Effect Number

foreign import setDragDelayImpl
  :: Fn2 Number Editor (Effect Unit)

setDragDelay :: Number -> Editor -> Effect Unit
setDragDelay dragDelay self = runFn2 setDragDelayImpl dragDelay self

foreign import getDragDelay
  :: Editor -> Effect Number

foreign import setSelectionStyleImpl
  :: Fn2 String Editor (Effect Unit)

setSelectionStyle :: String -> Editor -> Effect Unit
setSelectionStyle style self = runFn2 setSelectionStyleImpl style self

foreign import getSelectionStyle
  :: Editor -> Effect String

foreign import setHighlightActiveLineImpl
  :: Fn2 Boolean Editor (Effect Unit)

setHighlightActiveLine
  :: Boolean -> Editor -> Effect Unit
setHighlightActiveLine shouldHighlight self =
  runFn2 setHighlightActiveLineImpl shouldHighlight self

foreign import getHighlightActiveLine
  :: Editor -> Effect Unit

foreign import setHighlightSelectedWordImpl
  :: Fn2 Boolean Editor (Effect Unit)

setHighlightSelectedWord
  :: Boolean -> Editor -> Effect Unit
setHighlightSelectedWord shouldHighlight self =
  runFn2 setHighlightSelectedWordImpl shouldHighlight self

foreign import getHighlightSelectedWord
  :: Editor -> Effect Boolean

foreign import setShowInvisiblesImpl
  :: Fn2 Boolean Editor (Effect Unit)

setShowInvisibles :: Boolean -> Editor -> Effect Unit
setShowInvisibles showInvisibles self =
  runFn2 setShowInvisiblesImpl showInvisibles self

foreign import getShowInvisibles
  :: Editor -> Effect Boolean

foreign import setShowPrintMarginImpl
  :: Fn2 Boolean Editor (Effect Unit)

setShowPrintMargin :: Boolean -> Editor -> Effect Unit
setShowPrintMargin showPrintMargin self =
  runFn2 setShowPrintMarginImpl showPrintMargin self

foreign import getShowPrintMargin
  :: Editor -> Effect Boolean

foreign import setPrintMarginColumnImpl
  :: Fn2 Int Editor (Effect Unit)

setPrintMarginColumn :: Int -> Editor -> Effect Unit
setPrintMarginColumn showPrintMargin self =
  runFn2 setPrintMarginColumnImpl showPrintMargin self

foreign import getPrintMarginColumn
  :: Editor -> Effect Int

foreign import setReadOnlyImpl
  :: Fn2 Boolean Editor (Effect Unit)

setReadOnly :: Boolean -> Editor -> Effect Unit
setReadOnly readOnly self = runFn2 setReadOnlyImpl readOnly self

foreign import getReadOnly :: Editor -> Effect Boolean

foreign import setBehavioursEnabledImpl
  :: Fn2 Boolean Editor (Effect Unit)

setBehavioursEnabled :: Boolean -> Editor -> Effect Unit
setBehavioursEnabled enabled self = runFn2 setBehavioursEnabledImpl enabled self

foreign import getBehavioursEnabled
  :: Editor -> Effect Boolean

foreign import setWrapBehavioursEnabledImpl
  :: Fn2 Boolean Editor (Effect Unit)

setWrapBehavioursEnabled
  :: Boolean -> Editor -> Effect Unit
setWrapBehavioursEnabled enabled self =
  runFn2 setWrapBehavioursEnabledImpl enabled self

foreign import getWrapBehavioursEnabled
  :: Editor -> Effect Unit

foreign import setShowFoldWidgetsImpl
  :: Fn2 Boolean Editor (Effect Unit)

setShowFoldWidgets :: Boolean -> Editor -> Effect Unit
setShowFoldWidgets show self = runFn2 setShowFoldWidgetsImpl show self

foreign import getShowFoldWidgets
  :: Editor -> Effect Unit

foreign import removeImpl
  :: Fn2 String Editor (Effect Unit)

remove :: String -> Editor -> Effect Unit
remove dir self = runFn2 removeImpl dir self

foreign import removeWordRight :: Editor -> Effect Unit

foreign import removeWordLeft :: Editor -> Effect Unit

foreign import removeToLineStart :: Editor -> Effect Unit

foreign import removeToLineEnd :: Editor -> Effect Unit

foreign import splitLine :: Editor -> Effect Unit

foreign import transposeLetters :: Editor -> Effect Unit

foreign import toLowerCase :: Editor -> Effect Unit

foreign import toUpperCase :: Editor -> Effect Unit

foreign import indent :: Editor -> Effect Unit

foreign import blockIndent :: Editor -> Effect Unit

foreign import blockOutdentImpl
  :: Fn2 (Nullable String) Editor (Effect Unit)

blockOutdent :: Maybe String -> Editor -> Effect Unit
blockOutdent arg self = runFn2 blockOutdentImpl (toNullable arg) self

foreign import toggleCommentLines
  :: Editor -> Effect Unit

foreign import getNumberAt :: Editor -> Effect Number

foreign import modifyNumberImpl
  :: Fn2 Number Editor (Effect Unit)

modifyNumber :: Number -> Editor -> Effect Unit
modifyNumber amount self = runFn2 modifyNumberImpl amount self

foreign import removeLines :: Editor -> Effect Unit

foreign import moveLinesDown :: Editor -> Effect Int

foreign import moveLinesUp :: Editor -> Effect Int

foreign import copyLinesUp :: Editor -> Effect Int

foreign import copyLinesDown :: Editor -> Effect Int

foreign import getFirstVisibleRow :: Editor -> Effect Int

foreign import getLastVisibleRow :: Editor -> Effect Int

foreign import isRowVisibleImpl :: Fn2 Int Editor (Effect Boolean)

isRowVisible :: Int -> Editor -> Effect Boolean
isRowVisible row self = runFn2 isRowVisibleImpl row self

foreign import isRowFullyVisibleImpl
  :: Fn2 Int Editor (Effect Boolean)

isRowFullyVisible :: Int -> Editor -> Effect Boolean
isRowFullyVisible row self = runFn2 isRowFullyVisibleImpl row self

foreign import selectPageDown :: Editor -> Effect Unit

foreign import selectPageUp :: Editor -> Effect Unit

foreign import gotoPageDown :: Editor -> Effect Unit

foreign import gotoPageUp :: Editor -> Effect Unit

foreign import scrollPageDown :: Editor -> Effect Unit

foreign import scrollPageUp :: Editor -> Effect Unit

foreign import scrollToRow :: Editor -> Effect Unit

foreign import scrollToLineImpl :: Fn5 Int Boolean Boolean (Effect Unit) Editor (Effect Unit)

scrollToLine
  :: Int -> Boolean -> Boolean -> Effect Unit -> Editor -> Effect Unit
scrollToLine line center animate callback self =
  runFn5 scrollToLineImpl line center animate callback self

foreign import centerSelection :: Editor -> Effect Unit

foreign import getCursorPosition
  :: Editor -> Effect Position

foreign import getCursorPositionScreen
  :: Editor -> Effect Int

foreign import getSelectionRange :: Editor -> Effect Range

foreign import selectAll :: Editor -> Effect Unit

foreign import clearSelection :: Editor -> Effect Unit

foreign import moveCursorToImpl
  :: Fn4 Int (Nullable Int) (Nullable Boolean) Editor (Effect Unit)

moveCursorTo
  :: Int -> Maybe Int -> Maybe Boolean -> Editor -> Effect Unit
moveCursorTo row column animate self =
  runFn4 moveCursorToImpl row (toNullable column) (toNullable animate) self

foreign import moveCursorToPositionImpl
  :: Fn2 Position Editor (Effect Unit)

moveCursorToPosition
  :: Position -> Editor -> Effect Unit
moveCursorToPosition position self = runFn2 moveCursorToPositionImpl position self

foreign import jumpToMatching :: Editor -> Effect Unit

foreign import gotoLineImpl
  :: Fn4 Int (Nullable Int) (Nullable Boolean) Editor (Effect Unit)

gotoLine
  :: Int -> Maybe Int -> Maybe Boolean -> Editor -> Effect Unit
gotoLine lineNumber column animate self =
  runFn4 gotoLineImpl lineNumber (toNullable column) (toNullable animate) self

foreign import navigateToImpl
  :: Fn3 Int Int Editor (Effect Unit)

navigateTo :: Int -> Int -> Editor -> Effect Unit
navigateTo row column self = runFn3 navigateToImpl row column self

foreign import navigateUpImpl
  :: Fn2 (Nullable Int) Editor (Effect Unit)

navigateUp :: Maybe Int -> Editor -> Effect Unit
navigateUp times self = runFn2 navigateUpImpl (toNullable times) self

foreign import navigateDownImpl
  :: Fn2 (Nullable Int) Editor (Effect Unit)

navigateDown :: Maybe Int -> Editor -> Effect Unit
navigateDown times self = runFn2 navigateDownImpl (toNullable times) self

foreign import navigateLeftImpl :: Fn2 (Nullable Int) Editor (Effect Unit)

navigateLeft :: Maybe Int -> Editor -> Effect Unit
navigateLeft times self = runFn2 navigateLeftImpl (toNullable times) self

foreign import navigateRightImpl
  :: Fn2 Int Editor (Effect Unit)

navigateRight :: Int -> Editor -> Effect Unit
navigateRight times self = runFn2 navigateRightImpl times self

foreign import navigateLineStart :: Editor -> Effect Unit

foreign import navigateLineEnd :: Editor -> Effect Unit

foreign import navigateFileEnd :: Editor -> Effect Unit

foreign import navigateFileStart :: Editor -> Effect Unit

foreign import navigateWordRight :: Editor -> Effect Unit

foreign import navigateWordLeft :: Editor -> Effect Unit

foreign import replaceImpl
  :: Fn3 String (Nullable SearchOptions) Editor (Effect Unit)

replace
  :: String -> Maybe SearchOptions -> Editor -> Effect Unit
replace replacement options self =
  runFn3 replaceImpl replacement (toNullable options) self

foreign import replaceAllImpl
  :: Fn3 String (Nullable SearchOptions) Editor (Effect Unit)

replaceAll
  :: String -> Maybe SearchOptions -> Editor -> Effect Unit
replaceAll replacement options self =
  runFn3 replaceAllImpl replacement (toNullable options) self

foreign import getLastSearchOptions
  :: Editor -> Effect SearchOptions

foreign import findImpl
  :: Fn4 String (Nullable SearchOptions) (Nullable Boolean) Editor (Effect Unit)

find
  :: String -> Maybe SearchOptions -> Maybe Boolean -> Editor -> Effect Unit
find needle options animate self =
  runFn4 findImpl needle (toNullable options) (toNullable animate) self

foreign import findNextImpl
  :: Fn3 (Nullable SearchOptions) (Nullable Boolean) Editor (Effect Unit)

findNext
  :: Maybe SearchOptions
  -> Maybe Boolean
  -> Editor
  -> Effect Unit
findNext options animate self =
  runFn3 findNextImpl (toNullable options) (toNullable animate) self

foreign import findPreviousImpl
  :: Fn3 (Nullable SearchOptions) (Nullable Boolean) Editor (Effect Unit)

findPrevious
  :: Maybe SearchOptions
  -> Maybe Boolean
  -> Editor
  -> Effect Unit
findPrevious options animate self =
  runFn3 findPreviousImpl (toNullable options) (toNullable animate) self

foreign import undo :: Editor -> Effect Unit

foreign import redo :: Editor -> Effect Unit

foreign import destroy :: Editor -> Effect Unit

foreign import createImpl
  :: Fn2 VirtualRenderer (Nullable EditSession) (Effect Editor)

create
  :: VirtualRenderer
  -> Maybe EditSession
  -> Effect Editor
create renderer session = runFn2 createImpl renderer (toNullable session)

foreign import setOption
  :: forall a. String -> a -> Editor -> Effect Unit

setMinLines :: Int -> Editor -> Effect Unit
setMinLines = setOption "minLines"

setMaxLines :: Int -> Editor -> Effect Unit
setMaxLines = setOption "maxLines"

setAutoScrollEditorIntoView
  :: Boolean -> Editor -> Effect Unit
setAutoScrollEditorIntoView = setOption "autoScrollEditorIntoView"

setEnableBasicAutocompletion
  :: Boolean -> Editor -> Effect Unit
setEnableBasicAutocompletion = setOption "enableBasicAutocompletion"

setEnableLiveAutocompletion
  :: Boolean -> Editor -> Effect Unit
setEnableLiveAutocompletion = setOption "enableLiveAutocompletion"

setEnableSnippets
  :: Boolean -> Editor -> Effect Unit
setEnableSnippets = setOption "enableSnippets"

setNavigateWithinSoftTabs
  :: Boolean -> Editor -> Effect Unit
setNavigateWithinSoftTabs = setOption "navigateWithinSoftTabs"

setPlaceholder
  :: String -> Editor -> Effect Unit
setPlaceholder = setOption "placeholder"

foreign import getKeyBinding
  :: Editor -> Effect KeyBinding
