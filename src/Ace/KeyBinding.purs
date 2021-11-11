module Ace.KeyBinding where

import Prelude

import Ace.Command (commandToString)
import Ace.Types (KeyBinding, Command, HandlerResult, Editor)
import Data.Maybe (Maybe, isJust, fromJust)
import Effect (Effect)
import Partial.Unsafe (unsafePartial)
import Web.UIEvent.KeyboardEvent (KeyboardEvent)

type KeyboardHandler =
  { editor :: Editor }
  -> Int
  -> String
  -> Int
  -> KeyboardEvent
  -> Effect (Maybe HandlerResult)

foreign import addKeyboardHandlerImpl
  :: forall a
   . (Command -> String)
  -> (Maybe a -> Boolean)
  -> (Maybe a -> a)
  -> KeyboardHandler
  -> KeyBinding
  -> Effect Unit

addKeyboardHandler
  :: KeyboardHandler
  -> KeyBinding
  -> Effect Unit
addKeyboardHandler = addKeyboardHandlerImpl commandToString isJust (unsafePartial fromJust)
