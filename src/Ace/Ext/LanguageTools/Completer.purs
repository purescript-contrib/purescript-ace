module Ace.Ext.LanguageTools.Completer
  ( CompleterCallback()
  , mkCompleter
  ) where

import Prelude

import Control.Monad.Eff (Eff())
import Data.Function (runFn3, Fn3())
import Data.Maybe (Maybe(), isJust)
import Data.Maybe.Unsafe (fromJust)

import Ace.Types

type CompleterCallback eff = Maybe (Array Completion) -> Eff eff Unit

foreign import mkCompleterImpl
  :: forall eff a
   . Fn3 (Editor -> EditSession -> Position -> String
          -> CompleterCallback (ace :: ACE | eff) -> Eff (ace :: ACE | eff) Unit)
         (Maybe a -> Boolean)
         (Maybe a -> a)
         (Eff (ace :: ACE | eff) Completer)


mkCompleter
  :: forall eff
   . (Editor -> EditSession -> Position -> String
      -> CompleterCallback (ace :: ACE |eff) -> Eff (ace :: ACE | eff) Unit)
  -> Eff (ace :: ACE | eff) Completer
mkCompleter fn = runFn3 mkCompleterImpl fn isJust fromJust
