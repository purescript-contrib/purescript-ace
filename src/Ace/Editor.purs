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

import Data.Maybe
import Data.Function

import Control.Monad.Eff

import Ace.Types
import Data.DOM.Simple.Types
import Data.Nullable

foreign import onImpl
  "function onImpl(event, fn, self) {\
  \  return function() {\
  \    return self.on(event, function(e) {\
  \      fn(e)();\
  \    });\
  \  };\
  \}" :: forall ev eff a. Fn3 String (ev -> Eff (ace :: ACE | eff) a) Editor (Eff (ace :: ACE | eff) Unit)

onBlur :: forall eff a. Editor -> (Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onBlur self fn = runFn3 onImpl "blur" (\_ -> fn) self

onFocus :: forall eff a. Editor -> (Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onFocus self fn = runFn3 onImpl "focus" (\_ -> fn) self

onCopy :: forall eff a. Editor -> (String -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onCopy self fn = runFn3 onImpl "copy" fn self

onPaste :: forall eff a. Editor -> (PasteEvent -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onPaste self fn = runFn3 onImpl "paste" fn self

foreign import getPasteEventText
  "function getPasteEventText(e) {\
  \  return function() {\
  \    return e.text;\
  \  };\
  \}" :: forall eff. PasteEvent -> Eff (ace :: ACE | eff) String

foreign import setPasteEventTextImpl
  "function setPasteEventTextImpl(text, e) {\
  \  return function() {\
  \    e.text = text;\
  \  };\
  \}" :: forall eff. Fn2 String PasteEvent (Eff (ace :: ACE | eff) Unit)

setPasteEventText :: forall eff. String -> PasteEvent -> Eff (ace :: ACE | eff) Unit
setPasteEventText text e = runFn2 setPasteEventTextImpl text e

onChangeSession :: forall eff. Editor -> ({ oldSession :: EditSession, session :: EditSession } -> Eff (ace :: ACE | eff) Unit) -> Eff (ace :: ACE | eff) Unit
onChangeSession self fn = runFn3 onImpl "changeSession" fn self

onChangeSelectionStyle :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit -> Eff (ace :: ACE | eff) Unit
onChangeSelectionStyle self fn = runFn3 onImpl "changeSelectionStyle" (\_ -> fn) self

foreign import getRenderer
  "function getRenderer(self) {\
  \  return function() {\
  \    return self.renderer;\
  \  };\
  \}" :: forall eff. Editor -> Eff (ace :: ACE | eff) VirtualRenderer

foreign import isInMultiSelectMode
  "function isInMultiSelectMode(self) {\
  \  return function() {\
  \    return self.inMultiSelectMode;\
  \  };\
  \}" :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean

foreign import selectMoreLinesImpl
  "function selectMoreLinesImpl(n, self) {\
  \  return function() {\
  \    return self.selectMoreLines(n);\
  \  };\
  \}" :: forall eff. Fn2 Number Editor (Eff (ace :: ACE | eff) Unit)

selectMoreLines :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Unit
selectMoreLines n self = runFn2 selectMoreLinesImpl n self

foreign import getContainer
  "function getContainer(self) {\
  \  return function() {\
  \    return self.container;\
  \  };\
  \}" :: forall eff. Editor -> Eff (ace :: ACE | eff) HTMLElement

foreign import setKeyboardHandlerImpl
  "function setKeyboardHandlerImpl(keyboardHandler, self) {\
  \  return function() {\
  \    return self.setKeyboardHandler(keyboardHandler);\
  \  };\
  \}" :: forall eff. Fn2 String Editor (Eff (ace :: ACE | eff) Unit)

setKeyboardHandler :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
setKeyboardHandler keyboardHandler self = runFn2 setKeyboardHandlerImpl keyboardHandler self

foreign import getKeyboardHandlerImpl
  "function getKeyboardHandlerImpl(self) {\
  \  return function() {\
  \    return self.getKeyboardHandler();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) String)

getKeyboardHandler :: forall eff. Editor -> Eff (ace :: ACE | eff) String
getKeyboardHandler self = runFn1 getKeyboardHandlerImpl self

foreign import setSessionImpl
  "function setSessionImpl(session, self) {\
  \  return function() {\
  \    return self.setSession(session);\
  \  };\
  \}" :: forall eff. Fn2 EditSession Editor (Eff (ace :: ACE | eff) Unit)

setSession :: forall eff. EditSession -> Editor -> Eff (ace :: ACE | eff) Unit
setSession session self = runFn2 setSessionImpl session self

foreign import getSessionImpl
  "function getSessionImpl(self) {\
  \  return function() {\
  \    return self.getSession();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) EditSession)

getSession :: forall eff. Editor -> Eff (ace :: ACE | eff) EditSession
getSession self = runFn1 getSessionImpl self

foreign import setValueImpl
  "function setValueImpl(val, cursorPos, self) {\
  \  return function() {\
  \    return self.setValue(val, cursorPos);\
  \  };\
  \}" :: forall eff. Fn3 String (Nullable Number) Editor (Eff (ace :: ACE | eff) String)

setValue :: forall eff. String -> Maybe Number -> Editor -> Eff (ace :: ACE | eff) String
setValue val cursorPos self = runFn3 setValueImpl val (toNullable cursorPos) self

foreign import getValueImpl
  "function getValueImpl(self) {\
  \  return function() {\
  \    return self.getValue();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) String)

getValue :: forall eff. Editor -> Eff (ace :: ACE | eff) String
getValue self = runFn1 getValueImpl self

foreign import getSelectionImpl
  "function getSelectionImpl(self) {\
  \  return function() {\
  \    return self.getSelection();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Selection)

getSelection :: forall eff. Editor -> Eff (ace :: ACE | eff) Selection
getSelection self = runFn1 getSelectionImpl self

foreign import resizeImpl
  "function resizeImpl(force, self) {\
  \  return function() {\
  \    return self.resize(force);\
  \  };\
  \}" :: forall eff. Fn2 (Nullable Boolean) Editor (Eff (ace :: ACE | eff) Unit)

resize :: forall eff. Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
resize force self = runFn2 resizeImpl (toNullable force) self

foreign import setThemeImpl
  "function setThemeImpl(theme, self) {\
  \  return function() {\
  \    return self.setTheme(theme);\
  \  };\
  \}" :: forall eff. Fn2 String Editor (Eff (ace :: ACE | eff) Unit)

setTheme :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
setTheme theme self = runFn2 setThemeImpl theme self

foreign import getThemeImpl
  "function getThemeImpl(self) {\
  \  return function() {\
  \    return self.getTheme();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) String)

getTheme :: forall eff. Editor -> Eff (ace :: ACE | eff) String
getTheme self = runFn1 getThemeImpl self

foreign import setStyleImpl
  "function setStyleImpl(style, self) {\
  \  return function() {\
  \    return self.setStyle(style);\
  \  };\
  \}" :: forall eff. Fn2 String Editor (Eff (ace :: ACE | eff) Unit)

setStyle :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
setStyle style self = runFn2 setStyleImpl style self

foreign import unsetStyleImpl
  "function unsetStyleImpl(self) {\
  \  return function() {\
  \    return self.unsetStyle();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

unsetStyle :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
unsetStyle self = runFn1 unsetStyleImpl self

foreign import setFontSizeImpl
  "function setFontSizeImpl(size, self) {\
  \  return function() {\
  \    return self.setFontSize(size);\
  \  };\
  \}" :: forall eff. Fn2 String Editor (Eff (ace :: ACE | eff) Unit)

setFontSize :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
setFontSize size self = runFn2 setFontSizeImpl size self

foreign import focusImpl
  "function focusImpl(self) {\
  \  return function() {\
  \    return self.focus();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

focus :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
focus self = runFn1 focusImpl self

foreign import isFocusedImpl
  "function isFocusedImpl(self) {\
  \  return function() {\
  \    return self.isFocused();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

isFocused :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
isFocused self = runFn1 isFocusedImpl self

foreign import blurImpl
  "function blurImpl(self) {\
  \  return function() {\
  \    return self.blur();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

blur :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
blur self = runFn1 blurImpl self

foreign import getCopyTextImpl
  "function getCopyTextImpl(self) {\
  \  return function() {\
  \    return self.getCopyText();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) String)

getCopyText :: forall eff. Editor -> Eff (ace :: ACE | eff) String
getCopyText self = runFn1 getCopyTextImpl self

foreign import insertImpl
  "function insertImpl(text, self) {\
  \  return function() {\
  \    return self.insert(text);\
  \  };\
  \}" :: forall eff. Fn2 String Editor (Eff (ace :: ACE | eff) Unit)

insert :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
insert text self = runFn2 insertImpl text self

foreign import setOverwriteImpl
  "function setOverwriteImpl(overwrite, self) {\
  \  return function() {\
  \    return self.setOverwrite(overwrite);\
  \  };\
  \}" :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setOverwrite :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setOverwrite overwrite self = runFn2 setOverwriteImpl overwrite self

foreign import getOverwriteImpl
  "function getOverwriteImpl(self) {\
  \  return function() {\
  \    return self.getOverwrite();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Boolean)

getOverwrite :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean
getOverwrite self = runFn1 getOverwriteImpl self

foreign import toggleOverwriteImpl
  "function toggleOverwriteImpl(self) {\
  \  return function() {\
  \    return self.toggleOverwrite();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

toggleOverwrite :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
toggleOverwrite self = runFn1 toggleOverwriteImpl self

foreign import setScrollSpeedImpl
  "function setScrollSpeedImpl(speed, self) {\
  \  return function() {\
  \    return self.setScrollSpeed(speed);\
  \  };\
  \}" :: forall eff. Fn2 Number Editor (Eff (ace :: ACE | eff) Unit)

setScrollSpeed :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Unit
setScrollSpeed speed self = runFn2 setScrollSpeedImpl speed self

foreign import getScrollSpeedImpl
  "function getScrollSpeedImpl(self) {\
  \  return function() {\
  \    return self.getScrollSpeed();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Number)

getScrollSpeed :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
getScrollSpeed self = runFn1 getScrollSpeedImpl self

foreign import setDragDelayImpl
  "function setDragDelayImpl(dragDelay, self) {\
  \  return function() {\
  \    return self.setDragDelay(dragDelay);\
  \  };\
  \}" :: forall eff. Fn2 Number Editor (Eff (ace :: ACE | eff) Unit)

setDragDelay :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Unit
setDragDelay dragDelay self = runFn2 setDragDelayImpl dragDelay self

foreign import getDragDelayImpl
  "function getDragDelayImpl(self) {\
  \  return function() {\
  \    return self.getDragDelay();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Number)

getDragDelay :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
getDragDelay self = runFn1 getDragDelayImpl self

foreign import setSelectionStyleImpl
  "function setSelectionStyleImpl(style, self) {\
  \  return function() {\
  \    return self.setSelectionStyle(style);\
  \  };\
  \}" :: forall eff. Fn2 String Editor (Eff (ace :: ACE | eff) Unit)

setSelectionStyle :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
setSelectionStyle style self = runFn2 setSelectionStyleImpl style self

foreign import getSelectionStyleImpl
  "function getSelectionStyleImpl(self) {\
  \  return function() {\
  \    return self.getSelectionStyle();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) String)

getSelectionStyle :: forall eff. Editor -> Eff (ace :: ACE | eff) String
getSelectionStyle self = runFn1 getSelectionStyleImpl self

foreign import setHighlightActiveLineImpl
  "function setHighlightActiveLineImpl(shouldHighlight, self) {\
  \  return function() {\
  \    return self.setHighlightActiveLine(shouldHighlight);\
  \  };\
  \}" :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setHighlightActiveLine :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setHighlightActiveLine shouldHighlight self = runFn2 setHighlightActiveLineImpl shouldHighlight self

foreign import getHighlightActiveLineImpl
  "function getHighlightActiveLineImpl(self) {\
  \  return function() {\
  \    return self.getHighlightActiveLine();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

getHighlightActiveLine :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
getHighlightActiveLine self = runFn1 getHighlightActiveLineImpl self

foreign import setHighlightSelectedWordImpl
  "function setHighlightSelectedWordImpl(shouldHighlight, self) {\
  \  return function() {\
  \    return self.setHighlightSelectedWord(shouldHighlight);\
  \  };\
  \}" :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setHighlightSelectedWord :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setHighlightSelectedWord shouldHighlight self = runFn2 setHighlightSelectedWordImpl shouldHighlight self

foreign import getHighlightSelectedWordImpl
  "function getHighlightSelectedWordImpl(self) {\
  \  return function() {\
  \    return self.getHighlightSelectedWord();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Boolean)

getHighlightSelectedWord :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean
getHighlightSelectedWord self = runFn1 getHighlightSelectedWordImpl self

foreign import setShowInvisiblesImpl
  "function setShowInvisiblesImpl(showInvisibles, self) {\
  \  return function() {\
  \    return self.setShowInvisibles(showInvisibles);\
  \  };\
  \}" :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setShowInvisibles :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setShowInvisibles showInvisibles self = runFn2 setShowInvisiblesImpl showInvisibles self

foreign import getShowInvisiblesImpl
  "function getShowInvisiblesImpl(self) {\
  \  return function() {\
  \    return self.getShowInvisibles();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Boolean)

getShowInvisibles :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean
getShowInvisibles self = runFn1 getShowInvisiblesImpl self

foreign import setShowPrintMarginImpl
  "function setShowPrintMarginImpl(showPrintMargin, self) {\
  \  return function() {\
  \    return self.setShowPrintMargin(showPrintMargin);\
  \  };\
  \}" :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setShowPrintMargin :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setShowPrintMargin showPrintMargin self = runFn2 setShowPrintMarginImpl showPrintMargin self

foreign import getShowPrintMarginImpl
  "function getShowPrintMarginImpl(self) {\
  \  return function() {\
  \    return self.getShowPrintMargin();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Boolean)

getShowPrintMargin :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean
getShowPrintMargin self = runFn1 getShowPrintMarginImpl self

foreign import setPrintMarginColumnImpl
  "function setPrintMarginColumnImpl(showPrintMargin, self) {\
  \  return function() {\
  \    return self.setPrintMarginColumn(showPrintMargin);\
  \  };\
  \}" :: forall eff. Fn2 Number Editor (Eff (ace :: ACE | eff) Unit)

setPrintMarginColumn :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Unit
setPrintMarginColumn showPrintMargin self = runFn2 setPrintMarginColumnImpl showPrintMargin self

foreign import getPrintMarginColumnImpl
  "function getPrintMarginColumnImpl(self) {\
  \  return function() {\
  \    return self.getPrintMarginColumn();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Number)

getPrintMarginColumn :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
getPrintMarginColumn self = runFn1 getPrintMarginColumnImpl self

foreign import setReadOnlyImpl
  "function setReadOnlyImpl(readOnly, self) {\
  \  return function() {\
  \    return self.setReadOnly(readOnly);\
  \  };\
  \}" :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setReadOnly :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setReadOnly readOnly self = runFn2 setReadOnlyImpl readOnly self

foreign import getReadOnlyImpl
  "function getReadOnlyImpl(self) {\
  \  return function() {\
  \    return self.getReadOnly();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Boolean)

getReadOnly :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean
getReadOnly self = runFn1 getReadOnlyImpl self

foreign import setBehavioursEnabledImpl
  "function setBehavioursEnabledImpl(enabled, self) {\
  \  return function() {\
  \    return self.setBehavioursEnabled(enabled);\
  \  };\
  \}" :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setBehavioursEnabled :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setBehavioursEnabled enabled self = runFn2 setBehavioursEnabledImpl enabled self

foreign import getBehavioursEnabledImpl
  "function getBehavioursEnabledImpl(self) {\
  \  return function() {\
  \    return self.getBehavioursEnabled();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Boolean)

getBehavioursEnabled :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean
getBehavioursEnabled self = runFn1 getBehavioursEnabledImpl self

foreign import setWrapBehavioursEnabledImpl
  "function setWrapBehavioursEnabledImpl(enabled, self) {\
  \  return function() {\
  \    return self.setWrapBehavioursEnabled(enabled);\
  \  };\
  \}" :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setWrapBehavioursEnabled :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setWrapBehavioursEnabled enabled self = runFn2 setWrapBehavioursEnabledImpl enabled self

foreign import getWrapBehavioursEnabledImpl
  "function getWrapBehavioursEnabledImpl(self) {\
  \  return function() {\
  \    return self.getWrapBehavioursEnabled();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

getWrapBehavioursEnabled :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
getWrapBehavioursEnabled self = runFn1 getWrapBehavioursEnabledImpl self

foreign import setShowFoldWidgetsImpl
  "function setShowFoldWidgetsImpl(show, self) {\
  \  return function() {\
  \    return self.setShowFoldWidgets(show);\
  \  };\
  \}" :: forall eff. Fn2 Boolean Editor (Eff (ace :: ACE | eff) Unit)

setShowFoldWidgets :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
setShowFoldWidgets show self = runFn2 setShowFoldWidgetsImpl show self

foreign import getShowFoldWidgetsImpl
  "function getShowFoldWidgetsImpl(self) {\
  \  return function() {\
  \    return self.getShowFoldWidgets();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

getShowFoldWidgets :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
getShowFoldWidgets self = runFn1 getShowFoldWidgetsImpl self

foreign import removeImpl
  "function removeImpl(dir, self) {\
  \  return function() {\
  \    return self.remove(dir);\
  \  };\
  \}" :: forall eff. Fn2 String Editor (Eff (ace :: ACE | eff) Unit)

remove :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
remove dir self = runFn2 removeImpl dir self

foreign import removeWordRightImpl
  "function removeWordRightImpl(self) {\
  \  return function() {\
  \    return self.removeWordRight();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

removeWordRight :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
removeWordRight self = runFn1 removeWordRightImpl self

foreign import removeWordLeftImpl
  "function removeWordLeftImpl(self) {\
  \  return function() {\
  \    return self.removeWordLeft();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

removeWordLeft :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
removeWordLeft self = runFn1 removeWordLeftImpl self

foreign import removeToLineStartImpl
  "function removeToLineStartImpl(self) {\
  \  return function() {\
  \    return self.removeToLineStart();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

removeToLineStart :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
removeToLineStart self = runFn1 removeToLineStartImpl self

foreign import removeToLineEndImpl
  "function removeToLineEndImpl(self) {\
  \  return function() {\
  \    return self.removeToLineEnd();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

removeToLineEnd :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
removeToLineEnd self = runFn1 removeToLineEndImpl self

foreign import splitLineImpl
  "function splitLineImpl(self) {\
  \  return function() {\
  \    return self.splitLine();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

splitLine :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
splitLine self = runFn1 splitLineImpl self

foreign import transposeLettersImpl
  "function transposeLettersImpl(self) {\
  \  return function() {\
  \    return self.transposeLetters();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

transposeLetters :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
transposeLetters self = runFn1 transposeLettersImpl self

foreign import toLowerCaseImpl
  "function toLowerCaseImpl(self) {\
  \  return function() {\
  \    return self.toLowerCase();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

toLowerCase :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
toLowerCase self = runFn1 toLowerCaseImpl self

foreign import toUpperCaseImpl
  "function toUpperCaseImpl(self) {\
  \  return function() {\
  \    return self.toUpperCase();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

toUpperCase :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
toUpperCase self = runFn1 toUpperCaseImpl self

foreign import indentImpl
  "function indentImpl(self) {\
  \  return function() {\
  \    return self.indent();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

indent :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
indent self = runFn1 indentImpl self

foreign import blockIndentImpl
  "function blockIndentImpl(self) {\
  \  return function() {\
  \    return self.blockIndent();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

blockIndent :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
blockIndent self = runFn1 blockIndentImpl self

foreign import blockOutdentImpl
  "function blockOutdentImpl(arg, self) {\
  \  return function() {\
  \    return self.blockOutdent(arg);\
  \  };\
  \}" :: forall eff. Fn2 (Nullable String) Editor (Eff (ace :: ACE | eff) Unit)

blockOutdent :: forall eff. Maybe String -> Editor -> Eff (ace :: ACE | eff) Unit
blockOutdent arg self = runFn2 blockOutdentImpl (toNullable arg) self

foreign import toggleCommentLinesImpl
  "function toggleCommentLinesImpl(self) {\
  \  return function() {\
  \    return self.toggleCommentLines();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

toggleCommentLines :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
toggleCommentLines self = runFn1 toggleCommentLinesImpl self

foreign import getNumberAtImpl
  "function getNumberAtImpl(self) {\
  \  return function() {\
  \    return self.getNumberAt();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Number)

getNumberAt :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
getNumberAt self = runFn1 getNumberAtImpl self

foreign import modifyNumberImpl
  "function modifyNumberImpl(amount, self) {\
  \  return function() {\
  \    return self.modifyNumber(amount);\
  \  };\
  \}" :: forall eff. Fn2 Number Editor (Eff (ace :: ACE | eff) Unit)

modifyNumber :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Unit
modifyNumber amount self = runFn2 modifyNumberImpl amount self

foreign import removeLinesImpl
  "function removeLinesImpl(self) {\
  \  return function() {\
  \    return self.removeLines();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

removeLines :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
removeLines self = runFn1 removeLinesImpl self

foreign import moveLinesDownImpl
  "function moveLinesDownImpl(self) {\
  \  return function() {\
  \    return self.moveLinesDown();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Number)

moveLinesDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
moveLinesDown self = runFn1 moveLinesDownImpl self

foreign import moveLinesUpImpl
  "function moveLinesUpImpl(self) {\
  \  return function() {\
  \    return self.moveLinesUp();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Number)

moveLinesUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
moveLinesUp self = runFn1 moveLinesUpImpl self

foreign import copyLinesUpImpl
  "function copyLinesUpImpl(self) {\
  \  return function() {\
  \    return self.copyLinesUp();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Number)

copyLinesUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
copyLinesUp self = runFn1 copyLinesUpImpl self

foreign import copyLinesDownImpl
  "function copyLinesDownImpl(self) {\
  \  return function() {\
  \    return self.copyLinesDown();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Number)

copyLinesDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
copyLinesDown self = runFn1 copyLinesDownImpl self

foreign import getFirstVisibleRowImpl
  "function getFirstVisibleRowImpl(self) {\
  \  return function() {\
  \    return self.getFirstVisibleRow();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Number)

getFirstVisibleRow :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
getFirstVisibleRow self = runFn1 getFirstVisibleRowImpl self

foreign import getLastVisibleRowImpl
  "function getLastVisibleRowImpl(self) {\
  \  return function() {\
  \    return self.getLastVisibleRow();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Number)

getLastVisibleRow :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
getLastVisibleRow self = runFn1 getLastVisibleRowImpl self

foreign import isRowVisibleImpl
  "function isRowVisibleImpl(row, self) {\
  \  return function() {\
  \    return self.isRowVisible(row);\
  \  };\
  \}" :: forall eff. Fn2 Number Editor (Eff (ace :: ACE | eff) Boolean)

isRowVisible :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Boolean
isRowVisible row self = runFn2 isRowVisibleImpl row self

foreign import isRowFullyVisibleImpl
  "function isRowFullyVisibleImpl(row, self) {\
  \  return function() {\
  \    return self.isRowFullyVisible(row);\
  \  };\
  \}" :: forall eff. Fn2 Number Editor (Eff (ace :: ACE | eff) Boolean)

isRowFullyVisible :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Boolean
isRowFullyVisible row self = runFn2 isRowFullyVisibleImpl row self

foreign import selectPageDownImpl
  "function selectPageDownImpl(self) {\
  \  return function() {\
  \    return self.selectPageDown();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

selectPageDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
selectPageDown self = runFn1 selectPageDownImpl self

foreign import selectPageUpImpl
  "function selectPageUpImpl(self) {\
  \  return function() {\
  \    return self.selectPageUp();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

selectPageUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
selectPageUp self = runFn1 selectPageUpImpl self

foreign import gotoPageDownImpl
  "function gotoPageDownImpl(self) {\
  \  return function() {\
  \    return self.gotoPageDown();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

gotoPageDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
gotoPageDown self = runFn1 gotoPageDownImpl self

foreign import gotoPageUpImpl
  "function gotoPageUpImpl(self) {\
  \  return function() {\
  \    return self.gotoPageUp();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

gotoPageUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
gotoPageUp self = runFn1 gotoPageUpImpl self

foreign import scrollPageDownImpl
  "function scrollPageDownImpl(self) {\
  \  return function() {\
  \    return self.scrollPageDown();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

scrollPageDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
scrollPageDown self = runFn1 scrollPageDownImpl self

foreign import scrollPageUpImpl
  "function scrollPageUpImpl(self) {\
  \  return function() {\
  \    return self.scrollPageUp();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

scrollPageUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
scrollPageUp self = runFn1 scrollPageUpImpl self

foreign import scrollToRowImpl
  "function scrollToRowImpl(self) {\
  \  return function() {\
  \    return self.scrollToRow();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

scrollToRow :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
scrollToRow self = runFn1 scrollToRowImpl self

foreign import scrollToLineImpl
  "function scrollToLineImpl(line, center, animate, callback, self) {\
  \  return function() {\
  \    return self.scrollToLine(line, center, animate, callback);\
  \  };\
  \}" :: forall eff. Fn5 Number Boolean Boolean (Eff (ace :: ACE | eff) Unit) Editor (Eff (ace :: ACE | eff) Unit)

scrollToLine :: forall eff. Number -> Boolean -> Boolean -> Eff (ace :: ACE | eff) Unit -> Editor -> Eff (ace :: ACE | eff) Unit
scrollToLine line center animate callback self = runFn5 scrollToLineImpl line center animate callback self

foreign import centerSelectionImpl
  "function centerSelectionImpl(self) {\
  \  return function() {\
  \    return self.centerSelection();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

centerSelection :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
centerSelection self = runFn1 centerSelectionImpl self

foreign import getCursorPositionImpl
  "function getCursorPositionImpl(self) {\
  \  return function() {\
  \    return self.getCursorPosition();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Position)

getCursorPosition :: forall eff. Editor -> Eff (ace :: ACE | eff) Position
getCursorPosition self = runFn1 getCursorPositionImpl self

foreign import getCursorPositionScreenImpl
  "function getCursorPositionScreenImpl(self) {\
  \  return function() {\
  \    return self.getCursorPositionScreen();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Number)

getCursorPositionScreen :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
getCursorPositionScreen self = runFn1 getCursorPositionScreenImpl self

foreign import getSelectionRangeImpl
  "function getSelectionRangeImpl(self) {\
  \  return function() {\
  \    return self.getSelectionRange();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Range)

getSelectionRange :: forall eff. Editor -> Eff (ace :: ACE | eff) Range
getSelectionRange self = runFn1 getSelectionRangeImpl self

foreign import selectAllImpl
  "function selectAllImpl(self) {\
  \  return function() {\
  \    return self.selectAll();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

selectAll :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
selectAll self = runFn1 selectAllImpl self

foreign import clearSelectionImpl
  "function clearSelectionImpl(self) {\
  \  return function() {\
  \    return self.clearSelection();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

clearSelection :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
clearSelection self = runFn1 clearSelectionImpl self

foreign import moveCursorToImpl
  "function moveCursorToImpl(row, column, animate, self) {\
  \  return function() {\
  \    return self.moveCursorTo(row, column, animate);\
  \  };\
  \}" :: forall eff. Fn4 Number (Nullable Number) (Nullable Boolean) Editor (Eff (ace :: ACE | eff) Unit)

moveCursorTo :: forall eff. Number -> Maybe Number -> Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
moveCursorTo row column animate self = runFn4 moveCursorToImpl row (toNullable column) (toNullable animate) self

foreign import moveCursorToPositionImpl
  "function moveCursorToPositionImpl(position, self) {\
  \  return function() {\
  \    return self.moveCursorToPosition(position);\
  \  };\
  \}" :: forall eff. Fn2 Position Editor (Eff (ace :: ACE | eff) Unit)

moveCursorToPosition :: forall eff. Position -> Editor -> Eff (ace :: ACE | eff) Unit
moveCursorToPosition position self = runFn2 moveCursorToPositionImpl position self

foreign import jumpToMatchingImpl
  "function jumpToMatchingImpl(self) {\
  \  return function() {\
  \    return self.jumpToMatching();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

jumpToMatching :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
jumpToMatching self = runFn1 jumpToMatchingImpl self

foreign import gotoLineImpl
  "function gotoLineImpl(lineNumber, column, animate, self) {\
  \  return function() {\
  \    return self.gotoLine(lineNumber, column, animate);\
  \  };\
  \}" :: forall eff. Fn4 Number (Nullable Number) (Nullable Boolean) Editor (Eff (ace :: ACE | eff) Unit)

gotoLine :: forall eff. Number -> Maybe Number -> Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
gotoLine lineNumber column animate self = runFn4 gotoLineImpl lineNumber (toNullable column) (toNullable animate) self

foreign import navigateToImpl
  "function navigateToImpl(row, column, self) {\
  \  return function() {\
  \    return self.navigateTo(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Editor (Eff (ace :: ACE | eff) Unit)

navigateTo :: forall eff. Number -> Number -> Editor -> Eff (ace :: ACE | eff) Unit
navigateTo row column self = runFn3 navigateToImpl row column self

foreign import navigateUpImpl
  "function navigateUpImpl(times, self) {\
  \  return function() {\
  \    return self.navigateUp(times);\
  \  };\
  \}" :: forall eff. Fn2 (Nullable Number) Editor (Eff (ace :: ACE | eff) Unit)

navigateUp :: forall eff. Maybe Number -> Editor -> Eff (ace :: ACE | eff) Unit
navigateUp times self = runFn2 navigateUpImpl (toNullable times) self

foreign import navigateDownImpl
  "function navigateDownImpl(times, self) {\
  \  return function() {\
  \    return self.navigateDown(times);\
  \  };\
  \}" :: forall eff. Fn2 (Nullable Number) Editor (Eff (ace :: ACE | eff) Unit)

navigateDown :: forall eff. Maybe Number -> Editor -> Eff (ace :: ACE | eff) Unit
navigateDown times self = runFn2 navigateDownImpl (toNullable times) self

foreign import navigateLeftImpl
  "function navigateLeftImpl(times, self) {\
  \  return function() {\
  \    return self.navigateLeft(times);\
  \  };\
  \}" :: forall eff. Fn2 (Nullable Number) Editor (Eff (ace :: ACE | eff) Unit)

navigateLeft :: forall eff. Maybe Number -> Editor -> Eff (ace :: ACE | eff) Unit
navigateLeft times self = runFn2 navigateLeftImpl (toNullable times) self

foreign import navigateRightImpl
  "function navigateRightImpl(times, self) {\
  \  return function() {\
  \    return self.navigateRight(times);\
  \  };\
  \}" :: forall eff. Fn2 Number Editor (Eff (ace :: ACE | eff) Unit)

navigateRight :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Unit
navigateRight times self = runFn2 navigateRightImpl times self

foreign import navigateLineStartImpl
  "function navigateLineStartImpl(self) {\
  \  return function() {\
  \    return self.navigateLineStart();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

navigateLineStart :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
navigateLineStart self = runFn1 navigateLineStartImpl self

foreign import navigateLineEndImpl
  "function navigateLineEndImpl(self) {\
  \  return function() {\
  \    return self.navigateLineEnd();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

navigateLineEnd :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
navigateLineEnd self = runFn1 navigateLineEndImpl self

foreign import navigateFileEndImpl
  "function navigateFileEndImpl(self) {\
  \  return function() {\
  \    return self.navigateFileEnd();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

navigateFileEnd :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
navigateFileEnd self = runFn1 navigateFileEndImpl self

foreign import navigateFileStartImpl
  "function navigateFileStartImpl(self) {\
  \  return function() {\
  \    return self.navigateFileStart();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

navigateFileStart :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
navigateFileStart self = runFn1 navigateFileStartImpl self

foreign import navigateWordRightImpl
  "function navigateWordRightImpl(self) {\
  \  return function() {\
  \    return self.navigateWordRight();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

navigateWordRight :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
navigateWordRight self = runFn1 navigateWordRightImpl self

foreign import navigateWordLeftImpl
  "function navigateWordLeftImpl(self) {\
  \  return function() {\
  \    return self.navigateWordLeft();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

navigateWordLeft :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
navigateWordLeft self = runFn1 navigateWordLeftImpl self

foreign import replaceImpl
  "function replaceImpl(replacement, options, self) {\
  \  return function() {\
  \    return self.replace(replacement, options);\
  \  };\
  \}" :: forall eff. Fn3 String (Nullable SearchOptions) Editor (Eff (ace :: ACE | eff) Unit)

replace :: forall eff. String -> Maybe SearchOptions -> Editor -> Eff (ace :: ACE | eff) Unit
replace replacement options self = runFn3 replaceImpl replacement (toNullable options) self

foreign import replaceAllImpl
  "function replaceAllImpl(replacement, options, self) {\
  \  return function() {\
  \    return self.replaceAll(replacement, options);\
  \  };\
  \}" :: forall eff. Fn3 String (Nullable SearchOptions) Editor (Eff (ace :: ACE | eff) Unit)

replaceAll :: forall eff. String -> Maybe SearchOptions -> Editor -> Eff (ace :: ACE | eff) Unit
replaceAll replacement options self = runFn3 replaceAllImpl replacement (toNullable options) self

foreign import getLastSearchOptionsImpl
  "function getLastSearchOptionsImpl(self) {\
  \  return function() {\
  \    return self.getLastSearchOptions();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) SearchOptions)

getLastSearchOptions :: forall eff. Editor -> Eff (ace :: ACE | eff) SearchOptions
getLastSearchOptions self = runFn1 getLastSearchOptionsImpl self

foreign import findImpl
  "function findImpl(needle, options, animate, self) {\
  \  return function() {\
  \    return self.find(needle, options, animate);\
  \  };\
  \}" :: forall eff. Fn4 String (Nullable SearchOptions) (Nullable Boolean) Editor (Eff (ace :: ACE | eff) Unit)

find :: forall eff. String -> Maybe SearchOptions -> Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
find needle options animate self = runFn4 findImpl needle (toNullable options) (toNullable animate) self

foreign import findNextImpl
  "function findNextImpl(options, animate, self) {\
  \  return function() {\
  \    return self.findNext(options, animate);\
  \  };\
  \}" :: forall eff. Fn3 (Nullable SearchOptions) (Nullable Boolean) Editor (Eff (ace :: ACE | eff) Unit)

findNext :: forall eff. Maybe SearchOptions -> Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
findNext options animate self = runFn3 findNextImpl (toNullable options) (toNullable animate) self

foreign import findPreviousImpl
  "function findPreviousImpl(options, animate, self) {\
  \  return function() {\
  \    return self.findPrevious(options, animate);\
  \  };\
  \}" :: forall eff. Fn3 (Nullable SearchOptions) (Nullable Boolean) Editor (Eff (ace :: ACE | eff) Unit)

findPrevious :: forall eff. Maybe SearchOptions -> Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
findPrevious options animate self = runFn3 findPreviousImpl (toNullable options) (toNullable animate) self

foreign import undoImpl
  "function undoImpl(self) {\
  \  return function() {\
  \    return self.undo();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

undo :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
undo self = runFn1 undoImpl self

foreign import redoImpl
  "function redoImpl(self) {\
  \  return function() {\
  \    return self.redo();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

redo :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
redo self = runFn1 redoImpl self

foreign import destroyImpl
  "function destroyImpl(self) {\
  \  return function() {\
  \    return self.destroy();\
  \  };\
  \}" :: forall eff. Fn1 Editor (Eff (ace :: ACE | eff) Unit)

destroy :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
destroy self = runFn1 destroyImpl self

foreign import createImpl
  "function createImpl(renderer, session) {\
  \  return function() {\
  \    return new Editor(renderer, session);\
  \  };\
  \}" :: forall eff. Fn2 VirtualRenderer (Nullable EditSession) (Eff (ace :: ACE | eff) Editor)

create :: forall eff. VirtualRenderer -> Maybe EditSession -> Eff (ace :: ACE | eff) Editor
create renderer session = runFn2 createImpl renderer (toNullable session)
