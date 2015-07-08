module Ace.UndoManager
  ( create
  , hasUndo
  , hasRedo
  , undo
  , redo
  , reset
  ) where

import Prelude

import Data.Maybe
import Data.Function

import Control.Monad.Eff

import Ace.Types
import Data.Nullable

foreign import undoImpl :: forall eff. Fn2 (Nullable Boolean) UndoManager (Eff (ace :: ACE | eff) Range)

undo :: forall eff. Maybe Boolean -> UndoManager -> Eff (ace :: ACE | eff) Range
undo dontSelect self = runFn2 undoImpl (toNullable dontSelect) self

foreign import redoImpl :: forall eff. Fn2 Boolean UndoManager (Eff (ace :: ACE | eff) Unit)

redo :: forall eff. Boolean -> UndoManager -> Eff (ace :: ACE | eff) Unit
redo dontSelect self = runFn2 redoImpl dontSelect self

foreign import resetImpl :: forall eff. Fn1 UndoManager (Eff (ace :: ACE | eff) Unit)

reset :: forall eff. UndoManager -> Eff (ace :: ACE | eff) Unit
reset self = runFn1 resetImpl self

foreign import hasUndoImpl :: forall eff. Fn1 UndoManager (Eff (ace :: ACE | eff) Boolean)

hasUndo :: forall eff. UndoManager -> Eff (ace :: ACE | eff) Boolean
hasUndo self = runFn1 hasUndoImpl self

foreign import hasRedoImpl :: forall eff. Fn1 UndoManager (Eff (ace :: ACE | eff) Boolean)

hasRedo :: forall eff. UndoManager -> Eff (ace :: ACE | eff) Boolean
hasRedo self = runFn1 hasRedoImpl self

foreign import createImpl :: forall eff. Fn0 (Eff (ace :: ACE | eff) UndoManager)

create :: forall eff. Eff (ace :: ACE | eff) UndoManager
create = runFn0 createImpl
