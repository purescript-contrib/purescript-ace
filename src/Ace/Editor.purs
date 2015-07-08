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
  ) where

import Prelude

import Data.Maybe
import Data.Function

import Control.Monad.Eff

import Ace.Types
import Data.DOM.Simple.Types
import Data.Nullable

foreign import onImpl :: forall ev eff a. Fn3 String (ev -> Eff (ace :: ACE | eff) a) Editor (Eff (ace :: ACE | eff) Unit)

onBlur :: forall eff a. Editor -> (Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onBlur self fn = runFn3 onImpl "blur" (\_ -> fn) self

onFocus :: forall eff a. Editor -> (Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onFocus self fn = runFn3 onImpl "focus" (\_ -> fn) self

onCopy :: forall eff a. Editor -> (String -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onCopy self fn = runFn3 onImpl "copy" fn self

onPaste :: forall eff a. Editor -> (PasteEvent -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onPaste self fn = runFn3 onImpl "paste" fn self

foreign import getPasteEventText :: forall eff. PasteEvent -> Eff (ace :: ACE | eff) String

foreign import setPasteEventTextImpl :: forall eff. Fn2 String PasteEvent (Eff (ace :: ACE | eff) Unit)

setPasteEventText :: forall eff. String -> PasteEvent -> Eff (ace :: ACE | eff) Unit
setPasteEventText text e = runFn2 setPasteEventTextImpl text e

onChangeSession :: forall eff. Editor -> ({ oldSession :: EditSession, session :: EditSession } -> Eff (ace :: ACE | eff) Unit) -> Eff (ace :: ACE | eff) Unit
onChangeSession self fn = runFn3 onImpl "changeSession" fn self

onChangeSelectionStyle :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit -> Eff (ace :: ACE | eff) Unit
onChangeSelectionStyle self fn = runFn3 onImpl "changeSelectionStyle" (\_ -> fn) self

foreign import getRenderer :: forall eff. Editor -> Eff (ace :: ACE | eff) VirtualRenderer

foreign import isInMultiSelectMode :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean

foreign import selectMoreLinesImpl :: forall eff. Fn2 Int Editor (Eff (ace :: ACE | eff) Unit)

selectMoreLines :: forall eff. Int -> Editor -> Eff (ace :: ACE | eff) Unit
selectMoreLines n self = runFn2 selectMoreLinesImpl n self

foreign import getContainer :: forall eff. Editor -> Eff (ace :: ACE | eff) HTMLElement

foreign import setKeyboardHandlerImpl :: forall eff. Fn2 String Editor (Eff (ace :: ACE | eff) Unit)

setKeyboardHandler :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
setKeyboardHandler keyboardHandler self = runFn2 setKeyboardHandlerImpl keyboardHandler self

foreign import getKeyboardHandlerImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) String)

getKeyboardHandler :: forall eff. Editor -> Eff (ace :: ACE | eff) String
getKeyboardHandler self = runFn1 getKeyboardHandlerImpl self

foreign import setSessionImpl :: forall eff. Fn2 EditSession Editor (Eff (ace :: ACE | eff) Unit)

setSession :: forall eff. EditSession -> Editor -> Eff (ace :: ACE | eff) Unit
setSession session self = runFn2 setSessionImpl session self

foreign import getSessionImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) EditSession)

getSession :: forall eff. Editor -> Eff (ace :: ACE | eff) EditSession
getSession self = runFn1 getSessionImpl self

foreign import setValueImpl :: forall eff. Fn3 String (Nullable Int) Editor (Eff (ace :: ACE | eff) String)

setValue :: forall eff. String -> Maybe Int -> Editor -> Eff (ace :: ACE | eff) String
setValue val cursorPos self = runFn3 setValueImpl val (toNullable cursorPos) self

foreign import getValueImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) String)

getValue :: forall eff. Editor -> Eff (ace :: ACE | eff) String
getValue self = runFn1 getValueImpl self

foreign import getSelectionImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Selection)

getSelection :: forall eff. Editor -> Eff (ace :: ACE | eff) Selection
getSelection self = runFn1 getSelectionImpl self

foreign import resizeImpl :: forall eff. Fn2 (Nullable Boolean) Editor (Eff (ace :: ACE | eff) Unit)

resize :: forall eff. Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
resize force self = runFn2 resizeImpl (toNullable force) self

foreign import setThemeImpl :: forall eff. Fn2 String Editor (Eff (ace :: ACE | eff) Unit)

setTheme :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
setTheme theme self = runFn2 setThemeImpl theme self

foreign import getThemeImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) String)

