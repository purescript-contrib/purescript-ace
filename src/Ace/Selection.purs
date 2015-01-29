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

import Data.Maybe
import Data.Function

import Control.Monad.Eff

import Ace.Types
import Data.Nullable

foreign import onImpl
  "function onImpl(ev, fn, self) {\
  \  return function() {\
  \    return self.on(ev, function() {\
  \      fn();\
  \    });\
  \  };\
  \}" :: forall eff a. Fn3 String (Eff (ace :: EAce | eff) a) Selection (Eff (ace :: EAce | eff) Unit)

onChangeCursor :: forall eff a. Selection -> Eff (ace :: EAce | eff) a -> Eff (ace :: EAce | eff) Unit
onChangeCursor self fn = runFn3 onImpl "changeCursor" fn self

onChangeSelection :: forall eff a. Selection -> Eff (ace :: EAce | eff) a -> Eff (ace :: EAce | eff) Unit
onChangeSelection self fn = runFn3 onImpl "changeSelection" fn self

foreign import moveCursorWordLeftImpl
  "function moveCursorWordLeftImpl(self) {\
  \  return function() {\
  \    return self.moveCursorWordLeft();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

moveCursorWordLeft :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
moveCursorWordLeft self = runFn1 moveCursorWordLeftImpl self

foreign import moveCursorWordRightImpl
  "function moveCursorWordRightImpl(self) {\
  \  return function() {\
  \    return self.moveCursorWordRight();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

moveCursorWordRight :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
moveCursorWordRight self = runFn1 moveCursorWordRightImpl self

foreign import fromOrientedRangeImpl
  "function fromOrientedRangeImpl(range, self) {\
  \  return function() {\
  \    return self.fromOrientedRange(range);\
  \  };\
  \}" :: forall eff. Fn2 Range Selection (Eff (ace :: EAce | eff) Unit)

fromOrientedRange :: forall eff. Range -> Selection -> Eff (ace :: EAce | eff) Unit
fromOrientedRange range self = runFn2 fromOrientedRangeImpl range self

foreign import setSelectionRangeImpl
  "function setSelectionRangeImpl(match, self) {\
  \  return function() {\
  \    return self.setSelectionRange(match);\
  \  };\
  \}" :: forall eff. Fn2 Range Selection (Eff (ace :: EAce | eff) Unit)

setSelectionRange :: forall eff. Range -> Selection -> Eff (ace :: EAce | eff) Unit
setSelectionRange match self = runFn2 setSelectionRangeImpl match self

foreign import getAllRangesImpl
  "function getAllRangesImpl(self) {\
  \  return function() {\
  \    return self.getAllRanges();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) [Range])

getAllRanges :: forall eff. Selection -> Eff (ace :: EAce | eff) [Range]
getAllRanges self = runFn1 getAllRangesImpl self

foreign import addRangeImpl
  "function addRangeImpl(range, self) {\
  \  return function() {\
  \    return self.addRange(range);\
  \  };\
  \}" :: forall eff. Fn2 Range Selection (Eff (ace :: EAce | eff) Unit)

addRange :: forall eff. Range -> Selection -> Eff (ace :: EAce | eff) Unit
addRange range self = runFn2 addRangeImpl range self

foreign import isEmptyImpl
  "function isEmptyImpl(self) {\
  \  return function() {\
  \    return self.isEmpty();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Boolean)

isEmpty :: forall eff. Selection -> Eff (ace :: EAce | eff) Boolean
isEmpty self = runFn1 isEmptyImpl self

foreign import isMultiLineImpl
  "function isMultiLineImpl(self) {\
  \  return function() {\
  \    return self.isMultiLine();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Boolean)

isMultiLine :: forall eff. Selection -> Eff (ace :: EAce | eff) Boolean
isMultiLine self = runFn1 isMultiLineImpl self

foreign import getCursorImpl
  "function getCursorImpl(self) {\
  \  return function() {\
  \    return self.getCursor();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Position)

getCursor :: forall eff. Selection -> Eff (ace :: EAce | eff) Position
getCursor self = runFn1 getCursorImpl self

