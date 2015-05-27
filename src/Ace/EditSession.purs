module Ace.EditSession
  ( DynamicMarker()
  , addDynamicMarker
  , addFold
  , addGutterDecoration
  , addMarker
  , adjustWrapLimit
  , clearAnnotations
  , clearBreakpoint
  , clearBreakpoints
  , createWithMode
  , createFromLines
  , create
  , detectNewLine
  , documentToScreenColumn
  , documentToScreenPosition
  , documentToScreenRow
  , duplicateLines
  , findMatchingBracket
  , getAWordRange
  , getAnnotations
  , getBackgroundTokenizer
  , getBreakpoints
  , getDisplayTokens
  , getDocument
  , getDocumentLastRowColumn
  , getDocumentLastRowColumnPosition
  , getLength
  , getLine
  , getLines
  , getMode
  , getNewLineMode
  , getOverwrite
  , getRowLength
  , getRowSplitData
  , getScreenLastRowColumn
  , getScreenLength
  , getScreenTabSize
  , getScreenWidth
  , getScrollLeft
  , getScrollTop
  , getSelection
  , getState
  , getStringScreenWidth
  , getTabSize
  , getTabString
  , getTextRange
  , getTokenAt
  , getTokens
  , getUndoManager
  , getUseSoftTabs
  , getUseWorker
  , getUseWrapMode
  , getValue
  , getWordRange
  , getWrapLimit
  , getWrapLimitRange
  , highlight
  , indentRows
  , insert
  , isTabStop
  , mode
  , moveLinesDown
  , moveLinesUp
  , moveText
  , onChange
  , onChangeAnnotation
  , onChangeBackMarker
  , onChangeBreakpoint
  , onChangeFold
  , onChangeFrontMarker
  , onChangeMode
  , onChangeOverwrite
  , onChangeScrollLeft
  , onChangeScrollTop
  , onChangeTabSize
  , onChangeWrapLimit
  , onChangeWrapMode
  , onTokenizerUpdate
  , onReloadTokenizer
  , outdentRows
  , remove
  , removeGutterDecoration
  , removeMarker
  , replace
  , resetRowCache
  , screenToDocumentColumn
  , screenToDocumentPosition
  , setAnnotations
  , setBreakpoint
  , setBreakpoints
  , setDocument
  , setMode
  , setNewLineMode
  , setOverwrite
  , setScrollLeft
  , setScrollTop
  , setTabSize
  , setUndoManager
  , setUndoSelect
  , setUseSoftTabs
  , setUseWorker
  , setUseWrapMode
  , setValue
  , setWrapLimitRange
  , toggleOverwrite
  ) where

import Prelude hiding (compare)

import Data.Maybe
import Data.Array.ST
import Data.Function

import Control.Monad.Eff
import Control.Monad.ST

import Ace.Types
import Data.DOM.Simple.Types
import Data.Nullable

foreign import getBackgroundTokenizer
  "function getBackgroundTokenizer(value) {\
  \  return function() {\
  \    return value.bgTokenizer;\
  \  };\
  \}" :: forall eff. EditSession -> Eff (ace :: ACE | eff) BackgroundTokenizer

foreign import onImpl
  "function onImpl(event, fn, self) {\
  \  return function() {\
  \    return self.on(event, function(e) {\
  \      fn(e)();\
  \    });\
  \  };\
  \}" :: forall ev eff a. Fn3 String (ev -> Eff (ace :: ACE | eff) a) EditSession (Eff (ace :: ACE | eff) Unit)

onChange :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
onChange self fn = runFn3 onImpl "change" (\_ -> fn) self

onChangeAnnotation :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
onChangeAnnotation self fn = runFn3 onImpl "changeAnnotation" (\_ -> fn) self

onChangeBackMarker :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
onChangeBackMarker self fn = runFn3 onImpl "changeBackMarker" (\_ -> fn) self

onChangeBreakpoint :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
onChangeBreakpoint self fn = runFn3 onImpl "changeBreakpoint" (\_ -> fn) self

onChangeFold :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
onChangeFold self fn = runFn3 onImpl "changeFold" (\_ -> fn) self

onChangeFrontMarker :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
onChangeFrontMarker self fn = runFn3 onImpl "changeFrontMarker" (\_ -> fn) self

onChangeMode :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
onChangeMode self fn = runFn3 onImpl "changeMode" (\_ -> fn) self

onChangeOverwrite :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
onChangeOverwrite self fn = runFn3 onImpl "changeOverwrite" (\_ -> fn) self