getTheme :: forall eff. Editor -> Eff (ace :: ACE | eff) String
getTheme self = runFn1 getThemeImpl self

foreign import setStyleImpl :: forall eff. Fn2 String Editor (Eff (ace :: ACE | eff) Unit)

setStyle :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
setStyle style self = runFn2 setStyleImpl style self

foreign import unsetStyleImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

unsetStyle :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
unsetStyle self = runFn1 unsetStyleImpl self

foreign import setFontSizeImpl :: forall eff. Fn2 String Editor (Eff (ace :: ACE | eff) Unit)

setFontSize :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
setFontSize size self = runFn2 setFontSizeImpl size self

foreign import focusImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

focus :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
focus self = runFn1 focusImpl self

foreign import isFocusedImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

isFocused :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
isFocused self = runFn1 isFocusedImpl self

foreign import blurImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

blur :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
blur self = runFn1 blurImpl self

foreign import getCopyTextImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) String)

getCopyText :: forall eff. Editor -> Eff (ace :: ACE | eff) String
getCopyText self = runFn1 getCopyTextImpl self

foreign import insertImpl :: forall eff. Fn2 String Editor (Eff (ace :: ACE | eff) Unit)

insert :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
insert text self = runFn2 insertImpl text self

foreign import setOverwriteImpl :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setOverwrite :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setOverwrite overwrite self = runFn2 setOverwriteImpl overwrite self

foreign import getOverwriteImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Boolean)

getOverwrite :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean
getOverwrite self = runFn1 getOverwriteImpl self

foreign import toggleOverwriteImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

toggleOverwrite :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
toggleOverwrite self = runFn1 toggleOverwriteImpl self

foreign import setScrollSpeedImpl :: forall eff. Fn2 Number Editor (Eff (ace :: ACE | eff) Unit)

setScrollSpeed :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Unit
setScrollSpeed speed self = runFn2 setScrollSpeedImpl speed self

foreign import getScrollSpeedImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Number)

getScrollSpeed :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
getScrollSpeed self = runFn1 getScrollSpeedImpl self

foreign import setDragDelayImpl :: forall eff. Fn2 Number Editor (Eff (ace :: ACE | eff) Unit)

setDragDelay :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Unit
setDragDelay dragDelay self = runFn2 setDragDelayImpl dragDelay self

foreign import getDragDelayImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Number)

getDragDelay :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
getDragDelay self = runFn1 getDragDelayImpl self

foreign import setSelectionStyleImpl :: forall eff. Fn2 String Editor (Eff (ace :: ACE | eff) Unit)

setSelectionStyle :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
setSelectionStyle style self = runFn2 setSelectionStyleImpl style self

foreign import getSelectionStyleImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) String)

getSelectionStyle :: forall eff. Editor -> Eff (ace :: ACE | eff) String
getSelectionStyle self = runFn1 getSelectionStyleImpl self

foreign import setHighlightActiveLineImpl :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setHighlightActiveLine :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setHighlightActiveLine shouldHighlight self = runFn2 setHighlightActiveLineImpl shouldHighlight self

foreign import getHighlightActiveLineImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

getHighlightActiveLine :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
getHighlightActiveLine self = runFn1 getHighlightActiveLineImpl self

foreign import setHighlightSelectedWordImpl :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setHighlightSelectedWord :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setHighlightSelectedWord shouldHighlight self = runFn2 setHighlightSelectedWordImpl shouldHighlight self

foreign import getHighlightSelectedWordImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Boolean)

getHighlightSelectedWord :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean
getHighlightSelectedWord self = runFn1 getHighlightSelectedWordImpl self

foreign import setShowInvisiblesImpl :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setShowInvisibles :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setShowInvisibles showInvisibles self = runFn2 setShowInvisiblesImpl showInvisibles self

foreign import getShowInvisiblesImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Boolean)

getShowInvisibles :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean
getShowInvisibles self = runFn1 getShowInvisiblesImpl self

foreign import setShowPrintMarginImpl :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setShowPrintMargin :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setShowPrintMargin showPrintMargin self = runFn2 setShowPrintMarginImpl showPrintMargin self

foreign import getShowPrintMarginImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Boolean)

getShowPrintMargin :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean
getShowPrintMargin self = runFn1 getShowPrintMarginImpl self

foreign import setPrintMarginColumnImpl :: forall eff. Fn2 Int Editor (Eff (ace :: ACE | eff) Unit)

setPrintMarginColumn :: forall eff. Int -> Editor -> Eff (ace :: ACE | eff) Unit
setPrintMarginColumn showPrintMargin self = runFn2 setPrintMarginColumnImpl showPrintMargin self

