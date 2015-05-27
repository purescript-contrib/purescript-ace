module Ace.TokenIterator
  ( create
  , getCurrentToken
  , getCurrentTokenColumn
  , getCurrentTokenRow
  , stepBackward
  , stepForward
  ) where

import Prelude hiding (compare)

import Data.Maybe
import Data.Function hiding (on)

import Control.Monad.Eff

import Ace.Types

foreign import stepBackwardImpl
  "function stepBackwardImpl(self) {\
  \  return function() {\
  \    return self.stepBackward();\
  \  };\
  \}" :: forall eff. Fn1 TokenIterator (Eff (ace :: ACE | eff) [String])

stepBackward :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) [String]
stepBackward self = runFn1 stepBackwardImpl self

foreign import stepForwardImpl
  "function stepForwardImpl(self) {\
  \  return function() {\
  \    return self.stepForward();\
  \  };\
  \}" :: forall eff. Fn1 TokenIterator (Eff (ace :: ACE | eff) String)

stepForward :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) String
stepForward self = runFn1 stepForwardImpl self

foreign import getCurrentTokenImpl
  "function getCurrentTokenImpl(self) {\
  \  return function() {\
  \    return self.getCurrentToken();\
  \  };\
  \}" :: forall eff. Fn1 TokenIterator (Eff (ace :: ACE | eff) TokenInfo)

getCurrentToken :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) TokenInfo
getCurrentToken self = runFn1 getCurrentTokenImpl self

foreign import getCurrentTokenRowImpl
  "function getCurrentTokenRowImpl(self) {\
  \  return function() {\
  \    return self.getCurrentTokenRow();\
  \  };\
  \}" :: forall eff. Fn1 TokenIterator (Eff (ace :: ACE | eff) Number)

getCurrentTokenRow :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) Number
getCurrentTokenRow self = runFn1 getCurrentTokenRowImpl self

foreign import getCurrentTokenColumnImpl
  "function getCurrentTokenColumnImpl(self) {\
  \  return function() {\
  \    return self.getCurrentTokenColumn();\
  \  };\
  \}" :: forall eff. Fn1 TokenIterator (Eff (ace :: ACE | eff) Number)

getCurrentTokenColumn :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) Number
getCurrentTokenColumn self = runFn1 getCurrentTokenColumnImpl self

foreign import createImpl
  "function createImpl(session, initialRow, initialColumn) {\
  \  return function() {\
  \    var TokenIterator = ace.require('ace/token_iterator').TokenIterator;\
  \    return new TokenIterator(session, initialRow, initialColumn);\
  \  };\
  \}" :: forall eff. Fn3 EditSession Number Number (Eff (ace :: ACE | eff) TokenIterator)

create :: forall eff. EditSession -> Number -> Number -> Eff (ace :: ACE | eff) TokenIterator
create session initialRow initialColumn = runFn3 createImpl session initialRow initialColumn
