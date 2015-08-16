module Ace.Tokenizer
  ( create
  , getLineTokens
  ) where

import Control.Monad.Eff (Eff())

import Data.Function (Fn2(), runFn2)

import Ace.Types

foreign import getLineTokens :: forall eff. Tokenizer -> Eff (ace :: ACE | eff) { tokens :: Array TokenInfo, state :: String }

foreign import createImpl :: forall eff. Fn2 Rules String (Eff (ace :: ACE | eff) Tokenizer)

create :: forall eff. Rules -> String -> Eff (ace :: ACE | eff) Tokenizer
create rules flag = runFn2 createImpl rules flag
