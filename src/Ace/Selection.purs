module Ace.Selection
  ( addRange
  , clearSelection
  , create
  , fromOrientedRange
  , getAllRanges
  , getCursor
  , getRange
  , getSelectionAnchor
  , getSelectionLead
  , getWordRange
  , isBackwards
  , isEmpty
  , isMultiLine
  , moveCursorBy
  , moveCursorDown
  , moveCursorFileEnd
  , moveCursorFileStart
  , moveCursorLeft
  , moveCursorLineEnd
  , moveCursorLineStart
  , moveCursorLongWordLeft
  , moveCursorLongWordRight
  , moveCursorRight
  , moveCursorTo
  , moveCursorToPosition
  , moveCursorToScreen
  , moveCursorUp
  , moveCursorWordLeft
  , moveCursorWordRight
  , onChangeCursor
  , onChangeSelection
  , selectAWord
  , selectAll
  , selectDown
  , selectFileEnd
  , selectFileStart
  , selectLeft
  , selectLineEnd
  , selectLine
  , selectLineStart
  , selectRight
  , selectTo
  , selectToPosition
  , selectUp
  , selectWord
  , selectWordLeft
  , selectWordRight
  , setRange
  , setSelectionAnchor
  , setSelectionRange
  , shiftSelection
  ) where

import Prelude

import Data.Maybe
import Data.Function

import Control.Monad.Eff

import Ace.Types
import Data.Nullable

foreign import onImpl :: forall eff a. Fn3 String (Eff (ace :: ACE | eff) a) Selection (Eff (ace :: ACE | eff) Unit)

onChangeCursor :: forall eff a. Selection -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
onChangeCursor self fn = runFn3 onImpl "changeCursor" fn self

onChangeSelection :: forall eff a. Selection -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
onChangeSelection self fn = runFn3 onImpl "changeSelection" fn self

foreign import moveCursorWordLeftImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

moveCursorWordLeft :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
moveCursorWordLeft self = runFn1 moveCursorWordLeftImpl self

foreign import moveCursorWordRightImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

moveCursorWordRight :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
moveCursorWordRight self = runFn1 moveCursorWordRightImpl self

foreign import fromOrientedRangeImpl :: forall eff. Fn2 Range Selection (Eff (ace :: ACE | eff) Unit)

fromOrientedRange :: forall eff. Range -> Selection -> Eff (ace :: ACE | eff) Unit
fromOrientedRange range self = runFn2 fromOrientedRangeImpl range self

foreign import setSelectionRangeImpl :: forall eff. Fn2 Range Selection (Eff (ace :: ACE | eff) Unit)

setSelectionRange :: forall eff. Range -> Selection -> Eff (ace :: ACE | eff) Unit
setSelectionRange match self = runFn2 setSelectionRangeImpl match self

foreign import getAllRangesImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) (Array Range))

getAllRanges :: forall eff. Selection -> Eff (ace :: ACE | eff) (Array Range)
getAllRanges self = runFn1 getAllRangesImpl self

foreign import addRangeImpl :: forall eff. Fn2 Range Selection (Eff (ace :: ACE | eff) Unit)

addRange :: forall eff. Range -> Selection -> Eff (ace :: ACE | eff) Unit
addRange range self = runFn2 addRangeImpl range self

foreign import isEmptyImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Boolean)

isEmpty :: forall eff. Selection -> Eff (ace :: ACE | eff) Boolean
isEmpty self = runFn1 isEmptyImpl self

foreign import isMultiLineImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Boolean)

isMultiLine :: forall eff. Selection -> Eff (ace :: ACE | eff) Boolean
isMultiLine self = runFn1 isMultiLineImpl self

foreign import getCursorImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Position)

getCursor :: forall eff. Selection -> Eff (ace :: ACE | eff) Position
getCursor self = runFn1 getCursorImpl self

foreign import setSelectionAnchorImpl :: forall eff. Fn3 Int Int Selection (Eff (ace :: ACE | eff) Unit)

setSelectionAnchor :: forall eff. Int -> Int -> Selection -> Eff (ace :: ACE | eff) Unit
setSelectionAnchor row column self = runFn3 setSelectionAnchorImpl row column self

foreign import getSelectionAnchorImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Position)

getSelectionAnchor :: forall eff. Selection -> Eff (ace :: ACE | eff) Position
getSelectionAnchor self = runFn1 getSelectionAnchorImpl self

foreign import getSelectionLeadImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Position)

getSelectionLead :: forall eff. Selection -> Eff (ace :: ACE | eff) Position
getSelectionLead self = runFn1 getSelectionLeadImpl self

foreign import shiftSelectionImpl :: forall eff. Fn2 Int Selection (Eff (ace :: ACE | eff) Unit)

shiftSelection :: forall eff. Int -> Selection -> Eff (ace :: ACE | eff) Unit
shiftSelection columns self = runFn2 shiftSelectionImpl columns self

foreign import isBackwardsImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Boolean)

isBackwards :: forall eff. Selection -> Eff (ace :: ACE | eff) Boolean
isBackwards self = runFn1 isBackwardsImpl self

foreign import getRangeImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Range)

getRange :: forall eff. Selection -> Eff (ace :: ACE | eff) Range
getRange self = runFn1 getRangeImpl self

foreign import clearSelectionImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

clearSelection :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
clearSelection self = runFn1 clearSelectionImpl self

foreign import selectAllImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

selectAll :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
selectAll self = runFn1 selectAllImpl self

foreign import setRangeImpl :: forall eff. Fn3 Range Boolean Selection (Eff (ace :: ACE | eff) Unit)

