module Ace.EditSession
  ( DynamicMarker
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
  , getMarkers
  ) where

import Prelude

import Ace.Types (Marker, DocumentEvent, EditSession, TextMode, Position, Range, Annotation, UndoManager, TokenInfo, Selection, Document, BackgroundTokenizer)
import Control.Monad.ST (ST)
import Data.Array.ST (STArray)
import Data.Function.Uncurried (Fn2, runFn2, Fn3, runFn3, Fn4, runFn4, Fn5, runFn5)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Web.HTML.HTMLElement (HTMLElement)

foreign import getBackgroundTokenizer :: EditSession -> Effect BackgroundTokenizer

foreign import onImpl :: forall ev a. Fn3 String (ev -> Effect a) EditSession (Effect Unit)

onChange :: forall a. EditSession -> (DocumentEvent -> Effect a) -> Effect Unit
onChange self fn = runFn3 onImpl "change" fn self

onChangeAnnotation :: forall a. EditSession -> Effect a -> Effect Unit
onChangeAnnotation self fn = runFn3 onImpl "changeAnnotation" (\_ -> fn) self

onChangeBackMarker :: forall a. EditSession -> Effect a -> Effect Unit
onChangeBackMarker self fn = runFn3 onImpl "changeBackMarker" (\_ -> fn) self

onChangeBreakpoint :: forall a. EditSession -> Effect a -> Effect Unit
onChangeBreakpoint self fn = runFn3 onImpl "changeBreakpoint" (\_ -> fn) self

onChangeFold :: forall a. EditSession -> Effect a -> Effect Unit
onChangeFold self fn = runFn3 onImpl "changeFold" (\_ -> fn) self

onChangeFrontMarker :: forall a. EditSession -> Effect a -> Effect Unit
onChangeFrontMarker self fn = runFn3 onImpl "changeFrontMarker" (\_ -> fn) self

onChangeMode :: forall a. EditSession -> Effect a -> Effect Unit
onChangeMode self fn = runFn3 onImpl "changeMode" (\_ -> fn) self

onChangeOverwrite :: forall a. EditSession -> Effect a -> Effect Unit
onChangeOverwrite self fn = runFn3 onImpl "changeOverwrite" (\_ -> fn) self

onChangeScrollLeft :: forall a. EditSession -> (Int -> Effect a) -> Effect Unit
onChangeScrollLeft self fn = runFn3 onImpl "changeScrollLeft" fn self

onChangeScrollTop :: forall a. EditSession -> (Int -> Effect a) -> Effect Unit
onChangeScrollTop self fn = runFn3 onImpl "changeScrollTop" fn self

onChangeTabSize :: forall a. EditSession -> Effect a -> Effect Unit
onChangeTabSize self fn = runFn3 onImpl "changeTabSize" (\_ -> fn) self

onChangeWrapLimit :: forall a. EditSession -> Effect a -> Effect Unit
onChangeWrapLimit self fn = runFn3 onImpl "changeWrapLimit" (\_ -> fn) self

onChangeWrapMode :: forall a. EditSession -> Effect a -> Effect Unit
onChangeWrapMode self fn = runFn3 onImpl "changeWrapMode" (\_ -> fn) self

onTokenizerUpdate :: forall a. EditSession -> Effect a -> Effect Unit
onTokenizerUpdate self fn = runFn3 onImpl "tokenizerUpdate" (\_ -> fn) self

foreign import findMatchingBracketImpl :: Fn2 Position EditSession (Effect Unit)

findMatchingBracket :: Position -> EditSession -> Effect Unit
findMatchingBracket position self = runFn2 findMatchingBracketImpl position self

foreign import addFoldImpl :: Fn3 String Range EditSession (Effect Unit)

addFold :: String -> Range -> EditSession -> Effect Unit
addFold text range self = runFn3 addFoldImpl text range self

foreign import screenToDocumentColumnImpl :: Fn3 Int Int EditSession (Effect Unit)

screenToDocumentColumn :: Int -> Int -> EditSession -> Effect Unit
screenToDocumentColumn row column self = runFn3 screenToDocumentColumnImpl row column self

