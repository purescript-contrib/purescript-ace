module Ace.Anchor
  ( onChange
  , getPosition
  , getDocument
  , setPosition
  , detach
  , create
  , getInsertRight
  , setInsertRight
  ) where

import Prelude

import Ace.Types (Anchor, Document, Position, AnchorEvent)
import Effect (Effect)
import Data.Function.Uncurried (Fn2, runFn2, Fn3, runFn3, Fn4, runFn4)

foreign import onChangeImpl
  :: forall a
   . Fn2 Anchor
       (AnchorEvent -> Effect a)
       (Effect Unit)

onChange
  :: forall a
   . Anchor
  -> (AnchorEvent -> Effect a)
  -> Effect Unit
onChange self fn = runFn2 onChangeImpl self fn

foreign import getPosition :: Anchor -> Effect Position

foreign import getDocument :: Anchor -> Effect Document

foreign import setPositionImpl :: Fn4 Int Int Boolean Anchor (Effect Unit)

setPosition :: Int -> Int -> Boolean -> Anchor -> Effect Unit
setPosition row column noClip self = runFn4 setPositionImpl row column noClip self

foreign import detach :: Anchor -> Effect Unit

foreign import createImpl :: Fn3 Document Int Int (Effect Anchor)

create :: Document -> Int -> Int -> Effect Anchor
create doc row column = runFn3 createImpl doc row column

foreign import getInsertRight :: Anchor -> Effect Boolean
foreign import setInsertRight :: Boolean -> Anchor -> Effect Unit
