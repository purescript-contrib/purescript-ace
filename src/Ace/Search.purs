module Ace.Search
  ( set
  , find
  , findAll
  , replace
  , create
  ) where

import Prelude hiding (compare)

import Data.Maybe
import Data.Function hiding (on)

import Control.Monad.Eff

import Ace.Types
import Ace.Internal

foreign import setImpl
  "function setImpl(options, self) {\
  \  return function() {\
  \    return self.set(options);\
  \  };\
  \}" :: forall eff. Fn2 SearchOptions Search (Eff (ace :: EAce | eff) Search)

set :: forall eff. SearchOptions -> Search -> Eff (ace :: EAce | eff) Search
set options self = runFn2 setImpl options self

foreign import findImpl
  "function findImpl(session, self) {\
  \  return function() {\
  \    return self.find(session);\
  \  };\
  \}" :: forall eff. Fn2 EditSession Search (Eff (ace :: EAce | eff) Range)

find :: forall eff. EditSession -> Search -> Eff (ace :: EAce | eff) Range
find session self = runFn2 findImpl session self

foreign import findAllImpl
  "function findAllImpl(session, self) {\
  \  return function() {\
  \    return self.findAll(session);\
  \  };\
  \}" :: forall eff. Fn2 EditSession Search (Eff (ace :: EAce | eff) [Range])

findAll :: forall eff. EditSession -> Search -> Eff (ace :: EAce | eff) [Range]
findAll session self = runFn2 findAllImpl session self

foreign import replaceImpl
  "function replaceImpl(input, replacement, self) {\
  \  return function() {\
  \    return self.replace(input, replacement);\
  \  };\
  \}" :: forall eff. Fn3 String String Search (Eff (ace :: EAce | eff) String)

replace :: forall eff. String -> String -> Search -> Eff (ace :: EAce | eff) String
replace input replacement self = runFn3 replaceImpl input replacement self

foreign import createImpl
  "function createImpl() {\
  \  return function() {\
  \    var Search = ace.require('ace/search').Search;\
  \    return new Search();\
  \  };\
  \}" :: forall eff. Fn0 (Eff (ace :: EAce | eff) Search)

create :: forall eff. Eff (ace :: EAce | eff) Search
create = runFn0 createImpl 
