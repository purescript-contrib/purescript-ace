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

import Ace.Types (Range, EditSession, Position)
import Effect (Effect)
import Data.Function.Uncurried (Fn2, runFn2, Fn3, runFn3, Fn4, runFn4)

foreign import getStartRow :: Range -> Effect Int

foreign import getStartColumn :: Range -> Effect Int

foreign import getEndRow :: Range -> Effect Int

foreign import getEndColumn :: Range -> Effect Int

foreign import getStart :: Range -> Effect Position

foreign import getEnd :: Range -> Effect Position

foreign import isEmpty :: Range -> Effect Boolean

foreign import isEqualImpl :: Fn2 Range Range (Effect Unit)

isEqual :: Range -> Range -> Effect Unit
isEqual range self = runFn2 isEqualImpl range self

foreign import toString :: Range -> Effect Unit

foreign import containsImpl :: Fn3 Int Int Range (Effect Boolean)

contains :: Int -> Int -> Range -> Effect Boolean
contains row column self = runFn3 containsImpl row column self

foreign import compareRangeImpl :: Fn2 Range Range (Effect Int)

compareRange :: Range -> Range -> Effect Int
compareRange range self = runFn2 compareRangeImpl range self

foreign import comparePointImpl :: Fn2 Range Range (Effect Int)

comparePoint :: Range -> Range -> Effect Int
comparePoint p self = runFn2 comparePointImpl p self

foreign import containsRangeImpl :: Fn2 Range Range (Effect Boolean)

containsRange :: Range -> Range -> Effect Boolean
containsRange range self = runFn2 containsRangeImpl range self

foreign import intersectsImpl :: Fn2 Range Range (Effect Boolean)

intersects :: Range -> Range -> Effect Boolean
intersects range self = runFn2 intersectsImpl range self

foreign import isEndImpl :: Fn3 Int Int Range (Effect Boolean)

isEnd :: Int -> Int -> Range -> Effect Boolean
isEnd row column self = runFn3 isEndImpl row column self

foreign import isStartImpl :: Fn3 Int Int Range (Effect Boolean)

isStart :: Int -> Int -> Range -> Effect Boolean
isStart row column self = runFn3 isStartImpl row column self

foreign import setStartImpl :: Fn3 Int Int Range (Effect Unit)

setStart :: Int -> Int -> Range -> Effect Unit
setStart row column self = runFn3 setStartImpl row column self

foreign import setEndImpl :: Fn3 Int Int Range (Effect Unit)

setEnd :: Int -> Int -> Range -> Effect Unit
setEnd row column self = runFn3 setEndImpl row column self

foreign import insideImpl :: Fn3 Int Int Range (Effect Boolean)

inside :: Int -> Int -> Range -> Effect Boolean
inside row column self = runFn3 insideImpl row column self

foreign import insideStartImpl :: Fn3 Int Int Range (Effect Boolean)

insideStart :: Int -> Int -> Range -> Effect Boolean
insideStart row column self = runFn3 insideStartImpl row column self

foreign import insideEndImpl :: Fn3 Int Int Range (Effect Boolean)

insideEnd :: Int -> Int -> Range -> Effect Boolean
insideEnd row column self = runFn3 insideEndImpl row column self

foreign import compareImpl :: Fn3 Int Int Range (Effect Int)

compare :: Int -> Int -> Range -> Effect Int
compare row column self = runFn3 compareImpl row column self

foreign import compareStartImpl :: Fn3 Int Int Range (Effect Int)

compareStart :: Int -> Int -> Range -> Effect Int
compareStart row column self = runFn3 compareStartImpl row column self

foreign import compareEndImpl :: Fn3 Int Int Range (Effect Int)

compareEnd :: Int -> Int -> Range -> Effect Int
compareEnd row column self = runFn3 compareEndImpl row column self

foreign import compareInsideImpl :: Fn3 Int Int Range (Effect Int)

compareInside :: Int -> Int -> Range -> Effect Int
compareInside row column self = runFn3 compareInsideImpl row column self

foreign import clipRowsImpl :: Fn3 Int Int Range (Effect Range)

clipRows :: Int -> Int -> Range -> Effect Range
clipRows firstRow lastRow self = runFn3 clipRowsImpl firstRow lastRow self

foreign import extendImpl :: Fn3 Int Int Range (Effect Range)

extend :: Int -> Int -> Range -> Effect Range
extend row column self = runFn3 extendImpl row column self

foreign import isMultiLine :: Range -> Effect Boolean

foreign import clone :: Range -> Effect Range

foreign import collapseRows :: Range -> Effect Range

foreign import toScreenRangeImpl :: Fn2 EditSession Range (Effect Range)

toScreenRange :: EditSession -> Range -> Effect Range
toScreenRange session self = runFn2 toScreenRangeImpl session self

foreign import fromPointsImpl :: Fn2 Range Range (Effect Range)

fromPoints :: Range -> Range -> Effect Range
fromPoints start end = runFn2 fromPointsImpl start end

foreign import createImpl :: Fn4 Int Int Int Int (Effect Range)

create :: Int -> Int -> Int -> Int -> Effect Range
create startRow startColumn endRow endColumn = runFn4 createImpl startRow startColumn endRow endColumn
