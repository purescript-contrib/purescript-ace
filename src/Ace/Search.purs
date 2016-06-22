module Ace.Search
  ( set
  , find
  , findAll
  , replace
  , create
  ) where

import Prelude

import Control.Monad.Eff (Eff())

import Data.Function.Uncurried (Fn2(), runFn2, Fn3(), runFn3)

import Ace.Types

foreign import setImpl :: forall eff. Fn2 SearchOptions Search (Eff (ace :: ACE | eff) Search)

set :: forall eff. SearchOptions -> Search -> Eff (ace :: ACE | eff) Search
set options self = runFn2 setImpl options self

foreign import findImpl :: forall eff. Fn2 EditSession Search (Eff (ace :: ACE | eff) Range)

find :: forall eff. EditSession -> Search -> Eff (ace :: ACE | eff) Range
find session self = runFn2 findImpl session self

foreign import findAllImpl :: forall eff. Fn2 EditSession Search (Eff (ace :: ACE | eff) (Array Range))

findAll :: forall eff. EditSession -> Search -> Eff (ace :: ACE | eff) (Array Range)
findAll session self = runFn2 findAllImpl session self

foreign import replaceImpl :: forall eff. Fn3 String String Search (Eff (ace :: ACE | eff) String)

replace :: forall eff. String -> String -> Search -> Eff (ace :: ACE | eff) String
replace input replacement self = runFn3 replaceImpl input replacement self

foreign import create :: forall eff. Eff (ace :: ACE | eff) Search