onChangeScrollLeft :: forall eff a. EditSession -> (Number -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onChangeScrollLeft self fn = runFn3 onImpl "changeScrollLeft" fn self

onChangeScrollTop :: forall eff a. EditSession -> (Number -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onChangeScrollTop self fn = runFn3 onImpl "changeScrollTop" fn self

onChangeTabSize :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
onChangeTabSize self fn = runFn3 onImpl "changeTabSize" (\_ -> fn) self

onChangeWrapLimit :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
onChangeWrapLimit self fn = runFn3 onImpl "changeWrapLimit" (\_ -> fn) self

onChangeWrapMode :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
onChangeWrapMode self fn = runFn3 onImpl "changeWrapMode" (\_ -> fn) self

onTokenizerUpdate :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
onTokenizerUpdate self fn = runFn3 onImpl "tokenizerUpdate" (\_ -> fn) self

foreign import findMatchingBracketImpl
  "function findMatchingBracketImpl(position, self) {\
  \  return function() {\
  \    return self.findMatchingBracket(position);\
  \  };\
  \}" :: forall eff. Fn2 Position EditSession (Eff (ace :: ACE | eff) Unit)

findMatchingBracket :: forall eff. Position -> EditSession -> Eff (ace :: ACE | eff) Unit
findMatchingBracket position self = runFn2 findMatchingBracketImpl position self

foreign import addFoldImpl
  "function addFoldImpl(text, range, self) {\
  \  return function() {\
  \    return self.addFold(text, range);\
  \  };\
  \}" :: forall eff. Fn3 String Range EditSession (Eff (ace :: ACE | eff) Unit)

addFold :: forall eff. String -> Range -> EditSession -> Eff (ace :: ACE | eff) Unit
addFold text range self = runFn3 addFoldImpl text range self

foreign import screenToDocumentColumnImpl
  "function screenToDocumentColumnImpl(row, column, self) {\
  \  return function() {\
  \    return self.screenToDocumentColumn(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number EditSession (Eff (ace :: ACE | eff) Unit)

screenToDocumentColumn :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Unit
screenToDocumentColumn row column self = runFn3 screenToDocumentColumnImpl row column self

foreign import highlightImpl
  "function highlightImpl(text, self) {\
  \  return function() {\
  \    return self.highlight(text);\
  \  };\
  \}" :: forall eff. Fn2 String EditSession (Eff (ace :: ACE | eff) Unit)

highlight :: forall eff. String -> EditSession -> Eff (ace :: ACE | eff) Unit
highlight text self = runFn2 highlightImpl text self

foreign import setDocumentImpl
  "function setDocumentImpl(doc, self) {\
  \  return function() {\
  \    return self.setDocument(doc);\
  \  };\
  \}" :: forall eff. Fn2 Document EditSession (Eff (ace :: ACE | eff) Unit)

setDocument :: forall eff. Document -> EditSession -> Eff (ace :: ACE | eff) Unit
setDocument doc self = runFn2 setDocumentImpl doc self

foreign import getDocumentImpl
  "function getDocumentImpl(self) {\
  \  return function() {\
  \    return self.getDocument();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Document)

getDocument :: forall eff. EditSession -> Eff (ace :: ACE | eff) Document
getDocument self = runFn1 getDocumentImpl self

foreign import resetRowCacheImpl
  "function resetRowCacheImpl(row, self) {\
  \  return function() {\
  \    return self.$resetRowCache(row);\
  \  };\
  \}" :: forall eff. Fn2 Number EditSession (Eff (ace :: ACE | eff) Unit)

resetRowCache :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) Unit
resetRowCache row self = runFn2 resetRowCacheImpl row self

foreign import setValueImpl
  "function setValueImpl(text, self) {\
  \  return function() {\
  \    return self.setValue(text);\
  \  };\
  \}" :: forall eff. Fn2 String EditSession (Eff (ace :: ACE | eff) Unit)

setValue :: forall eff. String -> EditSession -> Eff (ace :: ACE | eff) Unit
setValue text self = runFn2 setValueImpl text self

foreign import setModeImpl
  "function setModeImpl(mode, self) {\
  \  return function() {\
  \    return self.setMode(mode);\
  \  };\
  \}" :: forall eff. Fn2 String EditSession (Eff (ace :: ACE | eff) Unit)

setMode :: forall eff. String -> EditSession -> Eff (ace :: ACE | eff) Unit
setMode mode self = runFn2 setModeImpl mode self

foreign import getValueImpl
  "function getValueImpl(self) {\
  \  return function() {\
  \    return self.getValue();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) String)

getValue :: forall eff. EditSession -> Eff (ace :: ACE | eff) String
getValue self = runFn1 getValueImpl self

foreign import getSelectionImpl
  "function getSelectionImpl(self) {\
  \  return function() {\
  \    return self.getSelection();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Selection)

getSelection :: forall eff. EditSession -> Eff (ace :: ACE | eff) Selection
getSelection self = runFn1 getSelectionImpl self

foreign import getStateImpl
  "function getStateImpl(row, self) {\
  \  return function() {\
  \    return self.getState(row);\
  \  };\
  \}" :: forall eff. Fn2 Number EditSession (Eff (ace :: ACE | eff) String)

getState :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) String
getState row self = runFn2 getStateImpl row self

foreign import getTokensImpl
  "function getTokensImpl(row, self) {\
  \  return function() {\
  \    return self.getTokens(row);\
  \  };\
  \}" :: forall eff. Fn2 Number EditSession (Eff (ace :: ACE | eff) [TokenInfo])

getTokens :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) [TokenInfo]
getTokens row self = runFn2 getTokensImpl row self

foreign import getTokenAtImpl
  "function getTokenAtImpl(row, column, self) {\
  \  return function() {\
  \    return self.getTokenAt(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number EditSession (Eff (ace :: ACE | eff) TokenInfo)

getTokenAt :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) TokenInfo
getTokenAt row column self = runFn3 getTokenAtImpl row column self