foreign import highlightImpl :: Fn2 String EditSession (Effect Unit)

highlight :: String -> EditSession -> Effect Unit
highlight text self = runFn2 highlightImpl text self

foreign import setDocumentImpl :: Fn2 Document EditSession (Effect Unit)

setDocument :: Document -> EditSession -> Effect Unit
setDocument doc self = runFn2 setDocumentImpl doc self

foreign import getDocument :: EditSession -> Effect Document

foreign import resetRowCacheImpl :: Fn2 Int EditSession (Effect Unit)

resetRowCache :: Int -> EditSession -> Effect Unit
resetRowCache row self = runFn2 resetRowCacheImpl row self

foreign import setValueImpl :: Fn2 String EditSession (Effect Unit)

setValue :: String -> EditSession -> Effect Unit
setValue text self = runFn2 setValueImpl text self

foreign import setModeImpl :: Fn2 String EditSession (Effect Unit)

setMode :: String -> EditSession -> Effect Unit
setMode mode' self = runFn2 setModeImpl mode' self

foreign import getValue :: EditSession -> Effect String

foreign import getSelection :: EditSession -> Effect Selection

foreign import getStateImpl :: Fn2 Int EditSession (Effect String)

getState :: Int -> EditSession -> Effect String
getState row self = runFn2 getStateImpl row self

foreign import getTokensImpl :: Fn2 Int EditSession (Effect (Array TokenInfo))

getTokens :: Int -> EditSession -> Effect (Array TokenInfo)
getTokens row self = runFn2 getTokensImpl row self

foreign import getTokenAtImpl :: Fn3 Int Int EditSession (Effect TokenInfo)

getTokenAt :: Int -> Int -> EditSession -> Effect TokenInfo
getTokenAt row column self = runFn3 getTokenAtImpl row column self

foreign import setUndoManagerImpl :: Fn2 UndoManager EditSession (Effect Unit)

setUndoManager :: UndoManager -> EditSession -> Effect Unit
setUndoManager undoManager self = runFn2 setUndoManagerImpl undoManager self

foreign import getUndoManager :: EditSession -> Effect UndoManager

foreign import getTabString :: EditSession -> Effect String

foreign import setUseSoftTabsImpl :: Fn2 Boolean EditSession (Effect Unit)

setUseSoftTabs :: Boolean -> EditSession -> Effect Unit
setUseSoftTabs useSoftTabs self = runFn2 setUseSoftTabsImpl useSoftTabs self

foreign import getUseSoftTabs :: EditSession -> Effect Boolean

foreign import setTabSizeImpl :: Fn2 Int EditSession (Effect Unit)

setTabSize :: Int -> EditSession -> Effect Unit
setTabSize tabSize self = runFn2 setTabSizeImpl tabSize self

foreign import getTabSize :: EditSession -> Effect String

foreign import isTabStopImpl :: Fn2 Position EditSession (Effect Boolean)

isTabStop :: Position -> EditSession -> Effect Boolean
isTabStop position self = runFn2 isTabStopImpl position self

foreign import setOverwriteImpl :: Fn2 Boolean EditSession (Effect Unit)

setOverwrite :: Boolean -> EditSession -> Effect Unit
setOverwrite overwrite self = runFn2 setOverwriteImpl overwrite self

foreign import getOverwrite :: EditSession -> Effect Boolean

foreign import toggleOverwrite :: EditSession -> Effect Unit

foreign import addGutterDecorationImpl :: Fn3 Int String EditSession (Effect Unit)

addGutterDecoration :: Int -> String -> EditSession -> Effect Unit
addGutterDecoration row className self = runFn3 addGutterDecorationImpl row className self

foreign import removeGutterDecorationImpl :: Fn3 Int String EditSession (Effect Unit)

removeGutterDecoration :: Int -> String -> EditSession -> Effect Unit
removeGutterDecoration row className self = runFn3 removeGutterDecorationImpl row className self

foreign import getBreakpoints :: EditSession -> Effect (Array Int)

foreign import setBreakpointsImpl :: Fn2 (Array Int) EditSession (Effect Unit)

