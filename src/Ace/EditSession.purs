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

foreign import getBackgroundTokenizer :: forall eff. EditSession -> Eff (ace :: ACE | eff) BackgroundTokenizer

foreign import onImpl :: forall ev eff a. Fn3 String (ev -> Eff (ace :: ACE | eff) a) EditSession (Eff (ace :: ACE | eff) Unit)

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

onChangeScrollLeft :: forall eff a. EditSession -> (Int -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onChangeScrollLeft self fn = runFn3 onImpl "changeScrollLeft" fn self

onChangeScrollTop :: forall eff a. EditSession -> (Int -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onChangeScrollTop self fn = runFn3 onImpl "changeScrollTop" fn self

onChangeTabSize :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
onChangeTabSize self fn = runFn3 onImpl "changeTabSize" (\_ -> fn) self

onChangeWrapLimit :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
onChangeWrapLimit self fn = runFn3 onImpl "changeWrapLimit" (\_ -> fn) self

onChangeWrapMode :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
onChangeWrapMode self fn = runFn3 onImpl "changeWrapMode" (\_ -> fn) self

onTokenizerUpdate :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
onTokenizerUpdate self fn = runFn3 onImpl "tokenizerUpdate" (\_ -> fn) self

foreign import findMatchingBracketImpl :: forall eff. Fn2 Position EditSession (Eff (ace :: ACE | eff) Unit)

findMatchingBracket :: forall eff. Position -> EditSession -> Eff (ace :: ACE | eff) Unit
findMatchingBracket position self = runFn2 findMatchingBracketImpl position self

foreign import addFoldImpl :: forall eff. Fn3 String Range EditSession (Eff (ace :: ACE | eff) Unit)

addFold :: forall eff. String -> Range -> EditSession -> Eff (ace :: ACE | eff) Unit
addFold text range self = runFn3 addFoldImpl text range self

foreign import screenToDocumentColumnImpl :: forall eff. Fn3 Int Int EditSession (Eff (ace :: ACE | eff) Unit)

screenToDocumentColumn :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Unit
screenToDocumentColumn row column self = runFn3 screenToDocumentColumnImpl row column self

foreign import highlightImpl :: forall eff. Fn2 String EditSession (Eff (ace :: ACE | eff) Unit)

highlight :: forall eff. String -> EditSession -> Eff (ace :: ACE | eff) Unit
highlight text self = runFn2 highlightImpl text self

foreign import setDocumentImpl :: forall eff. Fn2 Document EditSession (Eff (ace :: ACE | eff) Unit)

setDocument :: forall eff. Document -> EditSession -> Eff (ace :: ACE | eff) Unit
setDocument doc self = runFn2 setDocumentImpl doc self

foreign import getDocumentImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Document)

getDocument :: forall eff. EditSession -> Eff (ace :: ACE | eff) Document
getDocument self = runFn1 getDocumentImpl self

foreign import resetRowCacheImpl :: forall eff. Fn2 Int EditSession (Eff (ace :: ACE | eff) Unit)

resetRowCache :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) Unit
resetRowCache row self = runFn2 resetRowCacheImpl row self

foreign import setValueImpl :: forall eff. Fn2 String EditSession (Eff (ace :: ACE | eff) Unit)

setValue :: forall eff. String -> EditSession -> Eff (ace :: ACE | eff) Unit
setValue text self = runFn2 setValueImpl text self

foreign import setModeImpl :: forall eff. Fn2 String EditSession (Eff (ace :: ACE | eff) Unit)

setMode :: forall eff. String -> EditSession -> Eff (ace :: ACE | eff) Unit
setMode mode self = runFn2 setModeImpl mode self

foreign import getValueImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) String)

getValue :: forall eff. EditSession -> Eff (ace :: ACE | eff) String
getValue self = runFn1 getValueImpl self

foreign import getSelectionImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Selection)

getSelection :: forall eff. EditSession -> Eff (ace :: ACE | eff) Selection
getSelection self = runFn1 getSelectionImpl self

foreign import getStateImpl :: forall eff. Fn2 Int EditSession (Eff (ace :: ACE | eff) String)

getState :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) String
getState row self = runFn2 getStateImpl row self

