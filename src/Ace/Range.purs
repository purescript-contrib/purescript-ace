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
  , getEndColumn
  , getStartColumn
  , getStartRow
  , getStart
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

import Ace.Types (Range, ACE, EditSession, Position)
import Control.Monad.Eff (Eff)
import Data.Function.Uncurried (Fn2, runFn2, Fn3, runFn3, Fn4, runFn4)

foreign import getStartRow :: forall eff. Range -> Eff (ace :: ACE | eff) Int

foreign import getStartColumn :: forall eff. Range -> Eff (ace :: ACE | eff) Int

foreign import getEndRow :: forall eff. Range -> Eff (ace :: ACE | eff) Int

foreign import getEndColumn :: forall eff. Range -> Eff (ace :: ACE | eff) Int

foreign import getStart :: forall eff. Range -> Eff (ace :: ACE | eff) Position

foreign import getEnd :: forall eff. Range -> Eff (ace :: ACE | eff) Position

foreign import isEmpty :: forall eff. Range -> Eff (ace :: ACE | eff) Boolean

foreign import isEqualImpl :: forall eff. Fn2 Range Range (Eff (ace :: ACE | eff) Unit)

isEqual :: forall eff. Range -> Range -> Eff (ace :: ACE | eff) Unit
isEqual range self = runFn2 isEqualImpl range self

foreign import toString :: forall eff. Range -> Eff (ace :: ACE | eff) Unit

foreign import containsImpl :: forall eff. Fn3 Int Int Range (Eff (ace :: ACE | eff) Boolean)

contains :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Boolean
contains row column self = runFn3 containsImpl row column self

foreign import compareRangeImpl :: forall eff. Fn2 Range Range (Eff (ace :: ACE | eff) Int)

compareRange :: forall eff. Range -> Range -> Eff (ace :: ACE | eff) Int
compareRange range self = runFn2 compareRangeImpl range self

foreign import comparePointImpl :: forall eff. Fn2 Range Range (Eff (ace :: ACE | eff) Int)

comparePoint :: forall eff. Range -> Range -> Eff (ace :: ACE | eff) Int
comparePoint p self = runFn2 comparePointImpl p self

foreign import containsRangeImpl :: forall eff. Fn2 Range Range (Eff (ace :: ACE | eff) Boolean)

containsRange :: forall eff. Range -> Range -> Eff (ace :: ACE | eff) Boolean
containsRange range self = runFn2 containsRangeImpl range self

foreign import intersectsImpl :: forall eff. Fn2 Range Range (Eff (ace :: ACE | eff) Boolean)

intersects :: forall eff. Range -> Range -> Eff (ace :: ACE | eff) Boolean
intersects range self = runFn2 intersectsImpl range self

foreign import isEndImpl :: forall eff. Fn3 Int Int Range (Eff (ace :: ACE | eff) Boolean)

isEnd :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Boolean
isEnd row column self = runFn3 isEndImpl row column self

foreign import isStartImpl :: forall eff. Fn3 Int Int Range (Eff (ace :: ACE | eff) Boolean)

isStart :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Boolean
isStart row column self = runFn3 isStartImpl row column self

foreign import setStartImpl :: forall eff. Fn3 Int Int Range (Eff (ace :: ACE | eff) Unit)

setStart :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Unit
setStart row column self = runFn3 setStartImpl row column self

foreign import setEndImpl :: forall eff. Fn3 Int Int Range (Eff (ace :: ACE | eff) Unit)

setEnd :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Unit
setEnd row column self = runFn3 setEndImpl row column self

foreign import insideImpl :: forall eff. Fn3 Int Int Range (Eff (ace :: ACE | eff) Boolean)

inside :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Boolean
inside row column self = runFn3 insideImpl row column self

foreign import insideStartImpl :: forall eff. Fn3 Int Int Range (Eff (ace :: ACE | eff) Boolean)

insideStart :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Boolean
insideStart row column self = runFn3 insideStartImpl row column self

foreign import insideEndImpl :: forall eff. Fn3 Int Int Range (Eff (ace :: ACE | eff) Boolean)

insideEnd :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Boolean
insideEnd row column self = runFn3 insideEndImpl row column self

foreign import compareImpl :: forall eff. Fn3 Int Int Range (Eff (ace :: ACE | eff) Int)

compare :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Int
compare row column self = runFn3 compareImpl row column self

foreign import compareStartImpl :: forall eff. Fn3 Int Int Range (Eff (ace :: ACE | eff) Int)

compareStart :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Int
compareStart row column self = runFn3 compareStartImpl row column self

foreign import compareEndImpl :: forall eff. Fn3 Int Int Range (Eff (ace :: ACE | eff) Int)

compareEnd :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Int
compareEnd row column self = runFn3 compareEndImpl row column self

foreign import compareInsideImpl :: forall eff. Fn3 Int Int Range (Eff (ace :: ACE | eff) Int)

compareInside :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Int
compareInside row column self = runFn3 compareInsideImpl row column self

foreign import clipRowsImpl :: forall eff. Fn3 Int Int Range (Eff (ace :: ACE | eff) Range)

clipRows :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Range
clipRows firstRow lastRow self = runFn3 clipRowsImpl firstRow lastRow self

foreign import extendImpl :: forall eff. Fn3 Int Int Range (Eff (ace :: ACE | eff) Range)

extend :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Range
extend row column self = runFn3 extendImpl row column self

foreign import isMultiLine :: forall eff. Range -> Eff (ace :: ACE | eff) Boolean

foreign import clone :: forall eff. Range -> Eff (ace :: ACE | eff) Range

foreign import collapseRows :: forall eff. Range -> Eff (ace :: ACE | eff) Range

foreign import toScreenRangeImpl :: forall eff. Fn2 EditSession Range (Eff (ace :: ACE | eff) Range)

toScreenRange :: forall eff. EditSession -> Range -> Eff (ace :: ACE | eff) Range
toScreenRange session self = runFn2 toScreenRangeImpl session self

foreign import fromPointsImpl :: forall eff. Fn2 Range Range (Eff (ace :: ACE | eff) Range)

fromPoints :: forall eff. Range -> Range -> Eff (ace :: ACE | eff) Range
fromPoints start end = runFn2 fromPointsImpl start end

foreign import createImpl :: forall eff. Fn4 Int Int Int Int (Eff (ace :: ACE | eff) Range)

create :: forall eff. Int -> Int -> Int -> Int -> Eff (ace :: ACE | eff) Range
create startRow startColumn endRow endColumn = runFn4 createImpl startRow startColumn endRow endColumn
