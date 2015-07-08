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

foreign import stepBackwardImpl :: forall eff. Fn1 TokenIterator (Eff (ace :: ACE | eff) (Array String))

stepBackward :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) (Array String)
stepBackward self = runFn1 stepBackwardImpl self

foreign import stepForwardImpl :: forall eff. Fn1 TokenIterator (Eff (ace :: ACE | eff) String)

stepForward :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) String
stepForward self = runFn1 stepForwardImpl self

foreign import getCurrentTokenImpl :: forall eff. Fn1 TokenIterator (Eff (ace :: ACE | eff) TokenInfo)

getCurrentToken :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) TokenInfo
getCurrentToken self = runFn1 getCurrentTokenImpl self

foreign import getCurrentTokenRowImpl :: forall eff. Fn1 TokenIterator (Eff (ace :: ACE | eff) Int)

getCurrentTokenRow :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) Int
getCurrentTokenRow self = runFn1 getCurrentTokenRowImpl self

foreign import getCurrentTokenColumnImpl :: forall eff. Fn1 TokenIterator (Eff (ace :: ACE | eff) Int)

getCurrentTokenColumn :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) Int
getCurrentTokenColumn self = runFn1 getCurrentTokenColumnImpl self

foreign import createImpl :: forall eff. Fn3 EditSession Int Int (Eff (ace :: ACE | eff) TokenIterator)

create :: forall eff. EditSession -> Int -> Int -> Eff (ace :: ACE | eff) TokenIterator
create session initialRow initialColumn = runFn3 createImpl session initialRow initialColumn
