module Ace.Tokenizer
  ( create
  , getLineTokens
  ) where

import Ace.Types
import Effect (Effect)
import Data.Function.Uncurried (Fn2, runFn2)

foreign import getLineTokens :: Tokenizer -> Effect { tokens :: Array TokenInfo, state :: String }

foreign import createImpl :: Fn2 Rules String (Effect Tokenizer)

create :: Rules -> String -> Effect Tokenizer
create rules flag = runFn2 createImpl rules flag
