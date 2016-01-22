module Ace.KeyBinding where

import Prelude
import Ace.Types
import Ace.Command (commandToString)
import Data.Maybe (Maybe(), isJust)
import Data.Maybe.Unsafe (fromJust)
import DOM (DOM())
import DOM.Event.Types (KeyboardEvent())
import Control.Monad.Eff (Eff())

type KeyboardHandler e =
  { editor :: Editor }
  -> Int
  -> String
  -> Int
  -> KeyboardEvent
  -> Eff e (Maybe HandlerResult)

foreign import addKeyboardHandlerImpl
  :: forall e a
   . (Command -> String)
  -> (Maybe a -> Boolean)
  -> (Maybe a -> a)
  -> KeyboardHandler (ace :: ACE|e)
  -> KeyBinding
  -> Eff (ace :: ACE|e) Unit

addKeyboardHandler
  :: forall e
   . KeyboardHandler (ace :: ACE |e)
  -> KeyBinding
  -> Eff (ace :: ACE|e) Unit
addKeyboardHandler = addKeyboardHandlerImpl commandToString isJust fromJust
