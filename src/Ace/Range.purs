module Ace.Range
  ( clipRows
  , clone
  , collapseRows
  , compare
  , compareEnd
  , compareInside
  , comparePoint
  , compareRange
  , compareStart
  , contains
  , containsRange
  , create
  , extend
  , fromPoints
  , getEnd
  , getEndRow
  , getStartColumn
  , inside
  , insideEnd
  , insideStart
  , intersects
  , isEmpty
  , isEnd
  , isEqual
  , isMultiLine
  , isStart
  , setEnd
  , setStart
  , toScreenRange
  , toString
  ) where

import Prelude hiding (compare)

import Data.Maybe
import Data.Function

import Control.Monad.Eff

import Ace.Types

foreign import getStartRow
  "function getStartRow(value) {\
  \  return function() {\
  \    return value.startRow;\
  \  };\
  \}" :: forall eff. Range -> Eff (ace :: ACE | eff) Number

foreign import getStartColumn
  "function getStartColumn(value) {\
  \  return function() {\
  \    return value.startColumn;\
  \  };\
  \}" :: forall eff. Range -> Eff (ace :: ACE | eff) Number

foreign import getEndRow
  "function getEndRow(value) {\
  \  return function() {\
  \    return value.endRow;\
  \  };\
  \}" :: forall eff. Range -> Eff (ace :: ACE | eff) Number

foreign import getEndColumn
  "function getEndColumn(value) {\
  \  return function() {\
  \    return value.endColumn;\
  \  };\
  \}" :: forall eff. Range -> Eff (ace :: ACE | eff) Number

foreign import getStart
  "function getStart(value) {\
  \  return function() {\
  \    return value.start;\
  \  };\
  \}" :: forall eff. Range -> Eff (ace :: ACE | eff) Position

foreign import getEnd
  "function getEnd(value) {\
  \  return function() {\
  \    return value.end;\
  \  };\
  \}" :: forall eff. Range -> Eff (ace :: ACE | eff) Position

foreign import isEmptyImpl
  "function isEmptyImpl(self) {\
  \  return function() {\
  \    return self.isEmpty();\
  \  };\
  \}" :: forall eff. Fn1 Range (Eff (ace :: ACE | eff) Boolean)

isEmpty :: forall eff. Range -> Eff (ace :: ACE | eff) Boolean
isEmpty self = runFn1 isEmptyImpl self

foreign import isEqualImpl
  "function isEqualImpl(range, self) {\
  \  return function() {\
  \    return self.isEqual(range);\
  \  };\
  \}" :: forall eff. Fn2 Range Range (Eff (ace :: ACE | eff) Unit)

isEqual :: forall eff. Range -> Range -> Eff (ace :: ACE | eff) Unit
isEqual range self = runFn2 isEqualImpl range self

foreign import toStringImpl
  "function toStringImpl(self) {\
  \  return function() {\
  \    return self.toString();\
  \  };\
  \}" :: forall eff. Fn1 Range (Eff (ace :: ACE | eff) Unit)

toString :: forall eff. Range -> Eff (ace :: ACE | eff) Unit
toString self = runFn1 toStringImpl self

foreign import containsImpl
  "function containsImpl(row, column, self) {\
  \  return function() {\
  \    return self.contains(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Range (Eff (ace :: ACE | eff) Boolean)

contains :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Boolean
contains row column self = runFn3 containsImpl row column self

foreign import compareRangeImpl
  "function compareRangeImpl(range, self) {\
  \  return function() {\
  \    return self.compareRange(range);\
  \  };\
  \}" :: forall eff. Fn2 Range Range (Eff (ace :: ACE | eff) Number)

compareRange :: forall eff. Range -> Range -> Eff (ace :: ACE | eff) Number
compareRange range self = runFn2 compareRangeImpl range self

foreign import comparePointImpl
  "function comparePointImpl(p, self) {\
  \  return function() {\
  \    return self.comparePoint(p);\
  \  };\
  \}" :: forall eff. Fn2 Range Range (Eff (ace :: ACE | eff) Number)

comparePoint :: forall eff. Range -> Range -> Eff (ace :: ACE | eff) Number
comparePoint p self = runFn2 comparePointImpl p self

foreign import containsRangeImpl
  "function containsRangeImpl(range, self) {\
  \  return function() {\
  \    return self.containsRange(range);\
  \  };\
  \}" :: forall eff. Fn2 Range Range (Eff (ace :: ACE | eff) Boolean)

containsRange :: forall eff. Range -> Range -> Eff (ace :: ACE | eff) Boolean
containsRange range self = runFn2 containsRangeImpl range self

foreign import intersectsImpl
  "function intersectsImpl(range, self) {\
  \  return function() {\
  \    return self.intersects(range);\
  \  };\
  \}" :: forall eff. Fn2 Range Range (Eff (ace :: ACE | eff) Boolean)

intersects :: forall eff. Range -> Range -> Eff (ace :: ACE | eff) Boolean
intersects range self = runFn2 intersectsImpl range self

foreign import isEndImpl
  "function isEndImpl(row, column, self) {\
  \  return function() {\
  \    return self.isEnd(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Range (Eff (ace :: ACE | eff) Boolean)

isEnd :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Boolean
isEnd row column self = runFn3 isEndImpl row column self

foreign import isStartImpl
  "function isStartImpl(row, column, self) {\
  \  return function() {\
  \    return self.isStart(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Range (Eff (ace :: ACE | eff) Boolean)

isStart :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Boolean
isStart row column self = runFn3 isStartImpl row column self

