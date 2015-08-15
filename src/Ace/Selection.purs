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

import Control.Monad.Eff (Eff())

import Data.Function (Fn2(), runFn2, Fn3(), runFn3, Fn4(), runFn4)
import Data.Maybe (Maybe())
import Data.Nullable (Nullable(), toNullable)

import Ace.Types

foreign import onImpl :: forall eff a. Fn3 String (Eff (ace :: ACE | eff) a) Selection (Eff (ace :: ACE | eff) Unit)

onChangeCursor :: forall eff a. Selection -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
onChangeCursor self fn = runFn3 onImpl "changeCursor" fn self

onChangeSelection :: forall eff a. Selection -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
onChangeSelection self fn = runFn3 onImpl "changeSelection" fn self

foreign import moveCursorWordLeft :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import moveCursorWordRight :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import fromOrientedRangeImpl :: forall eff. Fn2 Range Selection (Eff (ace :: ACE | eff) Unit)

fromOrientedRange :: forall eff. Range -> Selection -> Eff (ace :: ACE | eff) Unit
fromOrientedRange range self = runFn2 fromOrientedRangeImpl range self

foreign import setSelectionRangeImpl :: forall eff. Fn2 Range Selection (Eff (ace :: ACE | eff) Unit)

setSelectionRange :: forall eff. Range -> Selection -> Eff (ace :: ACE | eff) Unit
setSelectionRange match self = runFn2 setSelectionRangeImpl match self

foreign import getAllRanges :: forall eff. Selection -> Eff (ace :: ACE | eff) (Array Range)

foreign import addRangeImpl :: forall eff. Fn2 Range Selection (Eff (ace :: ACE | eff) Unit)

addRange :: forall eff. Range -> Selection -> Eff (ace :: ACE | eff) Unit
addRange range self = runFn2 addRangeImpl range self

foreign import isEmpty :: forall eff. Selection -> Eff (ace :: ACE | eff) Boolean

foreign import isMultiLine :: forall eff. Selection -> Eff (ace :: ACE | eff) Boolean

foreign import getCursor :: forall eff. Selection -> Eff (ace :: ACE | eff) Position

foreign import setSelectionAnchorImpl :: forall eff. Fn3 Int Int Selection (Eff (ace :: ACE | eff) Unit)

setSelectionAnchor :: forall eff. Int -> Int -> Selection -> Eff (ace :: ACE | eff) Unit
setSelectionAnchor row column self = runFn3 setSelectionAnchorImpl row column self

foreign import getSelectionAnchor :: forall eff. Selection -> Eff (ace :: ACE | eff) Position

foreign import getSelectionLead :: forall eff. Selection -> Eff (ace :: ACE | eff) Position

foreign import shiftSelectionImpl :: forall eff. Fn2 Int Selection (Eff (ace :: ACE | eff) Unit)

shiftSelection :: forall eff. Int -> Selection -> Eff (ace :: ACE | eff) Unit
shiftSelection columns self = runFn2 shiftSelectionImpl columns self

foreign import isBackwards :: forall eff. Selection -> Eff (ace :: ACE | eff) Boolean

foreign import getRange :: forall eff. Selection -> Eff (ace :: ACE | eff) Range

foreign import clearSelection :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import selectAll :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import setRangeImpl :: forall eff. Fn3 Range Boolean Selection (Eff (ace :: ACE | eff) Unit)

setRange :: forall eff. Range -> Boolean -> Selection -> Eff (ace :: ACE | eff) Unit
setRange range reverse self = runFn3 setRangeImpl range reverse self

foreign import selectToImpl :: forall eff. Fn3 Int Int Selection (Eff (ace :: ACE | eff) Unit)

selectTo :: forall eff. Int -> Int -> Selection -> Eff (ace :: ACE | eff) Unit
selectTo row column self = runFn3 selectToImpl row column self

foreign import selectToPositionImpl :: forall eff. Fn2 Position Selection (Eff (ace :: ACE | eff) Unit)

selectToPosition :: forall eff. Position -> Selection -> Eff (ace :: ACE | eff) Unit
selectToPosition pos self = runFn2 selectToPositionImpl pos self

foreign import selectUp :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import selectDown :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import selectRight :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import selectLeft :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import selectLineStart :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import selectLineEnd :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import selectFileEnd :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import selectFileStart :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import selectWordRight :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import selectWordLeft :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import getWordRange :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import selectWord :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import selectAWord :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import selectLine :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import moveCursorUp :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import moveCursorDown :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import moveCursorLeft :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import moveCursorRight :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import moveCursorLineStart :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import moveCursorLineEnd :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import moveCursorFileEnd :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import moveCursorFileStart :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import moveCursorLongWordRight :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

foreign import moveCursorLongWordLeft :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit

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

foreign import create :: forall eff. EditSession -> Eff (ace :: ACE | eff) Selection