foreign import setSelectionAnchorImpl
  "function setSelectionAnchorImpl(row, column, self) {\
  \  return function() {\
  \    return self.setSelectionAnchor(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Selection (Eff (ace :: EAce | eff) Unit)

setSelectionAnchor :: forall eff. Number -> Number -> Selection -> Eff (ace :: EAce | eff) Unit
setSelectionAnchor row column self = runFn3 setSelectionAnchorImpl row column self

foreign import getSelectionAnchorImpl
  "function getSelectionAnchorImpl(self) {\
  \  return function() {\
  \    return self.getSelectionAnchor();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Position)

getSelectionAnchor :: forall eff. Selection -> Eff (ace :: EAce | eff) Position
getSelectionAnchor self = runFn1 getSelectionAnchorImpl self

foreign import getSelectionLeadImpl
  "function getSelectionLeadImpl(self) {\
  \  return function() {\
  \    return self.getSelectionLead();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Position)

getSelectionLead :: forall eff. Selection -> Eff (ace :: EAce | eff) Position
getSelectionLead self = runFn1 getSelectionLeadImpl self

foreign import shiftSelectionImpl
  "function shiftSelectionImpl(columns, self) {\
  \  return function() {\
  \    return self.shiftSelection(columns);\
  \  };\
  \}" :: forall eff. Fn2 Number Selection (Eff (ace :: EAce | eff) Unit)

shiftSelection :: forall eff. Number -> Selection -> Eff (ace :: EAce | eff) Unit
shiftSelection columns self = runFn2 shiftSelectionImpl columns self

foreign import isBackwardsImpl
  "function isBackwardsImpl(self) {\
  \  return function() {\
  \    return self.isBackwards();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Boolean)

isBackwards :: forall eff. Selection -> Eff (ace :: EAce | eff) Boolean
isBackwards self = runFn1 isBackwardsImpl self

foreign import getRangeImpl
  "function getRangeImpl(self) {\
  \  return function() {\
  \    return self.getRange();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Range)

getRange :: forall eff. Selection -> Eff (ace :: EAce | eff) Range
getRange self = runFn1 getRangeImpl self

foreign import clearSelectionImpl
  "function clearSelectionImpl(self) {\
  \  return function() {\
  \    return self.clearSelection();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

clearSelection :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
clearSelection self = runFn1 clearSelectionImpl self

foreign import selectAllImpl
  "function selectAllImpl(self) {\
  \  return function() {\
  \    return self.selectAll();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

selectAll :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
selectAll self = runFn1 selectAllImpl self

foreign import setRangeImpl
  "function setRangeImpl(range, reverse, self) {\
  \  return function() {\
  \    return self.setRange(range, reverse);\
  \  };\
  \}" :: forall eff. Fn3 Range Boolean Selection (Eff (ace :: EAce | eff) Unit)

setRange :: forall eff. Range -> Boolean -> Selection -> Eff (ace :: EAce | eff) Unit
setRange range reverse self = runFn3 setRangeImpl range reverse self

foreign import selectToImpl
  "function selectToImpl(row, column, self) {\
  \  return function() {\
  \    return self.selectTo(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Selection (Eff (ace :: EAce | eff) Unit)

selectTo :: forall eff. Number -> Number -> Selection -> Eff (ace :: EAce | eff) Unit
selectTo row column self = runFn3 selectToImpl row column self

foreign import selectToPositionImpl
  "function selectToPositionImpl(pos, self) {\
  \  return function() {\
  \    return self.selectToPosition(pos);\
  \  };\
  \}" :: forall eff. Fn2 Position Selection (Eff (ace :: EAce | eff) Unit)

selectToPosition :: forall eff. Position -> Selection -> Eff (ace :: EAce | eff) Unit
selectToPosition pos self = runFn2 selectToPositionImpl pos self

foreign import selectUpImpl
  "function selectUpImpl(self) {\
  \  return function() {\
  \    return self.selectUp();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

selectUp :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
selectUp self = runFn1 selectUpImpl self

foreign import selectDownImpl
  "function selectDownImpl(self) {\
  \  return function() {\
  \    return self.selectDown();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

