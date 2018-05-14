module Ace.UndoManager
  ( create
  , hasUndo
  , hasRedo
  , undo
  , redo
  , reset
  ) where

import Prelude

import Ace.Types (UndoManager, Range)
import Effect (Effect)
import Data.Function.Uncurried (Fn2, runFn2)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)

foreign import undoImpl :: Fn2 (Nullable Boolean) UndoManager (Effect Range)

undo :: Maybe Boolean -> UndoManager -> Effect Range
undo dontSelect self = runFn2 undoImpl (toNullable dontSelect) self

foreign import redoImpl :: Fn2 Boolean UndoManager (Effect Unit)

redo :: Boolean -> UndoManager -> Effect Unit
redo dontSelect self = runFn2 redoImpl dontSelect self

foreign import reset :: UndoManager -> Effect Unit

foreign import hasUndo :: UndoManager -> Effect Boolean

foreign import hasRedo :: UndoManager -> Effect Boolean

foreign import create :: Effect UndoManager