foreign import getTokensImpl :: forall eff. Fn2 Int EditSession (Eff (ace :: ACE | eff) (Array TokenInfo))

getTokens :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) (Array TokenInfo)
getTokens row self = runFn2 getTokensImpl row self

foreign import getTokenAtImpl :: forall eff. Fn3 Int Int EditSession (Eff (ace :: ACE | eff) TokenInfo)

getTokenAt :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) TokenInfo
getTokenAt row column self = runFn3 getTokenAtImpl row column self

foreign import setUndoManagerImpl :: forall eff. Fn2 UndoManager EditSession (Eff (ace :: ACE | eff) Unit)

setUndoManager :: forall eff. UndoManager -> EditSession -> Eff (ace :: ACE | eff) Unit
setUndoManager undoManager self = runFn2 setUndoManagerImpl undoManager self

foreign import getUndoManagerImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) UndoManager)

getUndoManager :: forall eff. EditSession -> Eff (ace :: ACE | eff) UndoManager
getUndoManager self = runFn1 getUndoManagerImpl self

foreign import getTabStringImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) String)

getTabString :: forall eff. EditSession -> Eff (ace :: ACE | eff) String
getTabString self = runFn1 getTabStringImpl self

foreign import setUseSoftTabsImpl :: forall eff. Fn2 Boolean EditSession (Eff (ace :: ACE | eff) Unit)

setUseSoftTabs :: forall eff. Boolean -> EditSession -> Eff (ace :: ACE | eff) Unit
setUseSoftTabs useSoftTabs self = runFn2 setUseSoftTabsImpl useSoftTabs self

foreign import getUseSoftTabsImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Boolean)

getUseSoftTabs :: forall eff. EditSession -> Eff (ace :: ACE | eff) Boolean
getUseSoftTabs self = runFn1 getUseSoftTabsImpl self

foreign import setTabSizeImpl :: forall eff. Fn2 Int EditSession (Eff (ace :: ACE | eff) Unit)

setTabSize :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) Unit
setTabSize tabSize self = runFn2 setTabSizeImpl tabSize self

foreign import getTabSizeImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) String)

getTabSize :: forall eff. EditSession -> Eff (ace :: ACE | eff) String
getTabSize self = runFn1 getTabSizeImpl self

foreign import isTabStopImpl :: forall eff. Fn2 Position EditSession (Eff (ace :: ACE | eff) Boolean)

isTabStop :: forall eff. Position -> EditSession -> Eff (ace :: ACE | eff) Boolean
isTabStop position self = runFn2 isTabStopImpl position self

foreign import setOverwriteImpl :: forall eff. Fn2 Boolean EditSession (Eff (ace :: ACE | eff) Unit)

setOverwrite :: forall eff. Boolean -> EditSession -> Eff (ace :: ACE | eff) Unit
setOverwrite overwrite self = runFn2 setOverwriteImpl overwrite self

foreign import getOverwriteImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Boolean)

getOverwrite :: forall eff. EditSession -> Eff (ace :: ACE | eff) Boolean
getOverwrite self = runFn1 getOverwriteImpl self

foreign import toggleOverwriteImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Unit)

toggleOverwrite :: forall eff. EditSession -> Eff (ace :: ACE | eff) Unit
toggleOverwrite self = runFn1 toggleOverwriteImpl self

foreign import addGutterDecorationImpl :: forall eff. Fn3 Int String EditSession (Eff (ace :: ACE | eff) Unit)

addGutterDecoration :: forall eff. Int -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
addGutterDecoration row className self = runFn3 addGutterDecorationImpl row className self

foreign import removeGutterDecorationImpl :: forall eff. Fn3 Int String EditSession (Eff (ace :: ACE | eff) Unit)

removeGutterDecoration :: forall eff. Int -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
removeGutterDecoration row className self = runFn3 removeGutterDecorationImpl row className self

foreign import getBreakpointsImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) (Array Int))

getBreakpoints :: forall eff. EditSession -> Eff (ace :: ACE | eff) (Array Int)
getBreakpoints self = runFn1 getBreakpointsImpl self

