module Ace.TokenIterator
  ( create
  , getCurrentToken
  , getCurrentTokenColumn
  , getCurrentTokenRow
  , stepBackward
  , stepForward
  ) where

import Prelude

import Control.Monad.Eff (Eff())

import Data.Function (Fn3(), runFn3)

import Ace.Types

foreign import stepBackward :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) (Array String)

foreign import stepForward :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) String

foreign import getCurrentToken :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) TokenInfo

foreign import getCurrentTokenRow :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) Int

foreign import getCurrentTokenColumn :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) Int

foreign import createImpl :: forall eff. Fn3 EditSession Int Int (Eff (ace :: ACE | eff) TokenIterator)

create :: forall eff. EditSession -> Int -> Int -> Eff (ace :: ACE | eff) TokenIterator
create session initialRow initialColumn = runFn3 createImpl session initialRow initialColumn
