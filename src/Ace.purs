module Ace
  ( ace
  , edit
  , editNode
  , createEditSession
  , createEditSessionForDocument
  ) where

import Data.Function

import Control.Monad.Eff

import Ace.Types
import Data.DOM.Simple.Types

foreign import ace :: Ace

foreign import editImpl
  "function editImpl(el, self) {\
  \  return function() {\
  \    return self.edit(el);\
  \  };\
  \}" :: forall eff. Fn2 String Ace (Eff (ace :: ACE | eff) Editor)

edit :: forall eff. String -> Ace -> Eff (ace :: ACE | eff) Editor
edit el self = runFn2 editImpl el self

foreign import editNodeImpl
  "function editNodeImpl(el, self) {\
  \  return function() {\
  \    return self.edit(el);\
  \  };\
  \}" :: forall eff. Fn2 HTMLElement Ace (Eff (ace :: ACE | eff) Editor)

editNode :: forall eff. HTMLElement -> Ace -> Eff (ace :: ACE | eff) Editor
editNode el self = runFn2 editNodeImpl el self

foreign import createEditSessionForDocumentImpl
  "function createEditSessionForDocumentImpl(text, mode, self) {\
  \  return function() {\
  \    return self.createEditSession(text, mode);\
  \  };\
  \}" :: forall eff. Fn3 Document TextMode Ace (Eff (ace :: ACE | eff) EditSession)

createEditSessionForDocument :: forall eff. Document -> TextMode -> Ace -> Eff (ace :: ACE | eff) EditSession
createEditSessionForDocument text mode self = runFn3 createEditSessionForDocumentImpl text mode self

foreign import createEditSessionImpl
  "function createEditSessionImpl(text, mode, self) {\
  \  return function() {\
  \    return self.createEditSession(text, mode);\
  \  };\
  \}" :: forall eff. Fn3 String TextMode Ace (Eff (ace :: ACE | eff) EditSession)

createEditSession :: forall eff. String -> TextMode -> Ace -> Eff (ace :: ACE | eff) EditSession
createEditSession text mode self = runFn3 createEditSessionImpl text mode self

