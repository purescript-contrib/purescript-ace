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

import Ace.Types (Selection, EditSession, Position, Range)
import Effect (Effect)
import Data.Function.Uncurried (Fn2, runFn2, Fn3, runFn3, Fn4, runFn4)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)

foreign import onImpl :: forall a. Fn3 String (Effect a) Selection (Effect Unit)

onChangeCursor :: forall a. Selection -> Effect a -> Effect Unit
onChangeCursor self fn = runFn3 onImpl "changeCursor" fn self

onChangeSelection :: forall a. Selection -> Effect a -> Effect Unit
onChangeSelection self fn = runFn3 onImpl "changeSelection" fn self

foreign import moveCursorWordLeft :: Selection -> Effect Unit

foreign import moveCursorWordRight :: Selection -> Effect Unit

foreign import fromOrientedRangeImpl :: Fn2 Range Selection (Effect Unit)

fromOrientedRange :: Range -> Selection -> Effect Unit
fromOrientedRange range self = runFn2 fromOrientedRangeImpl range self

foreign import setSelectionRangeImpl :: Fn2 Range Selection (Effect Unit)

setSelectionRange :: Range -> Selection -> Effect Unit
setSelectionRange match self = runFn2 setSelectionRangeImpl match self

foreign import getAllRanges :: Selection -> Effect (Array Range)

foreign import addRangeImpl :: Fn2 Range Selection (Effect Unit)

addRange :: Range -> Selection -> Effect Unit
addRange range self = runFn2 addRangeImpl range self

foreign import isEmpty :: Selection -> Effect Boolean

foreign import isMultiLine :: Selection -> Effect Boolean

foreign import getCursor :: Selection -> Effect Position

foreign import setSelectionAnchorImpl :: Fn3 Int Int Selection (Effect Unit)

setSelectionAnchor :: Int -> Int -> Selection -> Effect Unit
setSelectionAnchor row column self = runFn3 setSelectionAnchorImpl row column self

foreign import getSelectionAnchor :: Selection -> Effect Position

foreign import getSelectionLead :: Selection -> Effect Position

foreign import shiftSelectionImpl :: Fn2 Int Selection (Effect Unit)

shiftSelection :: Int -> Selection -> Effect Unit
shiftSelection columns self = runFn2 shiftSelectionImpl columns self

foreign import isBackwards :: Selection -> Effect Boolean

foreign import getRange :: Selection -> Effect Range

foreign import clearSelection :: Selection -> Effect Unit

foreign import selectAll :: Selection -> Effect Unit

foreign import setRangeImpl :: Fn3 Range Boolean Selection (Effect Unit)

setRange :: Range -> Boolean -> Selection -> Effect Unit
setRange range reverse self = runFn3 setRangeImpl range reverse self

foreign import selectToImpl :: Fn3 Int Int Selection (Effect Unit)

selectTo :: Int -> Int -> Selection -> Effect Unit
selectTo row column self = runFn3 selectToImpl row column self

foreign import selectToPositionImpl :: Fn2 Position Selection (Effect Unit)

selectToPosition :: Position -> Selection -> Effect Unit
selectToPosition pos self = runFn2 selectToPositionImpl pos self

foreign import selectUp :: Selection -> Effect Unit

foreign import selectDown :: Selection -> Effect Unit

foreign import selectRight :: Selection -> Effect Unit

foreign import selectLeft :: Selection -> Effect Unit

foreign import selectLineStart :: Selection -> Effect Unit

foreign import selectLineEnd :: Selection -> Effect Unit

foreign import selectFileEnd :: Selection -> Effect Unit

foreign import selectFileStart :: Selection -> Effect Unit

foreign import selectWordRight :: Selection -> Effect Unit

foreign import selectWordLeft :: Selection -> Effect Unit

foreign import getWordRange :: Selection -> Effect Unit

foreign import selectWord :: Selection -> Effect Unit

foreign import selectAWord :: Selection -> Effect Unit

foreign import selectLine :: Selection -> Effect Unit

foreign import moveCursorUp :: Selection -> Effect Unit

foreign import moveCursorDown :: Selection -> Effect Unit

foreign import moveCursorLeft :: Selection -> Effect Unit

foreign import moveCursorRight :: Selection -> Effect Unit

foreign import moveCursorLineStart :: Selection -> Effect Unit

foreign import moveCursorLineEnd :: Selection -> Effect Unit

foreign import moveCursorFileEnd :: Selection -> Effect Unit

foreign import moveCursorFileStart :: Selection -> Effect Unit

foreign import moveCursorLongWordRight :: Selection -> Effect Unit

foreign import moveCursorLongWordLeft :: Selection -> Effect Unit

foreign import moveCursorByImpl :: Fn3 Int Int Selection (Effect Unit)

moveCursorBy :: Int -> Int -> Selection -> Effect Unit
moveCursorBy rows chars self = runFn3 moveCursorByImpl rows chars self

foreign import moveCursorToPositionImpl :: Fn2 Position Selection (Effect Unit)

moveCursorToPosition :: Position -> Selection -> Effect Unit
moveCursorToPosition position self = runFn2 moveCursorToPositionImpl position self

foreign import moveCursorToImpl :: Fn4 Int Int (Nullable Boolean) Selection (Effect Unit)

moveCursorTo :: Int -> Int -> Maybe Boolean -> Selection -> Effect Unit
moveCursorTo row column keepDesiredColumn self = runFn4 moveCursorToImpl row column (toNullable keepDesiredColumn) self

foreign import moveCursorToScreenImpl :: Fn4 Int Int Boolean Selection (Effect Unit)

moveCursorToScreen :: Int -> Int -> Boolean -> Selection -> Effect Unit
moveCursorToScreen row column keepDesiredColumn self = runFn4 moveCursorToScreenImpl row column keepDesiredColumn self

foreign import create :: EditSession -> Effect Selection