foreign import setStartImpl
  "function setStartImpl(row, column, self) {\
  \  return function() {\
  \    return self.setStart(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Range (Eff (ace :: ACE | eff) Unit)

setStart :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Unit
setStart row column self = runFn3 setStartImpl row column self

foreign import setEndImpl
  "function setEndImpl(row, column, self) {\
  \  return function() {\
  \    return self.setEnd(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Range (Eff (ace :: ACE | eff) Unit)

setEnd :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Unit
setEnd row column self = runFn3 setEndImpl row column self

foreign import insideImpl
  "function insideImpl(row, column, self) {\
  \  return function() {\
  \    return self.inside(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Range (Eff (ace :: ACE | eff) Boolean)

inside :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Boolean
inside row column self = runFn3 insideImpl row column self

foreign import insideStartImpl
  "function insideStartImpl(row, column, self) {\
  \  return function() {\
  \    return self.insideStart(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Range (Eff (ace :: ACE | eff) Boolean)

insideStart :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Boolean
insideStart row column self = runFn3 insideStartImpl row column self

foreign import insideEndImpl
  "function insideEndImpl(row, column, self) {\
  \  return function() {\
  \    return self.insideEnd(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Range (Eff (ace :: ACE | eff) Boolean)

insideEnd :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Boolean
insideEnd row column self = runFn3 insideEndImpl row column self

foreign import compareImpl
  "function compareImpl(row, column, self) {\
  \  return function() {\
  \    return self.compare(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Range (Eff (ace :: ACE | eff) Number)

compare :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Number
compare row column self = runFn3 compareImpl row column self

foreign import compareStartImpl
  "function compareStartImpl(row, column, self) {\
  \  return function() {\
  \    return self.compareStart(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Range (Eff (ace :: ACE | eff) Number)

compareStart :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Number
compareStart row column self = runFn3 compareStartImpl row column self

foreign import compareEndImpl
  "function compareEndImpl(row, column, self) {\
  \  return function() {\
  \    return self.compareEnd(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Range (Eff (ace :: ACE | eff) Number)

compareEnd :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Number
compareEnd row column self = runFn3 compareEndImpl row column self

foreign import compareInsideImpl
  "function compareInsideImpl(row, column, self) {\
  \  return function() {\
  \    return self.compareInside(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Range (Eff (ace :: ACE | eff) Number)

compareInside :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Number
compareInside row column self = runFn3 compareInsideImpl row column self

foreign import clipRowsImpl
  "function clipRowsImpl(firstRow, lastRow, self) {\
  \  return function() {\
  \    return self.clipRows(firstRow, lastRow);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Range (Eff (ace :: ACE | eff) Range)

clipRows :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Range
clipRows firstRow lastRow self = runFn3 clipRowsImpl firstRow lastRow self

foreign import extendImpl
  "function extendImpl(row, column, self) {\
  \  return function() {\
  \    return self.extend(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Range (Eff (ace :: ACE | eff) Range)

extend :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Range
extend row column self = runFn3 extendImpl row column self

foreign import isMultiLineImpl
  "function isMultiLineImpl(self) {\
  \  return function() {\
  \    return self.isMultiLine();\
  \  };\
  \}" :: forall eff. Fn1 Range (Eff (ace :: ACE | eff) Boolean)

isMultiLine :: forall eff. Range -> Eff (ace :: ACE | eff) Boolean
isMultiLine self = runFn1 isMultiLineImpl self

foreign import cloneImpl
  "function cloneImpl(self) {\
  \  return function() {\
  \    return self.clone();\
  \  };\
  \}" :: forall eff. Fn1 Range (Eff (ace :: ACE | eff) Range)

clone :: forall eff. Range -> Eff (ace :: ACE | eff) Range
clone self = runFn1 cloneImpl self

foreign import collapseRowsImpl
  "function collapseRowsImpl(self) {\
  \  return function() {\
  \    return self.collapseRows();\
  \  };\
  \}" :: forall eff. Fn1 Range (Eff (ace :: ACE | eff) Range)

collapseRows :: forall eff. Range -> Eff (ace :: ACE | eff) Range
collapseRows self = runFn1 collapseRowsImpl self

foreign import toScreenRangeImpl
  "function toScreenRangeImpl(session, self) {\
  \  return function() {\
  \    return self.toScreenRange(session);\
  \  };\
  \}" :: forall eff. Fn2 EditSession Range (Eff (ace :: ACE | eff) Range)

toScreenRange :: forall eff. EditSession -> Range -> Eff (ace :: ACE | eff) Range
toScreenRange session self = runFn2 toScreenRangeImpl session self

foreign import fromPointsImpl
  "function fromPointsImpl(start, end) {\
  \  return function() {\
  \    var Range = ace.require('ace/range').Range;\
  \    return Range.fromPoints(start, end);\
  \  };\
  \}" :: forall eff. Fn2 Range Range (Eff (ace :: ACE | eff) Range)

fromPoints :: forall eff. Range -> Range -> Eff (ace :: ACE | eff) Range
fromPoints start end = runFn2 fromPointsImpl start end

foreign import createImpl
  "function createImpl(startRow, startColumn, endRow, endColumn) {\
  \  return function() {\
  \    var Range = ace.require('ace/range').Range;\
  \    return new Range(startRow, startColumn, endRow, endColumn);\
  \  };\
  \}" :: forall eff. Fn4 Number Number Number Number (Eff (ace :: ACE | eff) Range)

create :: forall eff. Number -> Number -> Number -> Number -> Eff (ace :: ACE | eff) Range
create startRow startColumn endRow endColumn = runFn4 createImpl startRow startColumn endRow endColumn