selectDown :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
selectDown self = runFn1 selectDownImpl self

foreign import selectRightImpl
  "function selectRightImpl(self) {\
  \  return function() {\
  \    return self.selectRight();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

selectRight :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
selectRight self = runFn1 selectRightImpl self

foreign import selectLeftImpl
  "function selectLeftImpl(self) {\
  \  return function() {\
  \    return self.selectLeft();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

selectLeft :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
selectLeft self = runFn1 selectLeftImpl self

foreign import selectLineStartImpl
  "function selectLineStartImpl(self) {\
  \  return function() {\
  \    return self.selectLineStart();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

selectLineStart :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
selectLineStart self = runFn1 selectLineStartImpl self

foreign import selectLineEndImpl
  "function selectLineEndImpl(self) {\
  \  return function() {\
  \    return self.selectLineEnd();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

selectLineEnd :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
selectLineEnd self = runFn1 selectLineEndImpl self

foreign import selectFileEndImpl
  "function selectFileEndImpl(self) {\
  \  return function() {\
  \    return self.selectFileEnd();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

selectFileEnd :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
selectFileEnd self = runFn1 selectFileEndImpl self

foreign import selectFileStartImpl
  "function selectFileStartImpl(self) {\
  \  return function() {\
  \    return self.selectFileStart();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

selectFileStart :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
selectFileStart self = runFn1 selectFileStartImpl self

foreign import selectWordRightImpl
  "function selectWordRightImpl(self) {\
  \  return function() {\
  \    return self.selectWordRight();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

selectWordRight :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
selectWordRight self = runFn1 selectWordRightImpl self

foreign import selectWordLeftImpl
  "function selectWordLeftImpl(self) {\
  \  return function() {\
  \    return self.selectWordLeft();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

selectWordLeft :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
selectWordLeft self = runFn1 selectWordLeftImpl self

foreign import getWordRangeImpl
  "function getWordRangeImpl(self) {\
  \  return function() {\
  \    return self.getWordRange();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

getWordRange :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
getWordRange self = runFn1 getWordRangeImpl self

foreign import selectWordImpl
  "function selectWordImpl(self) {\
  \  return function() {\
  \    return self.selectWord();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

selectWord :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
selectWord self = runFn1 selectWordImpl self

foreign import selectAWordImpl
  "function selectAWordImpl(self) {\
  \  return function() {\
  \    return self.selectAWord();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

selectAWord :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
selectAWord self = runFn1 selectAWordImpl self

foreign import selectLineImpl
  "function selectLineImpl(self) {\
  \  return function() {\
  \    return self.selectLine();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

selectLine :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
selectLine self = runFn1 selectLineImpl self

foreign import moveCursorUpImpl
  "function moveCursorUpImpl(self) {\
  \  return function() {\
  \    return self.moveCursorUp();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

moveCursorUp :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
moveCursorUp self = runFn1 moveCursorUpImpl self

foreign import moveCursorDownImpl
  "function moveCursorDownImpl(self) {\
  \  return function() {\
  \    return self.moveCursorDown();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

moveCursorDown :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
moveCursorDown self = runFn1 moveCursorDownImpl self

foreign import moveCursorLeftImpl
  "function moveCursorLeftImpl(self) {\
  \  return function() {\
  \    return self.moveCursorLeft();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

moveCursorLeft :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
moveCursorLeft self = runFn1 moveCursorLeftImpl self

foreign import moveCursorRightImpl
  "function moveCursorRightImpl(self) {\
  \  return function() {\
  \    return self.moveCursorRight();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

moveCursorRight :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
moveCursorRight self = runFn1 moveCursorRightImpl self

foreign import moveCursorLineStartImpl
  "function moveCursorLineStartImpl(self) {\
  \  return function() {\
  \    return self.moveCursorLineStart();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

moveCursorLineStart :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
moveCursorLineStart self = runFn1 moveCursorLineStartImpl self

foreign import moveCursorLineEndImpl
  "function moveCursorLineEndImpl(self) {\
  \  return function() {\
  \    return self.moveCursorLineEnd();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