foreign import setUndoManagerImpl
  "function setUndoManagerImpl(undoManager, self) {\
  \  return function() {\
  \    return self.setUndoManager(undoManager);\
  \  };\
  \}" :: forall eff. Fn2 UndoManager EditSession (Eff (ace :: ACE | eff) Unit)

setUndoManager :: forall eff. UndoManager -> EditSession -> Eff (ace :: ACE | eff) Unit
setUndoManager undoManager self = runFn2 setUndoManagerImpl undoManager self

foreign import getUndoManagerImpl
  "function getUndoManagerImpl(self) {\
  \  return function() {\
  \    return self.getUndoManager();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) UndoManager)

getUndoManager :: forall eff. EditSession -> Eff (ace :: ACE | eff) UndoManager
getUndoManager self = runFn1 getUndoManagerImpl self

foreign import getTabStringImpl
  "function getTabStringImpl(self) {\
  \  return function() {\
  \    return self.getTabString();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) String)

getTabString :: forall eff. EditSession -> Eff (ace :: ACE | eff) String
getTabString self = runFn1 getTabStringImpl self

foreign import setUseSoftTabsImpl
  "function setUseSoftTabsImpl(useSoftTabs, self) {\
  \  return function() {\
  \    return self.setUseSoftTabs(useSoftTabs);\
  \  };\
  \}" :: forall eff. Fn2 Boolean EditSession (Eff (ace :: ACE | eff) Unit)

setUseSoftTabs :: forall eff. Boolean -> EditSession -> Eff (ace :: ACE | eff) Unit
setUseSoftTabs useSoftTabs self = runFn2 setUseSoftTabsImpl useSoftTabs self

foreign import getUseSoftTabsImpl
  "function getUseSoftTabsImpl(self) {\
  \  return function() {\
  \    return self.getUseSoftTabs();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Boolean)

getUseSoftTabs :: forall eff. EditSession -> Eff (ace :: ACE | eff) Boolean
getUseSoftTabs self = runFn1 getUseSoftTabsImpl self

foreign import setTabSizeImpl
  "function setTabSizeImpl(tabSize, self) {\
  \  return function() {\
  \    return self.setTabSize(tabSize);\
  \  };\
  \}" :: forall eff. Fn2 Number EditSession (Eff (ace :: ACE | eff) Unit)

setTabSize :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) Unit
setTabSize tabSize self = runFn2 setTabSizeImpl tabSize self

foreign import getTabSizeImpl
  "function getTabSizeImpl(self) {\
  \  return function() {\
  \    return self.getTabSize();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) String)

getTabSize :: forall eff. EditSession -> Eff (ace :: ACE | eff) String
getTabSize self = runFn1 getTabSizeImpl self

foreign import isTabStopImpl
  "function isTabStopImpl(position, self) {\
  \  return function() {\
  \    return self.isTabStop(position);\
  \  };\
  \}" :: forall eff. Fn2 Position EditSession (Eff (ace :: ACE | eff) Boolean)

isTabStop :: forall eff. Position -> EditSession -> Eff (ace :: ACE | eff) Boolean
isTabStop position self = runFn2 isTabStopImpl position self

foreign import setOverwriteImpl
  "function setOverwriteImpl(overwrite, self) {\
  \  return function() {\
  \    return self.setOverwrite(overwrite);\
  \  };\
  \}" :: forall eff. Fn2 Boolean EditSession (Eff (ace :: ACE | eff) Unit)

setOverwrite :: forall eff. Boolean -> EditSession -> Eff (ace :: ACE | eff) Unit
setOverwrite overwrite self = runFn2 setOverwriteImpl overwrite self

foreign import getOverwriteImpl
  "function getOverwriteImpl(self) {\
  \  return function() {\
  \    return self.getOverwrite();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Boolean)

getOverwrite :: forall eff. EditSession -> Eff (ace :: ACE | eff) Boolean
getOverwrite self = runFn1 getOverwriteImpl self

foreign import toggleOverwriteImpl
  "function toggleOverwriteImpl(self) {\
  \  return function() {\
  \    return self.toggleOverwrite();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Unit)

toggleOverwrite :: forall eff. EditSession -> Eff (ace :: ACE | eff) Unit
toggleOverwrite self = runFn1 toggleOverwriteImpl self

foreign import addGutterDecorationImpl
  "function addGutterDecorationImpl(row, className, self) {\
  \  return function() {\
  \    return self.addGutterDecoration(row, className);\
  \  };\
  \}" :: forall eff. Fn3 Number String EditSession (Eff (ace :: ACE | eff) Unit)

addGutterDecoration :: forall eff. Number -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
addGutterDecoration row className self = runFn3 addGutterDecorationImpl row className self

foreign import removeGutterDecorationImpl
  "function removeGutterDecorationImpl(row, className, self) {\
  \  return function() {\
  \    return self.removeGutterDecoration(row, className);\
  \  };\
  \}" :: forall eff. Fn3 Number String EditSession (Eff (ace :: ACE | eff) Unit)

removeGutterDecoration :: forall eff. Number -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
removeGutterDecoration row className self = runFn3 removeGutterDecorationImpl row className self