foreign import getPrintMarginColumnImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Int)

getPrintMarginColumn :: forall eff. Editor -> Eff (ace :: ACE | eff) Int
getPrintMarginColumn self = runFn1 getPrintMarginColumnImpl self

foreign import setReadOnlyImpl :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setReadOnly :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setReadOnly readOnly self = runFn2 setReadOnlyImpl readOnly self

foreign import getReadOnlyImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Boolean)

getReadOnly :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean
getReadOnly self = runFn1 getReadOnlyImpl self

foreign import setBehavioursEnabledImpl :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setBehavioursEnabled :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setBehavioursEnabled enabled self = runFn2 setBehavioursEnabledImpl enabled self

foreign import getBehavioursEnabledImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Boolean)

getBehavioursEnabled :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean
getBehavioursEnabled self = runFn1 getBehavioursEnabledImpl self

foreign import setWrapBehavioursEnabledImpl :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setWrapBehavioursEnabled :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setWrapBehavioursEnabled enabled self = runFn2 setWrapBehavioursEnabledImpl enabled self

foreign import getWrapBehavioursEnabledImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

getWrapBehavioursEnabled :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
getWrapBehavioursEnabled self = runFn1 getWrapBehavioursEnabledImpl self

foreign import setShowFoldWidgetsImpl :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setShowFoldWidgets :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setShowFoldWidgets show self = runFn2 setShowFoldWidgetsImpl show self

foreign import getShowFoldWidgetsImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

getShowFoldWidgets :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
getShowFoldWidgets self = runFn1 getShowFoldWidgetsImpl self

foreign import removeImpl :: forall eff. Fn2 String Editor (Eff (ace :: ACE | eff) Unit)

remove :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
remove dir self = runFn2 removeImpl dir self

foreign import removeWordRightImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

removeWordRight :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
removeWordRight self = runFn1 removeWordRightImpl self

foreign import removeWordLeftImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

removeWordLeft :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
removeWordLeft self = runFn1 removeWordLeftImpl self

foreign import removeToLineStartImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

removeToLineStart :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
removeToLineStart self = runFn1 removeToLineStartImpl self

foreign import removeToLineEndImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

removeToLineEnd :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
removeToLineEnd self = runFn1 removeToLineEndImpl self

foreign import splitLineImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

splitLine :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
splitLine self = runFn1 splitLineImpl self

foreign import transposeLettersImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

transposeLetters :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
transposeLetters self = runFn1 transposeLettersImpl self

foreign import toLowerCaseImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

toLowerCase :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
toLowerCase self = runFn1 toLowerCaseImpl self

foreign import toUpperCaseImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

toUpperCase :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
toUpperCase self = runFn1 toUpperCaseImpl self

foreign import indentImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

indent :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
indent self = runFn1 indentImpl self

foreign import blockIndentImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

blockIndent :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
blockIndent self = runFn1 blockIndentImpl self

foreign import blockOutdentImpl :: forall eff. Fn2 (Nullable String) Editor (Eff (ace :: ACE | eff) Unit)

blockOutdent :: forall eff. Maybe String -> Editor -> Eff (ace :: ACE | eff) Unit
blockOutdent arg self = runFn2 blockOutdentImpl (toNullable arg) self

foreign import toggleCommentLinesImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

toggleCommentLines :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
toggleCommentLines self = runFn1 toggleCommentLinesImpl self

foreign import getNumberAtImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Number)

getNumberAt :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
getNumberAt self = runFn1 getNumberAtImpl self

foreign import modifyNumberImpl :: forall eff. Fn2 Number Editor (Eff (ace :: ACE | eff) Unit)

modifyNumber :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Unit
modifyNumber amount self = runFn2 modifyNumberImpl amount self

foreign import removeLinesImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

removeLines :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
removeLines self = runFn1 removeLinesImpl self

foreign import moveLinesDownImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Int)

moveLinesDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Int
moveLinesDown self = runFn1 moveLinesDownImpl self

foreign import moveLinesUpImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Int)

moveLinesUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Int
moveLinesUp self = runFn1 moveLinesUpImpl self

foreign import copyLinesUpImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Int)

copyLinesUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Int
copyLinesUp self = runFn1 copyLinesUpImpl self

foreign import copyLinesDownImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Int)

copyLinesDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Int
copyLinesDown self = runFn1 copyLinesDownImpl self

foreign import getFirstVisibleRowImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Int)

getFirstVisibleRow :: forall eff. Editor -> Eff (ace :: ACE | eff) Int
getFirstVisibleRow self = runFn1 getFirstVisibleRowImpl self