foreign import setBreakpointsImpl :: forall eff. Fn2 (Array Int) EditSession (Eff (ace :: ACE | eff) Unit)

setBreakpoints :: forall eff. Array Int -> EditSession -> Eff (ace :: ACE | eff) Unit
setBreakpoints rows self = runFn2 setBreakpointsImpl rows self

foreign import clearBreakpointsImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Unit)

clearBreakpoints :: forall eff. EditSession -> Eff (ace :: ACE | eff) Unit
clearBreakpoints self = runFn1 clearBreakpointsImpl self

foreign import setBreakpointImpl :: forall eff. Fn3 Int String EditSession (Eff (ace :: ACE | eff) Unit)

setBreakpoint :: forall eff. Int -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
setBreakpoint row className self = runFn3 setBreakpointImpl row className self

foreign import clearBreakpointImpl :: forall eff. Fn2 Int EditSession (Eff (ace :: ACE | eff) Unit)

clearBreakpoint :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) Unit
clearBreakpoint row self = runFn2 clearBreakpointImpl row self

foreign import addMarkerImpl :: forall eff. Fn5 Range String String Boolean EditSession (Eff (ace :: ACE | eff) Unit)

addMarker :: forall eff. Range -> String -> String -> Boolean -> EditSession -> Eff (ace :: ACE | eff) Unit
addMarker range clazz _type inFront self = runFn5 addMarkerImpl range clazz _type inFront self

type DynamicMarker eff a = forall h. STArray h String -> HTMLElement -> Eff (st :: ST h | eff) a

foreign import addDynamicMarkerImpl :: forall eff a. Fn3 (DynamicMarker (ace :: ACE | eff) a) Boolean EditSession (Eff (ace :: ACE | eff) Unit)

addDynamicMarker :: forall eff a. (DynamicMarker (ace :: ACE | eff) a) -> Boolean -> EditSession -> Eff (ace :: ACE | eff) Unit
addDynamicMarker marker inFront self = runFn3 addDynamicMarkerImpl marker inFront self

foreign import removeMarkerImpl :: forall eff. Fn2 Int EditSession (Eff (ace :: ACE | eff) Unit)

removeMarker :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) Unit
removeMarker markerId self = runFn2 removeMarkerImpl markerId self

foreign import setAnnotationsImpl :: forall eff. Fn2 (Array Annotation) EditSession (Eff (ace :: ACE | eff) Unit)

setAnnotations :: forall eff. Array Annotation -> EditSession -> Eff (ace :: ACE | eff) Unit
setAnnotations annotations self = runFn2 setAnnotationsImpl annotations self

foreign import getAnnotationsImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) (Array Annotation))

getAnnotations :: forall eff. EditSession -> Eff (ace :: ACE | eff) (Array Annotation)
getAnnotations self = runFn1 getAnnotationsImpl self

foreign import clearAnnotationsImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Unit)

clearAnnotations :: forall eff. EditSession -> Eff (ace :: ACE | eff) Unit
clearAnnotations self = runFn1 clearAnnotationsImpl self

foreign import detectNewLineImpl :: forall eff. Fn2 String EditSession (Eff (ace :: ACE | eff) Unit)

detectNewLine :: forall eff. String -> EditSession -> Eff (ace :: ACE | eff) Unit
detectNewLine text self = runFn2 detectNewLineImpl text self

foreign import getWordRangeImpl :: forall eff. Fn3 Int Int EditSession (Eff (ace :: ACE | eff) Range)

getWordRange :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Range
getWordRange row column self = runFn3 getWordRangeImpl row column self

foreign import getAWordRangeImpl :: forall eff. Fn3 Int Int EditSession (Eff (ace :: ACE | eff) Range)

getAWordRange :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Range
getAWordRange row column self = runFn3 getAWordRangeImpl row column self

foreign import setNewLineModeImpl :: forall eff. Fn2 String EditSession (Eff (ace :: ACE | eff) Unit)

setNewLineMode :: forall eff. String -> EditSession -> Eff (ace :: ACE | eff) Unit
setNewLineMode newLineMode self = runFn2 setNewLineModeImpl newLineMode self

foreign import getNewLineModeImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) String)