foreign import getBreakpointsImpl
  "function getBreakpointsImpl(self) {\
  \  return function() {\
  \    return self.getBreakpoints();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) [Number])

getBreakpoints :: forall eff. EditSession -> Eff (ace :: ACE | eff) [Number]
getBreakpoints self = runFn1 getBreakpointsImpl self

foreign import setBreakpointsImpl
  "function setBreakpointsImpl(rows, self) {\
  \  return function() {\
  \    return self.setBreakpoints(rows);\
  \  };\
  \}" :: forall eff. Fn2 [Number] EditSession (Eff (ace :: ACE | eff) Unit)

setBreakpoints :: forall eff. [Number] -> EditSession -> Eff (ace :: ACE | eff) Unit
setBreakpoints rows self = runFn2 setBreakpointsImpl rows self

foreign import clearBreakpointsImpl
  "function clearBreakpointsImpl(self) {\
  \  return function() {\
  \    return self.clearBreakpoints();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Unit)

clearBreakpoints :: forall eff. EditSession -> Eff (ace :: ACE | eff) Unit
clearBreakpoints self = runFn1 clearBreakpointsImpl self

foreign import setBreakpointImpl
  "function setBreakpointImpl(row, className, self) {\
  \  return function() {\
  \    return self.setBreakpoint(row, className);\
  \  };\
  \}" :: forall eff. Fn3 Number String EditSession (Eff (ace :: ACE | eff) Unit)

setBreakpoint :: forall eff. Number -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
setBreakpoint row className self = runFn3 setBreakpointImpl row className self

foreign import clearBreakpointImpl
  "function clearBreakpointImpl(row, self) {\
  \  return function() {\
  \    return self.clearBreakpoint(row);\
  \  };\
  \}" :: forall eff. Fn2 Number EditSession (Eff (ace :: ACE | eff) Unit)

clearBreakpoint :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) Unit
clearBreakpoint row self = runFn2 clearBreakpointImpl row self

foreign import addMarkerImpl
  "function addMarkerImpl(range, clazz, type, inFront, self) {\
  \  return function() {\
  \    return self.addMarker(range, clazz, type, inFront);\
  \  };\
  \}" :: forall eff. Fn5 Range String String Boolean EditSession (Eff (ace :: ACE | eff) Unit)

addMarker :: forall eff. Range -> String -> String -> Boolean -> EditSession -> Eff (ace :: ACE | eff) Unit
addMarker range clazz _type inFront self = runFn5 addMarkerImpl range clazz _type inFront self

type DynamicMarker eff a = forall h. STArray h String -> HTMLElement -> Eff (st :: ST h | eff) a

foreign import addDynamicMarkerImpl
  "function addDynamicMarkerImpl(marker, inFront, self) {\
  \  return function() {\
  \    return self.addDynamicMarker({\
  \      update: function(html, layer) {\
  \        marker(html)(layer.element)();\
  \      }\
  \    }, inFront);\
  \  };\
  \}" :: forall eff a. Fn3 (DynamicMarker (ace :: ACE | eff) a) Boolean EditSession (Eff (ace :: ACE | eff) Unit)

addDynamicMarker :: forall eff a. (DynamicMarker (ace :: ACE | eff) a) -> Boolean -> EditSession -> Eff (ace :: ACE | eff) Unit
addDynamicMarker marker inFront self = runFn3 addDynamicMarkerImpl marker inFront self

foreign import removeMarkerImpl
  "function removeMarkerImpl(markerId, self) {\
  \  return function() {\
  \    return self.removeMarker(markerId);\
  \  };\
  \}" :: forall eff. Fn2 Number EditSession (Eff (ace :: ACE | eff) Unit)

removeMarker :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) Unit
removeMarker markerId self = runFn2 removeMarkerImpl markerId self

foreign import setAnnotationsImpl
  "function setAnnotationsImpl(annotations, self) {\
  \  return function() {\
  \    return self.setAnnotations(annotations);\
  \  };\
  \}" :: forall eff. Fn2 [Annotation] EditSession (Eff (ace :: ACE | eff) Unit)

setAnnotations :: forall eff. [Annotation] -> EditSession -> Eff (ace :: ACE | eff) Unit
setAnnotations annotations self = runFn2 setAnnotationsImpl annotations self

foreign import getAnnotationsImpl
  "function getAnnotationsImpl(self) {\
  \  return function() {\
  \    return self.getAnnotations();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) [Annotation])

getAnnotations :: forall eff. EditSession -> Eff (ace :: ACE | eff) [Annotation]
getAnnotations self = runFn1 getAnnotationsImpl self

foreign import clearAnnotationsImpl
  "function clearAnnotationsImpl(self) {\
  \  return function() {\
  \    return self.clearAnnotations();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Unit)

clearAnnotations :: forall eff. EditSession -> Eff (ace :: ACE | eff) Unit
clearAnnotations self = runFn1 clearAnnotationsImpl self

foreign import detectNewLineImpl
  "function detectNewLineImpl(text, self) {\
  \  return function() {\
  \    return self.$detectNewLine(text);\
  \  };\
  \}" :: forall eff. Fn2 String EditSession (Eff (ace :: ACE | eff) Unit)

detectNewLine :: forall eff. String -> EditSession -> Eff (ace :: ACE | eff) Unit
detectNewLine text self = runFn2 detectNewLineImpl text self