setBreakpoints :: Array Int -> EditSession -> Effect Unit
setBreakpoints rows self = runFn2 setBreakpointsImpl rows self

foreign import clearBreakpoints :: EditSession -> Effect Unit

foreign import setBreakpointImpl :: Fn3 Int String EditSession (Effect Unit)

setBreakpoint :: Int -> String -> EditSession -> Effect Unit
setBreakpoint row className self = runFn3 setBreakpointImpl row className self

foreign import clearBreakpointImpl :: Fn2 Int EditSession (Effect Unit)

clearBreakpoint :: Int -> EditSession -> Effect Unit
clearBreakpoint row self = runFn2 clearBreakpointImpl row self

foreign import addMarkerImpl :: Fn5 Range String String Boolean EditSession (Effect Int)

addMarker :: Range -> String -> String -> Boolean -> EditSession -> Effect Int
addMarker range clazz _type inFront self = runFn5 addMarkerImpl range clazz _type inFront self

type DynamicMarker a = forall h. STArray h String -> HTMLElement -> ST h a

foreign import addDynamicMarkerImpl :: forall a. Fn3 (DynamicMarker a) Boolean EditSession (Effect Unit)

addDynamicMarker :: forall a. DynamicMarker a -> Boolean -> EditSession -> Effect Unit
addDynamicMarker marker inFront self = runFn3 addDynamicMarkerImpl marker inFront self

foreign import removeMarkerImpl :: Fn2 Int EditSession (Effect Unit)

removeMarker :: Int -> EditSession -> Effect Unit
removeMarker markerId self = runFn2 removeMarkerImpl markerId self

foreign import setAnnotationsImpl :: Fn2 (Array Annotation) EditSession (Effect Unit)

setAnnotations :: Array Annotation -> EditSession -> Effect Unit
setAnnotations annotations self = runFn2 setAnnotationsImpl annotations self

foreign import getAnnotations :: EditSession -> Effect (Array Annotation)

foreign import clearAnnotations :: EditSession -> Effect Unit

foreign import detectNewLineImpl :: Fn2 String EditSession (Effect Unit)

detectNewLine :: String -> EditSession -> Effect Unit
detectNewLine text self = runFn2 detectNewLineImpl text self

foreign import getWordRangeImpl :: Fn3 Int Int EditSession (Effect Range)

getWordRange :: Int -> Int -> EditSession -> Effect Range
getWordRange row column self = runFn3 getWordRangeImpl row column self

foreign import getAWordRangeImpl :: Fn3 Int Int EditSession (Effect Range)

getAWordRange :: Int -> Int -> EditSession -> Effect Range
getAWordRange row column self = runFn3 getAWordRangeImpl row column self

foreign import setNewLineModeImpl :: Fn2 String EditSession (Effect Unit)

setNewLineMode :: String -> EditSession -> Effect Unit
setNewLineMode newLineMode self = runFn2 setNewLineModeImpl newLineMode self

foreign import getNewLineMode :: EditSession -> Effect String

foreign import setUseWorkerImpl :: Fn2 Boolean EditSession (Effect Unit)

setUseWorker :: Boolean -> EditSession -> Effect Unit
setUseWorker useWorker self = runFn2 setUseWorkerImpl useWorker self

foreign import getUseWorker :: EditSession -> Effect Boolean

foreign import onReloadTokenizer :: EditSession -> Effect Unit

foreign import modeImpl :: Fn2 TextMode EditSession (Effect Unit)

mode :: TextMode -> EditSession -> Effect Unit
mode mode' self = runFn2 modeImpl mode' self

foreign import getMode :: EditSession -> Effect TextMode

foreign import setScrollTopImpl :: Fn2 Int EditSession (Effect Unit)

setScrollTop :: Int -> EditSession -> Effect Unit
setScrollTop scrollTop self = runFn2 setScrollTopImpl scrollTop self

foreign import getScrollTop :: EditSession -> Effect Int

foreign import setScrollLeftImpl :: Fn2 Int EditSession (Effect Unit)

setScrollLeft :: Int -> EditSession -> Effect Unit
setScrollLeft scrollLeft self = runFn2 setScrollLeftImpl scrollLeft self

