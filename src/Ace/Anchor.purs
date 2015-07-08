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

foreign import onChangeImpl :: forall eff a. Fn2 Anchor (AnchorEvent -> Eff (ace :: ACE | eff) a) (Eff (ace :: ACE | eff) Unit)

onChange :: forall eff a. Anchor -> (AnchorEvent -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onChange self fn = runFn2 onChangeImpl self fn

foreign import getPositionImpl :: forall eff. Fn1 Anchor (Eff (ace :: ACE | eff) Position)

getPosition :: forall eff. Anchor -> Eff (ace :: ACE | eff) Position
getPosition self = runFn1 getPositionImpl self

foreign import getDocumentImpl :: forall eff. Fn1 Anchor (Eff (ace :: ACE | eff) Document)

getDocument :: forall eff. Anchor -> Eff (ace :: ACE | eff) Document
getDocument self = runFn1 getDocumentImpl self

foreign import setPositionImpl :: forall eff. Fn4 Int Int Boolean Anchor (Eff (ace :: ACE | eff) Unit)

setPosition :: forall eff. Int -> Int -> Boolean -> Anchor -> Eff (ace :: ACE | eff) Unit
setPosition row column noClip self = runFn4 setPositionImpl row column noClip self

foreign import detachImpl :: forall eff. Fn1 Anchor (Eff (ace :: ACE | eff) Unit)

detach :: forall eff. Anchor -> Eff (ace :: ACE | eff) Unit
detach self = runFn1 detachImpl self

foreign import createImpl :: forall eff. Fn3 Document Int Int (Eff (ace :: ACE | eff) Anchor)

create :: forall eff. Document -> Int -> Int -> Eff (ace :: ACE | eff) Anchor
create doc row column = runFn3 createImpl doc row column