getNewLineMode :: forall eff. EditSession -> Eff (ace :: ACE | eff) String
getNewLineMode self = runFn1 getNewLineModeImpl self

foreign import setUseWorkerImpl :: forall eff. Fn2 Boolean EditSession (Eff (ace :: ACE | eff) Unit)

setUseWorker :: forall eff. Boolean -> EditSession -> Eff (ace :: ACE | eff) Unit
setUseWorker useWorker self = runFn2 setUseWorkerImpl useWorker self

foreign import getUseWorkerImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Boolean)

getUseWorker :: forall eff. EditSession -> Eff (ace :: ACE | eff) Boolean
getUseWorker self = runFn1 getUseWorkerImpl self

foreign import onReloadTokenizerImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Unit)

onReloadTokenizer :: forall eff. EditSession -> Eff (ace :: ACE | eff) Unit
onReloadTokenizer self = runFn1 onReloadTokenizerImpl self

foreign import modeImpl :: forall eff. Fn2 TextMode EditSession (Eff (ace :: ACE | eff) Unit)

mode :: forall eff. TextMode -> EditSession -> Eff (ace :: ACE | eff) Unit
mode mode self = runFn2 modeImpl mode self

foreign import getModeImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) TextMode)

getMode :: forall eff. EditSession -> Eff (ace :: ACE | eff) TextMode
getMode self = runFn1 getModeImpl self

foreign import setScrollTopImpl :: forall eff. Fn2 Int EditSession (Eff (ace :: ACE | eff) Unit)

setScrollTop :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) Unit
setScrollTop scrollTop self = runFn2 setScrollTopImpl scrollTop self

foreign import getScrollTopImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Int)

getScrollTop :: forall eff. EditSession -> Eff (ace :: ACE | eff) Int
getScrollTop self = runFn1 getScrollTopImpl self

foreign import setScrollLeftImpl :: forall eff. Fn2 Int EditSession (Eff (ace :: ACE | eff) Unit)

setScrollLeft :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) Unit
setScrollLeft scrollLeft self = runFn2 setScrollLeftImpl scrollLeft self

foreign import getScrollLeftImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Int)

getScrollLeft :: forall eff. EditSession -> Eff (ace :: ACE | eff) Int
getScrollLeft self = runFn1 getScrollLeftImpl self

foreign import getScreenWidthImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Int)

getScreenWidth :: forall eff. EditSession -> Eff (ace :: ACE | eff) Int
getScreenWidth self = runFn1 getScreenWidthImpl self

foreign import getLineImpl :: forall eff. Fn2 Int EditSession (Eff (ace :: ACE | eff) String)

getLine :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) String
getLine row self = runFn2 getLineImpl row self

foreign import getLinesImpl :: forall eff. Fn3 Int Int EditSession (Eff (ace :: ACE | eff) (Array String))

getLines :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) (Array String)
getLines firstRow lastRow self = runFn3 getLinesImpl firstRow lastRow self

foreign import getLengthImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Int)

getLength :: forall eff. EditSession -> Eff (ace :: ACE | eff) Int
getLength self = runFn1 getLengthImpl self

foreign import getTextRangeImpl :: forall eff. Fn2 Range EditSession (Eff (ace :: ACE | eff) String)

getTextRange :: forall eff. Range -> EditSession -> Eff (ace :: ACE | eff) String
getTextRange range self = runFn2 getTextRangeImpl range self

foreign import insertImpl :: forall eff. Fn3 Position String EditSession (Eff (ace :: ACE | eff) Unit)

insert :: forall eff. Position -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
insert position text self = runFn3 insertImpl position text self

foreign import removeImpl :: forall eff. Fn2 Range EditSession (Eff (ace :: ACE | eff) Unit)

remove :: forall eff. Range -> EditSession -> Eff (ace :: ACE | eff) Unit
remove range self = runFn2 removeImpl range self

foreign import setUndoSelectImpl :: forall eff. Fn2 Boolean EditSession (Eff (ace :: ACE | eff) Unit)

setUndoSelect :: forall eff. Boolean -> EditSession -> Eff (ace :: ACE | eff) Unit
setUndoSelect enable self = runFn2 setUndoSelectImpl enable self

