module Ace.Tokenizer
  ( create
  , getLineTokens
  ) where

import Ace.Types
import Control.Monad.Eff (Eff)
import Data.Function.Uncurried (Fn2, runFn2)

foreign import getLineTokens :: forall eff. Tokenizer -> Eff (ace :: ACE | eff) { tokens :: Array TokenInfo, state :: String }

foreign import createImpl :: forall eff. Fn2 Rules String (Eff (ace :: ACE | eff) Tokenizer)

create :: forall eff. Rules -> String -> Eff (ace :: ACE | eff) Tokenizer
create rules flag = runFn2 createImpl rules flag
