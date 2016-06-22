module Ace.Ext.LanguageTools.Completer
  ( CompleterCallback
  , mkCompleter
  ) where

import Prelude
import Ace.Types (Completer, ACE, Position, EditSession, Editor, Completion)
import Control.Monad.Eff (Eff)
import Data.Function.Uncurried (runFn3, Fn3)
import Data.Maybe (Maybe, isJust, fromJust)
import Partial.Unsafe (unsafePartial)

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
mkCompleter fn = runFn3 mkCompleterImpl fn isJust (unsafePartial fromJust)