moveCursorLineEnd :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
moveCursorLineEnd self = runFn1 moveCursorLineEndImpl self

foreign import moveCursorFileEndImpl
  "function moveCursorFileEndImpl(self) {\
  \  return function() {\
  \    return self.moveCursorFileEnd();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

moveCursorFileEnd :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
moveCursorFileEnd self = runFn1 moveCursorFileEndImpl self

foreign import moveCursorFileStartImpl
  "function moveCursorFileStartImpl(self) {\
  \  return function() {\
  \    return self.moveCursorFileStart();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

moveCursorFileStart :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
moveCursorFileStart self = runFn1 moveCursorFileStartImpl self

foreign import moveCursorLongWordRightImpl
  "function moveCursorLongWordRightImpl(self) {\
  \  return function() {\
  \    return self.moveCursorLongWordRight();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

moveCursorLongWordRight :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
moveCursorLongWordRight self = runFn1 moveCursorLongWordRightImpl self

foreign import moveCursorLongWordLeftImpl
  "function moveCursorLongWordLeftImpl(self) {\
  \  return function() {\
  \    return self.moveCursorLongWordLeft();\
  \  };\
  \}" :: forall eff. Fn1 Selection (Eff (ace :: EAce | eff) Unit)

moveCursorLongWordLeft :: forall eff. Selection -> Eff (ace :: EAce | eff) Unit
moveCursorLongWordLeft self = runFn1 moveCursorLongWordLeftImpl self

foreign import moveCursorByImpl
  "function moveCursorByImpl(rows, chars, self) {\
  \  return function() {\
  \    return self.moveCursorBy(rows, chars);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Selection (Eff (ace :: EAce | eff) Unit)

moveCursorBy :: forall eff. Number -> Number -> Selection -> Eff (ace :: EAce | eff) Unit
moveCursorBy rows chars self = runFn3 moveCursorByImpl rows chars self

foreign import moveCursorToPositionImpl
  "function moveCursorToPositionImpl(position, self) {\
  \  return function() {\
  \    return self.moveCursorToPosition(position);\
  \  };\
  \}" :: forall eff. Fn2 Position Selection (Eff (ace :: EAce | eff) Unit)

moveCursorToPosition :: forall eff. Position -> Selection -> Eff (ace :: EAce | eff) Unit
moveCursorToPosition position self = runFn2 moveCursorToPositionImpl position self

foreign import moveCursorToImpl
  "function moveCursorToImpl(row, column, keepDesiredColumn, self) {\
  \  return function() {\
  \    return self.moveCursorTo(row, column, keepDesiredColumn);\
  \  };\
  \}" :: forall eff. Fn4 Number Number (Nullable Boolean) Selection (Eff (ace :: EAce | eff) Unit)

moveCursorTo :: forall eff. Number -> Number -> Maybe Boolean -> Selection -> Eff (ace :: EAce | eff) Unit
moveCursorTo row column keepDesiredColumn self = runFn4 moveCursorToImpl row column (toNullable keepDesiredColumn) self

foreign import moveCursorToScreenImpl
  "function moveCursorToScreenImpl(row, column, keepDesiredColumn, self) {\
  \  return function() {\
  \    return self.moveCursorToScreen(row, column, keepDesiredColumn);\
  \  };\
  \}" :: forall eff. Fn4 Number Number Boolean Selection (Eff (ace :: EAce | eff) Unit)

moveCursorToScreen :: forall eff. Number -> Number -> Boolean -> Selection -> Eff (ace :: EAce | eff) Unit
moveCursorToScreen row column keepDesiredColumn self = runFn4 moveCursorToScreenImpl row column keepDesiredColumn self

foreign import createImpl
  "function createImpl(session) {\
  \  return function() {\
  \    var Selection = ace.require('ace/selection').Selection;\
  \    return new Selection(session);\
  \  };\
  \}" :: forall eff. Fn1 EditSession (Eff (ace :: EAce | eff) Selection)

create :: forall eff. EditSession -> Eff (ace :: EAce | eff) Selection
create session = runFn1 createImpl session
