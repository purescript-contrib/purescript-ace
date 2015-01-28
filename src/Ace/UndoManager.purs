module Ace.UndoManager 
  ( create
  , hasUndo
  , hasRedo
  , undo
  , redo
  , reset
  ) where

import Data.Maybe
import Data.Function

import Control.Monad.Eff

import Ace.Types
import Ace.Internal

foreign import undoImpl
  "function undoImpl(dontSelect, self) {\
  \  return function() {\
  \    return self.undo(dontSelect);\
  \  };\
  \}" :: forall eff. Fn2 (Nullable Boolean) UndoManager (Eff (ace :: EAce | eff) Range)

undo :: forall eff. Maybe Boolean -> UndoManager -> Eff (ace :: EAce | eff) Range
undo dontSelect self = runFn2 undoImpl (toNullable dontSelect) self

foreign import redoImpl
  "function redoImpl(dontSelect, self) {\
  \  return function() {\
  \    return self.redo(dontSelect);\
  \  };\
  \}" :: forall eff. Fn2 Boolean UndoManager (Eff (ace :: EAce | eff) Unit)

redo :: forall eff. Boolean -> UndoManager -> Eff (ace :: EAce | eff) Unit
redo dontSelect self = runFn2 redoImpl dontSelect self

foreign import resetImpl
  "function resetImpl(self) {\
  \  return function() {\
  \    return self.reset();\
  \  };\
  \}" :: forall eff. Fn1 UndoManager (Eff (ace :: EAce | eff) Unit)

reset :: forall eff. UndoManager -> Eff (ace :: EAce | eff) Unit
reset self = runFn1 resetImpl self

foreign import hasUndoImpl
  "function hasUndoImpl(self) {\
  \  return function() {\
  \    return self.hasUndo();\
  \  };\
  \}" :: forall eff. Fn1 UndoManager (Eff (ace :: EAce | eff) Boolean)

hasUndo :: forall eff. UndoManager -> Eff (ace :: EAce | eff) Boolean
hasUndo self = runFn1 hasUndoImpl self

foreign import hasRedoImpl
  "function hasRedoImpl(self) {\
  \  return function() {\
  \    return self.hasRedo();\
  \  };\
  \}" :: forall eff. Fn1 UndoManager (Eff (ace :: EAce | eff) Boolean)

hasRedo :: forall eff. UndoManager -> Eff (ace :: EAce | eff) Boolean
hasRedo self = runFn1 hasRedoImpl self

foreign import createImpl
  "function createImpl() {\
  \  return function() {\
  \    var UndoManager = ace.require('ace/undomanager').UndoManager;\
  \    return new UndoManager();\
  \  };\
  \}" :: forall eff. Fn0 (Eff (ace :: EAce | eff) UndoManager)

create :: forall eff. Eff (ace :: EAce | eff) UndoManager
create = runFn0 createImpl 