foreign import replaceImpl :: forall eff. Fn3 Range String EditSession (Eff (ace :: ACE | eff) Unit)

replace :: forall eff. Range -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
replace range text self = runFn3 replaceImpl range text self

foreign import moveTextImpl :: forall eff. Fn3 Range Position EditSession (Eff (ace :: ACE | eff) Range)

moveText :: forall eff. Range -> Position -> EditSession -> Eff (ace :: ACE | eff) Range
moveText fromRange toPosition self = runFn3 moveTextImpl fromRange toPosition self

foreign import indentRowsImpl :: forall eff. Fn4 Int Int String EditSession (Eff (ace :: ACE | eff) Unit)

indentRows :: forall eff. Int -> Int -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
indentRows startRow endRow indentString self = runFn4 indentRowsImpl startRow endRow indentString self

foreign import outdentRowsImpl :: forall eff. Fn2 Range EditSession (Eff (ace :: ACE | eff) Unit)

outdentRows :: forall eff. Range -> EditSession -> Eff (ace :: ACE | eff) Unit
outdentRows range self = runFn2 outdentRowsImpl range self

foreign import moveLinesUpImpl :: forall eff. Fn3 Int Int EditSession (Eff (ace :: ACE | eff) Int)

moveLinesUp :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Int
moveLinesUp firstRow lastRow self = runFn3 moveLinesUpImpl firstRow lastRow self

foreign import moveLinesDownImpl :: forall eff. Fn3 Int Int EditSession (Eff (ace :: ACE | eff) Int)

moveLinesDown :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Int
moveLinesDown firstRow lastRow self = runFn3 moveLinesDownImpl firstRow lastRow self

foreign import duplicateLinesImpl :: forall eff. Fn3 Int Int EditSession (Eff (ace :: ACE | eff) Int)

duplicateLines :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Int
duplicateLines firstRow lastRow self = runFn3 duplicateLinesImpl firstRow lastRow self

foreign import setUseWrapModeImpl :: forall eff. Fn2 Boolean EditSession (Eff (ace :: ACE | eff) Unit)

setUseWrapMode :: forall eff. Boolean -> EditSession -> Eff (ace :: ACE | eff) Unit
setUseWrapMode useWrapMode self = runFn2 setUseWrapModeImpl useWrapMode self

foreign import getUseWrapModeImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Boolean)

getUseWrapMode :: forall eff. EditSession -> Eff (ace :: ACE | eff) Boolean
getUseWrapMode self = runFn1 getUseWrapModeImpl self

foreign import setWrapLimitRangeImpl :: forall eff. Fn3 Int Int EditSession (Eff (ace :: ACE | eff) Unit)

setWrapLimitRange :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Unit
setWrapLimitRange min max self = runFn3 setWrapLimitRangeImpl min max self

foreign import adjustWrapLimitImpl :: forall eff. Fn2 Int EditSession (Eff (ace :: ACE | eff) Boolean)

adjustWrapLimit :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) Boolean
adjustWrapLimit desiredLimit self = runFn2 adjustWrapLimitImpl desiredLimit self

foreign import getWrapLimitImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Int)

getWrapLimit :: forall eff. EditSession -> Eff (ace :: ACE | eff) Int
getWrapLimit self = runFn1 getWrapLimitImpl self

foreign import getWrapLimitRangeImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) { min :: Int, max :: Int })

getWrapLimitRange :: forall eff. EditSession -> Eff (ace :: ACE | eff) { min :: Int, max :: Int }
getWrapLimitRange self = runFn1 getWrapLimitRangeImpl self

foreign import getDisplayTokensImpl :: forall eff. Fn3 String Int EditSession (Eff (ace :: ACE | eff) Unit)

getDisplayTokens :: forall eff. String -> Int -> EditSession -> Eff (ace :: ACE | eff) Unit
getDisplayTokens str offset self = runFn3 getDisplayTokensImpl str offset self

foreign import getStringScreenWidthImpl :: forall eff. Fn4 String Int Int EditSession (Eff (ace :: ACE | eff) (Array Int))

