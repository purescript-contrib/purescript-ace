module Ace.Anchor
  ( onChange
  , getPosition
  , getDocument
  , setPosition
  , detach
  , create
  ) where

import Prelude hiding (compare)

import Data.Maybe
import Data.Function

import Control.Monad.Eff

import Ace.Types

foreign import onChangeImpl
  "function onChangeImpl(self, fn) {\
  \  return function() {\
  \    return self.on('change', function(e) {\
  \      fn(e)();\
  \    });\
  \  };\
  \}" :: forall eff a. Fn2 Anchor (AnchorEvent -> Eff (ace :: ACE | eff) a) (Eff (ace :: ACE | eff) Unit)

onChange :: forall eff a. Anchor -> (AnchorEvent -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onChange self fn = runFn2 onChangeImpl self fn

foreign import getPositionImpl
  "function getPositionImpl(self) {\
  \  return function() {\
  \    return self.getPosition();\
  \  };\
  \}" :: forall eff. Fn1 Anchor (Eff (ace :: ACE | eff) Position)

getPosition :: forall eff. Anchor -> Eff (ace :: ACE | eff) Position
getPosition self = runFn1 getPositionImpl self

foreign import getDocumentImpl
  "function getDocumentImpl(self) {\
  \  return function() {\
  \    return self.getDocument();\
  \  };\
  \}" :: forall eff. Fn1 Anchor (Eff (ace :: ACE | eff) Document)

getDocument :: forall eff. Anchor -> Eff (ace :: ACE | eff) Document
getDocument self = runFn1 getDocumentImpl self

foreign import setPositionImpl
  "function setPositionImpl(row, column, noClip, self) {\
  \  return function() {\
  \    return self.setPosition(row, column, noClip);\
  \  };\
  \}" :: forall eff. Fn4 Number Number Boolean Anchor (Eff (ace :: ACE | eff) Unit)

setPosition :: forall eff. Number -> Number -> Boolean -> Anchor -> Eff (ace :: ACE | eff) Unit
setPosition row column noClip self = runFn4 setPositionImpl row column noClip self

foreign import detachImpl
  "function detachImpl(self) {\
  \  return function() {\
  \    return self.detach();\
  \  };\
  \}" :: forall eff. Fn1 Anchor (Eff (ace :: ACE | eff) Unit)

detach :: forall eff. Anchor -> Eff (ace :: ACE | eff) Unit
detach self = runFn1 detachImpl self

foreign import createImpl
  "function createImpl(doc, row, column) {\
  \  return function() {\
  \    var Anchor = ace.require('ace/anchor').Anchor;\
  \    return new Anchor(doc, row, column);\
  \  };\
  \}" :: forall eff. Fn3 Document Number Number (Eff (ace :: ACE | eff) Anchor)

create :: forall eff. Document -> Number -> Number -> Eff (ace :: ACE | eff) Anchor
create doc row column = runFn3 createImpl doc row column