foreign import getWordRangeImpl
  "function getWordRangeImpl(row, column, self) {\
  \  return function() {\
  \    return self.getWordRange(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number EditSession (Eff (ace :: ACE | eff) Range)

getWordRange :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Range
getWordRange row column self = runFn3 getWordRangeImpl row column self

foreign import getAWordRangeImpl
  "function getAWordRangeImpl(row, column, self) {\
  \  return function() {\
  \    return self.getAWordRange(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number EditSession (Eff (ace :: ACE | eff) Range)

getAWordRange :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Range
getAWordRange row column self = runFn3 getAWordRangeImpl row column self

foreign import setNewLineModeImpl
  "function setNewLineModeImpl(newLineMode, self) {\
  \  return function() {\
  \    return self.setNewLineMode(newLineMode);\
  \  };\
  \}" :: forall eff. Fn2 String EditSession (Eff (ace :: ACE | eff) Unit)

setNewLineMode :: forall eff. String -> EditSession -> Eff (ace :: ACE | eff) Unit
setNewLineMode newLineMode self = runFn2 setNewLineModeImpl newLineMode self

foreign import getNewLineModeImpl
  "function getNewLineModeImpl(self) {\
  \  return function() {\
  \    return self.getNewLineMode();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) String)

getNewLineMode :: forall eff. EditSession -> Eff (ace :: ACE | eff) String
getNewLineMode self = runFn1 getNewLineModeImpl self

foreign import setUseWorkerImpl
  "function setUseWorkerImpl(useWorker, self) {\
  \  return function() {\
  \    return self.setUseWorker(useWorker);\
  \  };\
  \}" :: forall eff. Fn2 Boolean EditSession (Eff (ace :: ACE | eff) Unit)

setUseWorker :: forall eff. Boolean -> EditSession -> Eff (ace :: ACE | eff) Unit
setUseWorker useWorker self = runFn2 setUseWorkerImpl useWorker self

foreign import getUseWorkerImpl
  "function getUseWorkerImpl(self) {\
  \  return function() {\
  \    return self.getUseWorker();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Boolean)

getUseWorker :: forall eff. EditSession -> Eff (ace :: ACE | eff) Boolean
getUseWorker self = runFn1 getUseWorkerImpl self

foreign import onReloadTokenizerImpl
  "function onReloadTokenizerImpl(self) {\
  \  return function() {\
  \    return self.onReloadTokenizer();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Unit)

onReloadTokenizer :: forall eff. EditSession -> Eff (ace :: ACE | eff) Unit
onReloadTokenizer self = runFn1 onReloadTokenizerImpl self

foreign import modeImpl
  "function modeImpl(mode, self) {\
  \  return function() {\
  \    return self.$mode(mode);\
  \  };\
  \}" :: forall eff. Fn2 TextMode EditSession (Eff (ace :: ACE | eff) Unit)

mode :: forall eff. TextMode -> EditSession -> Eff (ace :: ACE | eff) Unit
mode mode self = runFn2 modeImpl mode self

foreign import getModeImpl
  "function getModeImpl(self) {\
  \  return function() {\
  \    return self.getMode();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) TextMode)

getMode :: forall eff. EditSession -> Eff (ace :: ACE | eff) TextMode
getMode self = runFn1 getModeImpl self

foreign import setScrollTopImpl
  "function setScrollTopImpl(scrollTop, self) {\
  \  return function() {\
  \    return self.setScrollTop(scrollTop);\
  \  };\
  \}" :: forall eff. Fn2 Number EditSession (Eff (ace :: ACE | eff) Unit)

setScrollTop :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) Unit
setScrollTop scrollTop self = runFn2 setScrollTopImpl scrollTop self

foreign import getScrollTopImpl
  "function getScrollTopImpl(self) {\
  \  return function() {\
  \    return self.getScrollTop();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Number)

getScrollTop :: forall eff. EditSession -> Eff (ace :: ACE | eff) Number
getScrollTop self = runFn1 getScrollTopImpl self

foreign import setScrollLeftImpl
  "function setScrollLeftImpl(self) {\
  \  return function() {\
  \    return self.setScrollLeft();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Unit)

setScrollLeft :: forall eff. EditSession -> Eff (ace :: ACE | eff) Unit
setScrollLeft self = runFn1 setScrollLeftImpl self

foreign import getScrollLeftImpl
  "function getScrollLeftImpl(self) {\
  \  return function() {\
  \    return self.getScrollLeft();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Number)

getScrollLeft :: forall eff. EditSession -> Eff (ace :: ACE | eff) Number
getScrollLeft self = runFn1 getScrollLeftImpl self

foreign import getScreenWidthImpl
  "function getScreenWidthImpl(self) {\
  \  return function() {\
  \    return self.getScreenWidth();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Number)

getScreenWidth :: forall eff. EditSession -> Eff (ace :: ACE | eff) Number
getScreenWidth self = runFn1 getScreenWidthImpl self

foreign import getLineImpl
  "function getLineImpl(row, self) {\
  \  return function() {\
  \    return self.getLine(row);\
  \  };\
  \}" :: forall eff. Fn2 Number EditSession (Eff (ace :: ACE | eff) String)