foreign import getScrollLeft :: EditSession -> Effect Int

foreign import getScreenWidth :: EditSession -> Effect Int

foreign import getLineImpl :: Fn2 Int EditSession (Effect String)

getLine :: Int -> EditSession -> Effect String
getLine row self = runFn2 getLineImpl row self

foreign import getLinesImpl :: Fn3 Int Int EditSession (Effect (Array String))

getLines :: Int -> Int -> EditSession -> Effect (Array String)
getLines firstRow lastRow self = runFn3 getLinesImpl firstRow lastRow self

foreign import getLength :: EditSession -> Effect Int

foreign import getTextRangeImpl :: Fn2 Range EditSession (Effect String)

getTextRange :: Range -> EditSession -> Effect String
getTextRange range self = runFn2 getTextRangeImpl range self

foreign import insertImpl :: Fn3 Position String EditSession (Effect Unit)

insert :: Position -> String -> EditSession -> Effect Unit
insert position text self = runFn3 insertImpl position text self

foreign import removeImpl :: Fn2 Range EditSession (Effect Unit)

remove :: Range -> EditSession -> Effect Unit
remove range self = runFn2 removeImpl range self

foreign import setUndoSelectImpl :: Fn2 Boolean EditSession (Effect Unit)

setUndoSelect :: Boolean -> EditSession -> Effect Unit
setUndoSelect enable self = runFn2 setUndoSelectImpl enable self

foreign import replaceImpl :: Fn3 Range String EditSession (Effect Unit)

replace :: Range -> String -> EditSession -> Effect Unit
replace range text self = runFn3 replaceImpl range text self

foreign import moveTextImpl :: Fn3 Range Position EditSession (Effect Range)

moveText :: Range -> Position -> EditSession -> Effect Range
moveText fromRange toPosition self = runFn3 moveTextImpl fromRange toPosition self

foreign import indentRowsImpl :: Fn4 Int Int String EditSession (Effect Unit)

indentRows :: Int -> Int -> String -> EditSession -> Effect Unit
indentRows startRow endRow indentString self = runFn4 indentRowsImpl startRow endRow indentString self

foreign import outdentRowsImpl :: Fn2 Range EditSession (Effect Unit)

outdentRows :: Range -> EditSession -> Effect Unit
outdentRows range self = runFn2 outdentRowsImpl range self

foreign import moveLinesUpImpl :: Fn3 Int Int EditSession (Effect Int)

moveLinesUp :: Int -> Int -> EditSession -> Effect Int
moveLinesUp firstRow lastRow self = runFn3 moveLinesUpImpl firstRow lastRow self

foreign import moveLinesDownImpl :: Fn3 Int Int EditSession (Effect Int)

moveLinesDown :: Int -> Int -> EditSession -> Effect Int
moveLinesDown firstRow lastRow self = runFn3 moveLinesDownImpl firstRow lastRow self

foreign import duplicateLinesImpl :: Fn3 Int Int EditSession (Effect Int)

duplicateLines :: Int -> Int -> EditSession -> Effect Int
duplicateLines firstRow lastRow self = runFn3 duplicateLinesImpl firstRow lastRow self

foreign import setUseWrapModeImpl :: Fn2 Boolean EditSession (Effect Unit)

setUseWrapMode :: Boolean -> EditSession -> Effect Unit
setUseWrapMode useWrapMode self = runFn2 setUseWrapModeImpl useWrapMode self

foreign import getUseWrapMode :: EditSession -> Effect Boolean

foreign import setWrapLimitRangeImpl :: Fn3 Int Int EditSession (Effect Unit)

setWrapLimitRange :: Int -> Int -> EditSession -> Effect Unit
setWrapLimitRange min max self = runFn3 setWrapLimitRangeImpl min max self

foreign import adjustWrapLimitImpl :: Fn2 Int EditSession (Effect Boolean)

adjustWrapLimit :: Int -> EditSession -> Effect Boolean
adjustWrapLimit desiredLimit self = runFn2 adjustWrapLimitImpl desiredLimit self

foreign import getWrapLimit :: EditSession -> Effect Int