foreign import getLastVisibleRowImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Int)

getLastVisibleRow :: forall eff. Editor -> Eff (ace :: ACE | eff) Int
getLastVisibleRow self = runFn1 getLastVisibleRowImpl self

foreign import isRowVisibleImpl :: forall eff. Fn2 Int Editor (Eff (ace :: ACE | eff) Boolean)

isRowVisible :: forall eff. Int -> Editor -> Eff (ace :: ACE | eff) Boolean
isRowVisible row self = runFn2 isRowVisibleImpl row self

foreign import isRowFullyVisibleImpl :: forall eff. Fn2 Int Editor (Eff (ace :: ACE | eff) Boolean)

isRowFullyVisible :: forall eff. Int -> Editor -> Eff (ace :: ACE | eff) Boolean
isRowFullyVisible row self = runFn2 isRowFullyVisibleImpl row self

foreign import selectPageDownImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

selectPageDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
selectPageDown self = runFn1 selectPageDownImpl self

foreign import selectPageUpImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

selectPageUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
selectPageUp self = runFn1 selectPageUpImpl self

foreign import gotoPageDownImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

gotoPageDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
gotoPageDown self = runFn1 gotoPageDownImpl self

foreign import gotoPageUpImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

gotoPageUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
gotoPageUp self = runFn1 gotoPageUpImpl self

foreign import scrollPageDownImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

scrollPageDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
scrollPageDown self = runFn1 scrollPageDownImpl self

foreign import scrollPageUpImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

scrollPageUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
scrollPageUp self = runFn1 scrollPageUpImpl self

foreign import scrollToRowImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

scrollToRow :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
scrollToRow self = runFn1 scrollToRowImpl self

foreign import scrollToLineImpl :: forall eff. Fn5 Int Boolean Boolean (Eff (ace :: ACE | eff) Unit) Editor (Eff (ace :: ACE | eff) Unit)

scrollToLine :: forall eff. Int -> Boolean -> Boolean -> Eff (ace :: ACE | eff) Unit -> Editor -> Eff (ace :: ACE | eff) Unit
scrollToLine line center animate callback self = runFn5 scrollToLineImpl line center animate callback self

foreign import centerSelectionImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

centerSelection :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
centerSelection self = runFn1 centerSelectionImpl self

foreign import getCursorPositionImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Position)

getCursorPosition :: forall eff. Editor -> Eff (ace :: ACE | eff) Position
getCursorPosition self = runFn1 getCursorPositionImpl self

foreign import getCursorPositionScreenImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Int)

getCursorPositionScreen :: forall eff. Editor -> Eff (ace :: ACE | eff) Int
getCursorPositionScreen self = runFn1 getCursorPositionScreenImpl self

foreign import getSelectionRangeImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Range)

getSelectionRange :: forall eff. Editor -> Eff (ace :: ACE | eff) Range
getSelectionRange self = runFn1 getSelectionRangeImpl self

foreign import selectAllImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

selectAll :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
selectAll self = runFn1 selectAllImpl self

foreign import clearSelectionImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

clearSelection :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
clearSelection self = runFn1 clearSelectionImpl self

foreign import moveCursorToImpl :: forall eff. Fn4 Int (Nullable Int) (Nullable Boolean) Editor (Eff (ace :: ACE | eff) Unit)

moveCursorTo :: forall eff. Int -> Maybe Int -> Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
moveCursorTo row column animate self = runFn4 moveCursorToImpl row (toNullable column) (toNullable animate) self

foreign import moveCursorToPositionImpl :: forall eff. Fn2 Position Editor (Eff (ace :: ACE | eff) Unit)

moveCursorToPosition :: forall eff. Position -> Editor -> Eff (ace :: ACE | eff) Unit
moveCursorToPosition position self = runFn2 moveCursorToPositionImpl position self

foreign import jumpToMatchingImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

jumpToMatching :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
jumpToMatching self = runFn1 jumpToMatchingImpl self

foreign import gotoLineImpl :: forall eff. Fn4 Int (Nullable Int) (Nullable Boolean) Editor (Eff (ace :: ACE | eff) Unit)

gotoLine :: forall eff. Int -> Maybe Int -> Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
gotoLine lineNumber column animate self = runFn4 gotoLineImpl lineNumber (toNullable column) (toNullable animate) self

foreign import navigateToImpl :: forall eff. Fn3 Int Int Editor (Eff (ace :: ACE | eff) Unit)

navigateTo :: forall eff. Int -> Int -> Editor -> Eff (ace :: ACE | eff) Unit
navigateTo row column self = runFn3 navigateToImpl row column self