getLine :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) String
getLine row self = runFn2 getLineImpl row self

foreign import getLinesImpl
  "function getLinesImpl(firstRow, lastRow, self) {\
  \  return function() {\
  \    return self.getLines(firstRow, lastRow);\
  \  };\
  \}" :: forall eff. Fn3 Number Number EditSession (Eff (ace :: ACE | eff) [String])

getLines :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) [String]
getLines firstRow lastRow self = runFn3 getLinesImpl firstRow lastRow self

foreign import getLengthImpl
  "function getLengthImpl(self) {\
  \  return function() {\
  \    return self.getLength();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Number)

getLength :: forall eff. EditSession -> Eff (ace :: ACE | eff) Number
getLength self = runFn1 getLengthImpl self

foreign import getTextRangeImpl
  "function getTextRangeImpl(range, self) {\
  \  return function() {\
  \    return self.getTextRange(range);\
  \  };\
  \}" :: forall eff. Fn2 Range EditSession (Eff (ace :: ACE | eff) String)

getTextRange :: forall eff. Range -> EditSession -> Eff (ace :: ACE | eff) String
getTextRange range self = runFn2 getTextRangeImpl range self

foreign import insertImpl
  "function insertImpl(position, text, self) {\
  \  return function() {\
  \    return self.insert(position, text);\
  \  };\
  \}" :: forall eff. Fn3 Position String EditSession (Eff (ace :: ACE | eff) Unit)

insert :: forall eff. Position -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
insert position text self = runFn3 insertImpl position text self

foreign import removeImpl
  "function removeImpl(range, self) {\
  \  return function() {\
  \    return self.remove(range);\
  \  };\
  \}" :: forall eff. Fn2 Range EditSession (Eff (ace :: ACE | eff) Unit)

remove :: forall eff. Range -> EditSession -> Eff (ace :: ACE | eff) Unit
remove range self = runFn2 removeImpl range self

foreign import setUndoSelectImpl
  "function setUndoSelectImpl(enable, self) {\
  \  return function() {\
  \    return self.setUndoSelect(enable);\
  \  };\
  \}" :: forall eff. Fn2 Boolean EditSession (Eff (ace :: ACE | eff) Unit)

setUndoSelect :: forall eff. Boolean -> EditSession -> Eff (ace :: ACE | eff) Unit
setUndoSelect enable self = runFn2 setUndoSelectImpl enable self

foreign import replaceImpl
  "function replaceImpl(range, text, self) {\
  \  return function() {\
  \    return self.replace(range, text);\
  \  };\
  \}" :: forall eff. Fn3 Range String EditSession (Eff (ace :: ACE | eff) Unit)

replace :: forall eff. Range -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
replace range text self = runFn3 replaceImpl range text self

foreign import moveTextImpl
  "function moveTextImpl(fromRange, toPosition, self) {\
  \  return function() {\
  \    return self.moveText(fromRange, toPosition);\
  \  };\
  \}" :: forall eff. Fn3 Range Position EditSession (Eff (ace :: ACE | eff) Range)

moveText :: forall eff. Range -> Position -> EditSession -> Eff (ace :: ACE | eff) Range
moveText fromRange toPosition self = runFn3 moveTextImpl fromRange toPosition self

foreign import indentRowsImpl
  "function indentRowsImpl(startRow, endRow, indentString, self) {\
  \  return function() {\
  \    return self.indentRows(startRow, endRow, indentString);\
  \  };\
  \}" :: forall eff. Fn4 Number Number String EditSession (Eff (ace :: ACE | eff) Unit)

indentRows :: forall eff. Number -> Number -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
indentRows startRow endRow indentString self = runFn4 indentRowsImpl startRow endRow indentString self

foreign import outdentRowsImpl
  "function outdentRowsImpl(range, self) {\
  \  return function() {\
  \    return self.outdentRows(range);\
  \  };\
  \}" :: forall eff. Fn2 Range EditSession (Eff (ace :: ACE | eff) Unit)

outdentRows :: forall eff. Range -> EditSession -> Eff (ace :: ACE | eff) Unit
outdentRows range self = runFn2 outdentRowsImpl range self

foreign import moveLinesUpImpl
  "function moveLinesUpImpl(firstRow, lastRow, self) {\
  \  return function() {\
  \    return self.moveLinesUp(firstRow, lastRow);\
  \  };\
  \}" :: forall eff. Fn3 Number Number EditSession (Eff (ace :: ACE | eff) Number)

moveLinesUp :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Number
moveLinesUp firstRow lastRow self = runFn3 moveLinesUpImpl firstRow lastRow self

foreign import moveLinesDownImpl
  "function moveLinesDownImpl(firstRow, lastRow, self) {\
  \  return function() {\
  \    return self.moveLinesDown(firstRow, lastRow);\
  \  };\
  \}" :: forall eff. Fn3 Number Number EditSession (Eff (ace :: ACE | eff) Number)

moveLinesDown :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Number
moveLinesDown firstRow lastRow self = runFn3 moveLinesDownImpl firstRow lastRow self

foreign import duplicateLinesImpl
  "function duplicateLinesImpl(firstRow, lastRow, self) {\
  \  return function() {\
  \    return self.duplicateLines(firstRow, lastRow);\
  \  };\
  \}" :: forall eff. Fn3 Number Number EditSession (Eff (ace :: ACE | eff) Number)

