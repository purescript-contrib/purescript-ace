module Ace.Tokenizer
  ( create
  , getLineTokens
  ) where

import Data.Maybe
import Data.Function

import Control.Monad.Eff

import Ace.Types

foreign import getLineTokensImpl :: forall eff. Fn1 Tokenizer (Eff (ace :: ACE | eff) { tokens :: Array TokenInfo, state :: String })

getLineTokens :: forall eff. Tokenizer -> Eff (ace :: ACE | eff) { tokens :: Array TokenInfo, state :: String }
getLineTokens self = runFn1 getLineTokensImpl self

foreign import createImpl :: forall eff. Fn2 Rules String (Eff (ace :: ACE | eff) Tokenizer)

create :: forall eff. Rules -> String -> Eff (ace :: ACE | eff) Tokenizer
create rules flag = runFn2 createImpl rules flag