foreign import navigateUpImpl :: forall eff. Fn2 (Nullable Int) Editor (Eff (ace :: ACE | eff) Unit)

navigateUp :: forall eff. Maybe Int -> Editor -> Eff (ace :: ACE | eff) Unit
navigateUp times self = runFn2 navigateUpImpl (toNullable times) self

foreign import navigateDownImpl :: forall eff. Fn2 (Nullable Int) Editor (Eff (ace :: ACE | eff) Unit)

navigateDown :: forall eff. Maybe Int -> Editor -> Eff (ace :: ACE | eff) Unit
navigateDown times self = runFn2 navigateDownImpl (toNullable times) self

foreign import navigateLeftImpl :: forall eff. Fn2 (Nullable Int) Editor (Eff (ace :: ACE | eff) Unit)

navigateLeft :: forall eff. Maybe Int -> Editor -> Eff (ace :: ACE | eff) Unit
navigateLeft times self = runFn2 navigateLeftImpl (toNullable times) self

foreign import navigateRightImpl :: forall eff. Fn2 Int Editor (Eff (ace :: ACE | eff) Unit)

navigateRight :: forall eff. Int -> Editor -> Eff (ace :: ACE | eff) Unit
navigateRight times self = runFn2 navigateRightImpl times self

foreign import navigateLineStartImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

navigateLineStart :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
navigateLineStart self = runFn1 navigateLineStartImpl self

foreign import navigateLineEndImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

navigateLineEnd :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
navigateLineEnd self = runFn1 navigateLineEndImpl self

foreign import navigateFileEndImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

navigateFileEnd :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
navigateFileEnd self = runFn1 navigateFileEndImpl self

foreign import navigateFileStartImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

navigateFileStart :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
navigateFileStart self = runFn1 navigateFileStartImpl self

foreign import navigateWordRightImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

navigateWordRight :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
navigateWordRight self = runFn1 navigateWordRightImpl self

foreign import navigateWordLeftImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

navigateWordLeft :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
navigateWordLeft self = runFn1 navigateWordLeftImpl self

foreign import replaceImpl :: forall eff. Fn3 String (Nullable SearchOptions) Editor (Eff (ace :: ACE | eff) Unit)

replace :: forall eff. String -> Maybe SearchOptions -> Editor -> Eff (ace :: ACE | eff) Unit
replace replacement options self = runFn3 replaceImpl replacement (toNullable options) self

foreign import replaceAllImpl :: forall eff. Fn3 String (Nullable SearchOptions) Editor (Eff (ace :: ACE | eff) Unit)

replaceAll :: forall eff. String -> Maybe SearchOptions -> Editor -> Eff (ace :: ACE | eff) Unit
replaceAll replacement options self = runFn3 replaceAllImpl replacement (toNullable options) self

foreign import getLastSearchOptionsImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) SearchOptions)

getLastSearchOptions :: forall eff. Editor -> Eff (ace :: ACE | eff) SearchOptions
getLastSearchOptions self = runFn1 getLastSearchOptionsImpl self

foreign import findImpl :: forall eff. Fn4 String (Nullable SearchOptions) (Nullable Boolean) Editor (Eff (ace :: ACE | eff) Unit)

find :: forall eff. String -> Maybe SearchOptions -> Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
find needle options animate self = runFn4 findImpl needle (toNullable options) (toNullable animate) self

foreign import findNextImpl :: forall eff. Fn3 (Nullable SearchOptions) (Nullable Boolean) Editor (Eff (ace :: ACE | eff) Unit)

findNext :: forall eff. Maybe SearchOptions -> Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
findNext options animate self = runFn3 findNextImpl (toNullable options) (toNullable animate) self

foreign import findPreviousImpl :: forall eff. Fn3 (Nullable SearchOptions) (Nullable Boolean) Editor (Eff (ace :: ACE | eff) Unit)

findPrevious :: forall eff. Maybe SearchOptions -> Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
findPrevious options animate self = runFn3 findPreviousImpl (toNullable options) (toNullable animate) self

foreign import undoImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

undo :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
undo self = runFn1 undoImpl self

foreign import redoImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

redo :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
redo self = runFn1 redoImpl self

foreign import destroyImpl :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

destroy :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
destroy self = runFn1 destroyImpl self

foreign import createImpl :: forall eff. Fn2 VirtualRenderer (Nullable EditSession) (Eff (ace :: ACE | eff) Editor)

create :: forall eff. VirtualRenderer -> Maybe EditSession -> Eff (ace :: ACE | eff) Editor
create renderer session = runFn2 createImpl renderer (toNullable session)