duplicateLines :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Number
duplicateLines firstRow lastRow self = runFn3 duplicateLinesImpl firstRow lastRow self

foreign import setUseWrapModeImpl
  "function setUseWrapModeImpl(useWrapMode, self) {\
  \  return function() {\
  \    return self.setUseWrapMode(useWrapMode);\
  \  };\
  \}" :: forall eff. Fn2 Boolean EditSession (Eff (ace :: ACE | eff) Unit)

setUseWrapMode :: forall eff. Boolean -> EditSession -> Eff (ace :: ACE | eff) Unit
setUseWrapMode useWrapMode self = runFn2 setUseWrapModeImpl useWrapMode self

foreign import getUseWrapModeImpl
  "function getUseWrapModeImpl(self) {\
  \  return function() {\
  \    return self.getUseWrapMode();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Boolean)

getUseWrapMode :: forall eff. EditSession -> Eff (ace :: ACE | eff) Boolean
getUseWrapMode self = runFn1 getUseWrapModeImpl self

foreign import setWrapLimitRangeImpl
  "function setWrapLimitRangeImpl(min, max, self) {\
  \  return function() {\
  \    return self.setWrapLimitRange(min, max);\
  \  };\
  \}" :: forall eff. Fn3 Number Number EditSession (Eff (ace :: ACE | eff) Unit)

setWrapLimitRange :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Unit
setWrapLimitRange min max self = runFn3 setWrapLimitRangeImpl min max self

foreign import adjustWrapLimitImpl
  "function adjustWrapLimitImpl(desiredLimit, self) {\
  \  return function() {\
  \    return self.adjustWrapLimit(desiredLimit);\
  \  };\
  \}" :: forall eff. Fn2 Number EditSession (Eff (ace :: ACE | eff) Boolean)

adjustWrapLimit :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) Boolean
adjustWrapLimit desiredLimit self = runFn2 adjustWrapLimitImpl desiredLimit self

foreign import getWrapLimitImpl
  "function getWrapLimitImpl(self) {\
  \  return function() {\
  \    return self.getWrapLimit();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Number)

getWrapLimit :: forall eff. EditSession -> Eff (ace :: ACE | eff) Number
getWrapLimit self = runFn1 getWrapLimitImpl self

foreign import getWrapLimitRangeImpl
  "function getWrapLimitRangeImpl(self) {\
  \  return function() {\
  \    return self.getWrapLimitRange();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) { min :: Number, max :: Number })

getWrapLimitRange :: forall eff. EditSession -> Eff (ace :: ACE | eff) { min :: Number, max :: Number }
getWrapLimitRange self = runFn1 getWrapLimitRangeImpl self

foreign import getDisplayTokensImpl
  "function getDisplayTokensImpl(str, offset, self) {\
  \  return function() {\
  \    return self.$getDisplayTokens(str, offset);\
  \  };\
  \}" :: forall eff. Fn3 String Number EditSession (Eff (ace :: ACE | eff) Unit)

getDisplayTokens :: forall eff. String -> Number -> EditSession -> Eff (ace :: ACE | eff) Unit
getDisplayTokens str offset self = runFn3 getDisplayTokensImpl str offset self

foreign import getStringScreenWidthImpl
  "function getStringScreenWidthImpl(str, maxScreenColumn, screenColumn, self) {\
  \  return function() {\
  \    return self.$getStringScreenWidth(str, maxScreenColumn, screenColumn);\
  \  };\
  \}" :: forall eff. Fn4 String Number Number EditSession (Eff (ace :: ACE | eff) [Number])

getStringScreenWidth :: forall eff. String -> Number -> Number -> EditSession -> Eff (ace :: ACE | eff) [Number]
getStringScreenWidth str maxScreenColumn screenColumn self = runFn4 getStringScreenWidthImpl str maxScreenColumn screenColumn self

foreign import getRowLengthImpl
  "function getRowLengthImpl(row, self) {\
  \  return function() {\
  \    return self.getRowLength(row);\
  \  };\
  \}" :: forall eff. Fn2 Number EditSession (Eff (ace :: ACE | eff) Number)

getRowLength :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) Number
getRowLength row self = runFn2 getRowLengthImpl row self

foreign import getScreenLastRowColumnImpl
  "function getScreenLastRowColumnImpl(screenRow, self) {\
  \  return function() {\
  \    return self.getScreenLastRowColumn(screenRow);\
  \  };\
  \}" :: forall eff. Fn2 Number EditSession (Eff (ace :: ACE | eff) Number)

getScreenLastRowColumn :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) Number
getScreenLastRowColumn screenRow self = runFn2 getScreenLastRowColumnImpl screenRow self

foreign import getDocumentLastRowColumnImpl
  "function getDocumentLastRowColumnImpl(docRow, docColumn, self) {\
  \  return function() {\
  \    return self.getDocumentLastRowColumn(docRow, docColumn);\
  \  };\
  \}" :: forall eff. Fn3 Number Number EditSession (Eff (ace :: ACE | eff) Number)

getDocumentLastRowColumn :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Number
getDocumentLastRowColumn docRow docColumn self = runFn3 getDocumentLastRowColumnImpl docRow docColumn self

