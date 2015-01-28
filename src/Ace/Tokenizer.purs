module Ace.Tokenizer 
  ( create
  , getLineTokens
  ) where

import Data.Maybe
import Data.Function

import Control.Monad.Eff

import Ace.Types
import Ace.Internal

foreign import getLineTokensImpl
  "function getLineTokensImpl(self) {\
  \  return function() {\
  \    return self.getLineTokens();\
  \  };\
  \}" :: forall eff. Fn1 Tokenizer (Eff (ace :: EAce | eff) { tokens :: [TokenInfo], state :: String })

getLineTokens :: forall eff. Tokenizer -> Eff (ace :: EAce | eff) { tokens :: [TokenInfo], state :: String }
getLineTokens self = runFn1 getLineTokensImpl self

foreign import createImpl
  "function createImpl(rules, flag) {\
  \  return function() {\
  \    var Tokenizer = ace.require('ace/tokenizer').Tokenizer;\
  \    return new Tokenizer(rules, flag);\
  \  };\
  \}" :: forall eff. Fn2 Rules String (Eff (ace :: EAce | eff) Tokenizer)

create :: forall eff. Rules -> String -> Eff (ace :: EAce | eff) Tokenizer
create rules flag = runFn2 createImpl rules flag
