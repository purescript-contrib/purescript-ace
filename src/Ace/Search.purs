module Ace.Search
  ( set
  , find
  , findAll
  , replace
  , create
  ) where

import Ace.Types
import Effect (Effect)
import Data.Function.Uncurried (Fn2, runFn2, Fn3, runFn3, Fn4, runFn4)
import Data.Maybe (Maybe(..))

foreign import setImpl :: Fn2 SearchOptions Search (Effect Search)

set :: SearchOptions -> Search -> Effect Search
set options self = runFn2 setImpl options self

foreign import findImpl :: Fn4 (forall a. a -> Maybe a) (forall a. Maybe a) EditSession Search (Effect (Maybe Range))

find :: EditSession -> Search -> Effect (Maybe Range)
find session self = runFn4 findImpl Just Nothing session self

foreign import findAllImpl :: Fn2 EditSession Search (Effect (Array Range))

findAll :: EditSession -> Search -> Effect (Array Range)
findAll session self = runFn2 findAllImpl session self

foreign import replaceImpl :: Fn3 String String Search (Effect String)

replace :: String -> String -> Search -> Effect String
replace input replacement self = runFn3 replaceImpl input replacement self

foreign import create :: Effect Search
