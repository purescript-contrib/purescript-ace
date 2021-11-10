module Ace.Ext.LanguageTools.Completer
  ( CompleterCallback
  , mkCompleter
  ) where

import Prelude
import Ace.Types (Completer, Position, EditSession, Editor, Completion)
import Effect (Effect)
import Data.Function.Uncurried (runFn3, Fn3)
import Data.Maybe (Maybe, isJust, fromJust)
import Partial.Unsafe (unsafePartial)

type CompleterCallback = Maybe (Array Completion) -> Effect Unit

foreign import mkCompleterImpl
  :: forall a
   . Fn3 (Editor -> EditSession -> Position -> String -> CompleterCallback -> Effect Unit)
       (Maybe a -> Boolean)
       (Maybe a -> a)
       (Effect Completer)

mkCompleter
  :: (Editor -> EditSession -> Position -> String -> CompleterCallback -> Effect Unit)
  -> Effect Completer
mkCompleter fn = runFn3 mkCompleterImpl fn isJust (unsafePartial fromJust)
