module Ace.Command where

import Ace.Types (Command(..))

commandToString :: Command -> String
commandToString Null = "null"
commandToString InsertText = "inserttext"
