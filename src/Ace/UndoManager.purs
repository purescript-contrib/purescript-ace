module Ace.UndoManager
  ( create
  , hasUndo
  , hasRedo
  , undo
  , redo
  , reset
  ) where

import Prelude

import Control.Monad.Eff (Eff())

import Data.Function.Uncurried (Fn2(), runFn2)
import Data.Maybe (Maybe())
import Data.Nullable (Nullable(), toNullable)

import Ace.Types

foreign import undoImpl :: forall eff. Fn2 (Nullable Boolean) UndoManager (Eff (ace :: ACE | eff) Range)

undo :: forall eff. Maybe Boolean -> UndoManager -> Eff (ace :: ACE | eff) Range
undo dontSelect self = runFn2 undoImpl (toNullable dontSelect) self

foreign import redoImpl :: forall eff. Fn2 Boolean UndoManager (Eff (ace :: ACE | eff) Unit)

redo :: forall eff. Boolean -> UndoManager -> Eff (ace :: ACE | eff) Unit
redo dontSelect self = runFn2 redoImpl dontSelect self

foreign import reset :: forall eff. UndoManager -> Eff (ace :: ACE | eff) Unit

foreign import hasUndo :: forall eff. UndoManager -> Eff (ace :: ACE | eff) Boolean

foreign import hasRedo :: forall eff. UndoManager -> Eff (ace :: ACE | eff) Boolean

foreign import create :: forall eff. Eff (ace :: ACE | eff) UndoManager
