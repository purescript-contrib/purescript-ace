module Ace.TokenIterator
  ( create
  , getCurrentToken
  , getCurrentTokenColumn
  , getCurrentTokenRow
  , stepBackward
  , stepForward
  ) where

import Ace.Types
import Effect (Effect)
import Data.Function.Uncurried (Fn3, runFn3)

foreign import stepBackward :: TokenIterator -> Effect (Array String)

foreign import stepForward :: TokenIterator -> Effect String

foreign import getCurrentToken :: TokenIterator -> Effect TokenInfo

foreign import getCurrentTokenRow :: TokenIterator -> Effect Int

foreign import getCurrentTokenColumn :: TokenIterator -> Effect Int

foreign import createImpl :: Fn3 EditSession Int Int (Effect TokenIterator)

create :: EditSession -> Int -> Int -> Effect TokenIterator
create session initialRow initialColumn = runFn3 createImpl session initialRow initialColumn