foreign import getWrapLimitRange :: EditSession -> Effect { min :: Int, max :: Int }

foreign import getDisplayTokensImpl :: Fn3 String Int EditSession (Effect Unit)

getDisplayTokens :: String -> Int -> EditSession -> Effect Unit
getDisplayTokens str offset self = runFn3 getDisplayTokensImpl str offset self

foreign import getStringScreenWidthImpl :: Fn4 String Int Int EditSession (Effect (Array Int))

getStringScreenWidth :: String -> Int -> Int -> EditSession -> Effect (Array Int)
getStringScreenWidth str maxScreenColumn screenColumn self = runFn4 getStringScreenWidthImpl str maxScreenColumn screenColumn self

foreign import getRowLengthImpl :: Fn2 Int EditSession (Effect Int)

getRowLength :: Int -> EditSession -> Effect Int
getRowLength row self = runFn2 getRowLengthImpl row self

foreign import getScreenLastRowColumnImpl :: Fn2 Int EditSession (Effect Int)

getScreenLastRowColumn :: Int -> EditSession -> Effect Int
getScreenLastRowColumn screenRow self = runFn2 getScreenLastRowColumnImpl screenRow self

foreign import getDocumentLastRowColumnImpl :: Fn3 Int Int EditSession (Effect Int)

getDocumentLastRowColumn :: Int -> Int -> EditSession -> Effect Int
getDocumentLastRowColumn docRow docColumn self = runFn3 getDocumentLastRowColumnImpl docRow docColumn self

foreign import getDocumentLastRowColumnPositionImpl :: Fn3 Int Int EditSession (Effect Int)

getDocumentLastRowColumnPosition :: Int -> Int -> EditSession -> Effect Int
getDocumentLastRowColumnPosition docRow docColumn self = runFn3 getDocumentLastRowColumnPositionImpl docRow docColumn self

foreign import getRowSplitData :: EditSession -> Effect String

foreign import getScreenTabSizeImpl :: Fn2 Int EditSession (Effect Int)

getScreenTabSize :: Int -> EditSession -> Effect Int
getScreenTabSize screenColumn self = runFn2 getScreenTabSizeImpl screenColumn self

foreign import screenToDocumentPositionImpl :: Fn3 Int Int EditSession (Effect Position)

screenToDocumentPosition :: Int -> Int -> EditSession -> Effect Position
screenToDocumentPosition screenRow screenColumn self = runFn3 screenToDocumentPositionImpl screenRow screenColumn self

foreign import documentToScreenPositionImpl :: Fn3 Int Int EditSession (Effect Position)

documentToScreenPosition :: Int -> Int -> EditSession -> Effect Position
documentToScreenPosition docRow docColumn self = runFn3 documentToScreenPositionImpl docRow docColumn self

foreign import documentToScreenColumnImpl :: Fn3 Int Int EditSession (Effect Int)

documentToScreenColumn :: Int -> Int -> EditSession -> Effect Int
documentToScreenColumn row docColumn self = runFn3 documentToScreenColumnImpl row docColumn self

foreign import documentToScreenRowImpl :: Fn3 Int Int EditSession (Effect Unit)

documentToScreenRow :: Int -> Int -> EditSession -> Effect Unit
documentToScreenRow docRow docColumn self = runFn3 documentToScreenRowImpl docRow docColumn self

foreign import getScreenLength :: EditSession -> Effect Int

foreign import createWithModeImpl :: Fn2 String (Nullable TextMode) (Effect EditSession)

createWithMode :: String -> Maybe TextMode -> Effect EditSession
createWithMode text mode' = runFn2 createWithModeImpl text (toNullable mode')

foreign import createImpl :: Fn2 String (Nullable String) (Effect EditSession)

create :: String -> Maybe String -> Effect EditSession
create content mode' = runFn2 createImpl content (toNullable mode')

foreign import createFromLinesImpl :: Fn2 (Array String) (Nullable String) (Effect EditSession)

createFromLines :: Array String -> Maybe String -> Effect EditSession
createFromLines text mode' = runFn2 createFromLinesImpl text (toNullable mode')

foreign import getMarkers
  :: EditSession -> Effect (Array Marker)