getStringScreenWidth :: forall eff. String -> Int -> Int -> EditSession -> Eff (ace :: ACE | eff) (Array Int)
getStringScreenWidth str maxScreenColumn screenColumn self = runFn4 getStringScreenWidthImpl str maxScreenColumn screenColumn self

foreign import getRowLengthImpl :: forall eff. Fn2 Int EditSession (Eff (ace :: ACE | eff) Int)

getRowLength :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) Int
getRowLength row self = runFn2 getRowLengthImpl row self

foreign import getScreenLastRowColumnImpl :: forall eff. Fn2 Int EditSession (Eff (ace :: ACE | eff) Int)

getScreenLastRowColumn :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) Int
getScreenLastRowColumn screenRow self = runFn2 getScreenLastRowColumnImpl screenRow self

foreign import getDocumentLastRowColumnImpl :: forall eff. Fn3 Int Int EditSession (Eff (ace :: ACE | eff) Int)

getDocumentLastRowColumn :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Int
getDocumentLastRowColumn docRow docColumn self = runFn3 getDocumentLastRowColumnImpl docRow docColumn self

foreign import getDocumentLastRowColumnPositionImpl :: forall eff. Fn3 Int Int EditSession (Eff (ace :: ACE | eff) Int)

getDocumentLastRowColumnPosition :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Int
getDocumentLastRowColumnPosition docRow docColumn self = runFn3 getDocumentLastRowColumnPositionImpl docRow docColumn self

foreign import getRowSplitDataImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) String)

getRowSplitData :: forall eff. EditSession -> Eff (ace :: ACE | eff) String
getRowSplitData self = runFn1 getRowSplitDataImpl self

foreign import getScreenTabSizeImpl :: forall eff. Fn2 Int EditSession (Eff (ace :: ACE | eff) Int)

getScreenTabSize :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) Int
getScreenTabSize screenColumn self = runFn2 getScreenTabSizeImpl screenColumn self

foreign import screenToDocumentPositionImpl :: forall eff. Fn3 Int Int EditSession (Eff (ace :: ACE | eff) Position)

screenToDocumentPosition :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Position
screenToDocumentPosition screenRow screenColumn self = runFn3 screenToDocumentPositionImpl screenRow screenColumn self

foreign import documentToScreenPositionImpl :: forall eff. Fn3 Int Int EditSession (Eff (ace :: ACE | eff) Position)

documentToScreenPosition :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Position
documentToScreenPosition docRow docColumn self = runFn3 documentToScreenPositionImpl docRow docColumn self

foreign import documentToScreenColumnImpl :: forall eff. Fn3 Int Int EditSession (Eff (ace :: ACE | eff) Int)

documentToScreenColumn :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Int
documentToScreenColumn row docColumn self = runFn3 documentToScreenColumnImpl row docColumn self

foreign import documentToScreenRowImpl :: forall eff. Fn3 Int Int EditSession (Eff (ace :: ACE | eff) Unit)

documentToScreenRow :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Unit
documentToScreenRow docRow docColumn self = runFn3 documentToScreenRowImpl docRow docColumn self

foreign import getScreenLengthImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Int)

getScreenLength :: forall eff. EditSession -> Eff (ace :: ACE | eff) Int
getScreenLength self = runFn1 getScreenLengthImpl self

foreign import createWithModeImpl :: forall eff. Fn2 String (Nullable TextMode) (Eff (ace :: ACE | eff) EditSession)

createWithMode :: forall eff. String -> Maybe TextMode -> Eff (ace :: ACE | eff) EditSession
createWithMode text mode = runFn2 createWithModeImpl text (toNullable mode)

foreign import createImpl :: forall eff. Fn2 String (Nullable String) (Eff (ace :: ACE | eff) EditSession)

create :: forall eff. String -> Maybe String -> Eff (ace :: ACE | eff) EditSession
create content mode = runFn2 createImpl content (toNullable mode)

foreign import createFromLinesImpl :: forall eff. Fn2 (Array String) (Nullable String) (Eff (ace :: ACE | eff) EditSession)

createFromLines :: forall eff. Array String -> Maybe String -> Eff (ace :: ACE | eff) EditSession
createFromLines text mode = runFn2 createFromLinesImpl text (toNullable mode)