foreign import getDocumentLastRowColumnPositionImpl
  "function getDocumentLastRowColumnPositionImpl(docRow, docColumn, self) {\
  \  return function() {\
  \    return self.getDocumentLastRowColumnPosition(docRow, docColumn);\
  \  };\
  \}" :: forall eff. Fn3 Number Number EditSession (Eff (ace :: ACE | eff) Number)

getDocumentLastRowColumnPosition :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Number
getDocumentLastRowColumnPosition docRow docColumn self = runFn3 getDocumentLastRowColumnPositionImpl docRow docColumn self

foreign import getRowSplitDataImpl
  "function getRowSplitDataImpl(self) {\
  \  return function() {\
  \    return self.getRowSplitData();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) String)

getRowSplitData :: forall eff. EditSession -> Eff (ace :: ACE | eff) String
getRowSplitData self = runFn1 getRowSplitDataImpl self

foreign import getScreenTabSizeImpl
  "function getScreenTabSizeImpl(screenColumn, self) {\
  \  return function() {\
  \    return self.getScreenTabSize(screenColumn);\
  \  };\
  \}" :: forall eff. Fn2 Number EditSession (Eff (ace :: ACE | eff) Number)

getScreenTabSize :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) Number
getScreenTabSize screenColumn self = runFn2 getScreenTabSizeImpl screenColumn self

foreign import screenToDocumentPositionImpl
  "function screenToDocumentPositionImpl(screenRow, screenColumn, self) {\
  \  return function() {\
  \    return self.screenToDocumentPosition(screenRow, screenColumn);\
  \  };\
  \}" :: forall eff. Fn3 Number Number EditSession (Eff (ace :: ACE | eff) Position)

screenToDocumentPosition :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Position
screenToDocumentPosition screenRow screenColumn self = runFn3 screenToDocumentPositionImpl screenRow screenColumn self

foreign import documentToScreenPositionImpl
  "function documentToScreenPositionImpl(docRow, docColumn, self) {\
  \  return function() {\
  \    return self.documentToScreenPosition(docRow, docColumn);\
  \  };\
  \}" :: forall eff. Fn3 Number Number EditSession (Eff (ace :: ACE | eff) Position)

documentToScreenPosition :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Position
documentToScreenPosition docRow docColumn self = runFn3 documentToScreenPositionImpl docRow docColumn self

foreign import documentToScreenColumnImpl
  "function documentToScreenColumnImpl(row, docColumn, self) {\
  \  return function() {\
  \    return self.documentToScreenColumn(row, docColumn);\
  \  };\
  \}" :: forall eff. Fn3 Number Number EditSession (Eff (ace :: ACE | eff) Number)

documentToScreenColumn :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Number
documentToScreenColumn row docColumn self = runFn3 documentToScreenColumnImpl row docColumn self

foreign import documentToScreenRowImpl
  "function documentToScreenRowImpl(docRow, docColumn, self) {\
  \  return function() {\
  \    return self.documentToScreenRow(docRow, docColumn);\
  \  };\
  \}" :: forall eff. Fn3 Number Number EditSession (Eff (ace :: ACE | eff) Unit)

documentToScreenRow :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Unit
documentToScreenRow docRow docColumn self = runFn3 documentToScreenRowImpl docRow docColumn self

foreign import getScreenLengthImpl
  "function getScreenLengthImpl(self) {\
  \  return function() {\
  \    return self.getScreenLength();\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Number)

getScreenLength :: forall eff. EditSession -> Eff (ace :: ACE | eff) Number
getScreenLength self = runFn1 getScreenLengthImpl self

foreign import createWithModeImpl
  "function createWithModeImpl(text, mode) {\
  \  return function() {\
  \    var EditSession = ace.require('ace/edit_session').EditSession;\
  \    return new EditSession(text, mode);\
  \  };\
  \}" :: forall eff. Fn2 String (Nullable TextMode) (Eff (ace :: ACE | eff) EditSession)

createWithMode :: forall eff. String -> Maybe TextMode -> Eff (ace :: ACE | eff) EditSession
createWithMode text mode = runFn2 createWithModeImpl text (toNullable mode)

foreign import createImpl
  "function createImpl(content, mode) {\
  \  return function() {\
  \    var EditSession = ace.require('ace/edit_session').EditSession;\
  \    return new EditSession(content, mode);\
  \  };\
  \}" :: forall eff. Fn2 String (Nullable String) (Eff (ace :: ACE | eff) EditSession)

create :: forall eff. String -> Maybe String -> Eff (ace :: ACE | eff) EditSession
create content mode = runFn2 createImpl content (toNullable mode)

foreign import createFromLinesImpl
  "function createFromLinesImpl(text, mode) {\
  \  return function() {\
  \    var EditSession = ace.require('ace/edit_session').EditSession;\
  \    return new EditSession(text, mode);\
  \  };\
  \}" :: forall eff. Fn2 [String] (Nullable String) (Eff (ace :: ACE | eff) EditSession)

createFromLines :: forall eff. [String] -> Maybe String -> Eff (ace :: ACE | eff) EditSession
createFromLines text mode = runFn2 createFromLinesImpl text (toNullable mode)