setRange :: forall eff. Range -> Boolean -> Selection -> Eff (ace :: ACE | eff) Unit
setRange range reverse self = runFn3 setRangeImpl range reverse self

foreign import selectToImpl :: forall eff. Fn3 Int Int Selection (Eff (ace :: ACE | eff) Unit)

selectTo :: forall eff. Int -> Int -> Selection -> Eff (ace :: ACE | eff) Unit
selectTo row column self = runFn3 selectToImpl row column self

foreign import selectToPositionImpl :: forall eff. Fn2 Position Selection (Eff (ace :: ACE | eff) Unit)

selectToPosition :: forall eff. Position -> Selection -> Eff (ace :: ACE | eff) Unit
selectToPosition pos self = runFn2 selectToPositionImpl pos self

foreign import selectUpImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

selectUp :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
selectUp self = runFn1 selectUpImpl self

foreign import selectDownImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

selectDown :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
selectDown self = runFn1 selectDownImpl self

foreign import selectRightImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

selectRight :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
selectRight self = runFn1 selectRightImpl self

foreign import selectLeftImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

selectLeft :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
selectLeft self = runFn1 selectLeftImpl self

foreign import selectLineStartImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

selectLineStart :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
selectLineStart self = runFn1 selectLineStartImpl self

foreign import selectLineEndImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

selectLineEnd :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
selectLineEnd self = runFn1 selectLineEndImpl self

foreign import selectFileEndImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

selectFileEnd :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
selectFileEnd self = runFn1 selectFileEndImpl self

foreign import selectFileStartImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

selectFileStart :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
selectFileStart self = runFn1 selectFileStartImpl self

foreign import selectWordRightImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

selectWordRight :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
selectWordRight self = runFn1 selectWordRightImpl self

foreign import selectWordLeftImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

selectWordLeft :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
selectWordLeft self = runFn1 selectWordLeftImpl self

foreign import getWordRangeImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

getWordRange :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
getWordRange self = runFn1 getWordRangeImpl self

foreign import selectWordImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

selectWord :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
selectWord self = runFn1 selectWordImpl self

foreign import selectAWordImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

selectAWord :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
selectAWord self = runFn1 selectAWordImpl self

foreign import selectLineImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

selectLine :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
selectLine self = runFn1 selectLineImpl self

foreign import moveCursorUpImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

moveCursorUp :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
moveCursorUp self = runFn1 moveCursorUpImpl self

foreign import moveCursorDownImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

moveCursorDown :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
moveCursorDown self = runFn1 moveCursorDownImpl self

foreign import moveCursorLeftImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

moveCursorLeft :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
moveCursorLeft self = runFn1 moveCursorLeftImpl self

foreign import moveCursorRightImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

moveCursorRight :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
moveCursorRight self = runFn1 moveCursorRightImpl self

foreign import moveCursorLineStartImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

moveCursorLineStart :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
moveCursorLineStart self = runFn1 moveCursorLineStartImpl self

foreign import moveCursorLineEndImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

moveCursorLineEnd :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
moveCursorLineEnd self = runFn1 moveCursorLineEndImpl self

foreign import moveCursorFileEndImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

moveCursorFileEnd :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
moveCursorFileEnd self = runFn1 moveCursorFileEndImpl self

foreign import moveCursorFileStartImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

moveCursorFileStart :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
moveCursorFileStart self = runFn1 moveCursorFileStartImpl self

foreign import moveCursorLongWordRightImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

moveCursorLongWordRight :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
moveCursorLongWordRight self = runFn1 moveCursorLongWordRightImpl self

foreign import moveCursorLongWordLeftImpl :: forall eff. Fn1 Selection (Eff (ace :: ACE | eff) Unit)

moveCursorLongWordLeft :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
moveCursorLongWordLeft self = runFn1 moveCursorLongWordLeftImpl self

foreign import moveCursorByImpl :: forall eff. Fn3 Int Int Selection (Eff (ace :: ACE | eff) Unit)

moveCursorBy :: forall eff. Int -> Int -> Selection -> Eff (ace :: ACE | eff) Unit
moveCursorBy rows chars self = runFn3 moveCursorByImpl rows chars self

foreign import moveCursorToPositionImpl :: forall eff. Fn2 Position Selection (Eff (ace :: ACE | eff) Unit)

moveCursorToPosition :: forall eff. Position -> Selection -> Eff (ace :: ACE | eff) Unit
moveCursorToPosition position self = runFn2 moveCursorToPositionImpl position self

foreign import moveCursorToImpl :: forall eff. Fn4 Int Int (Nullable Boolean) Selection (Eff (ace :: ACE | eff) Unit)

moveCursorTo :: forall eff. Int -> Int -> Maybe Boolean -> Selection -> Eff (ace :: ACE | eff) Unit
moveCursorTo row column keepDesiredColumn self = runFn4 moveCursorToImpl row column (toNullable keepDesiredColumn) self

foreign import moveCursorToScreenImpl :: forall eff. Fn4 Int Int Boolean Selection (Eff (ace :: ACE | eff) Unit)

moveCursorToScreen :: forall eff. Int -> Int -> Boolean -> Selection -> Eff (ace :: ACE | eff) Unit
moveCursorToScreen row column keepDesiredColumn self = runFn4 moveCursorToScreenImpl row column keepDesiredColumn self

foreign import createImpl :: forall eff. Fn1 EditSession (Eff (ace :: ACE | eff) Selection)

create :: forall eff. EditSession -> Eff (ace :: ACE | eff) Selection
create session = runFn1 createImpl session
