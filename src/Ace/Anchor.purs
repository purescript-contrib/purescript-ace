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

import Data.Function.Uncurried (Fn2(), runFn2, Fn3(), runFn3, Fn4(), runFn4)

import Control.Monad.Eff (Eff())

import Ace.Types

foreign import onChangeImpl
  :: forall eff a
   . Fn2 Anchor
       (AnchorEvent -> Eff (ace :: ACE | eff) a)
       (Eff (ace :: ACE | eff) Unit)

onChange
  :: forall eff a
   . Anchor
  -> (AnchorEvent -> Eff (ace :: ACE | eff) a)
  -> Eff (ace :: ACE | eff) Unit
onChange self fn = runFn2 onChangeImpl self fn

foreign import getPosition :: forall eff. Anchor -> Eff (ace :: ACE | eff) Position

foreign import getDocument :: forall eff. Anchor -> Eff (ace :: ACE | eff) Document

foreign import setPositionImpl :: forall eff. Fn4 Int Int Boolean Anchor (Eff (ace :: ACE | eff) Unit)

setPosition :: forall eff. Int -> Int -> Boolean -> Anchor -> Eff (ace :: ACE | eff) Unit
setPosition row column noClip self = runFn4 setPositionImpl row column noClip self

foreign import detach :: forall eff. Anchor -> Eff (ace :: ACE | eff) Unit

foreign import createImpl :: forall eff. Fn3 Document Int Int (Eff (ace :: ACE | eff) Anchor)

create :: forall eff. Document -> Int -> Int -> Eff (ace :: ACE | eff) Anchor
create doc row column = runFn3 createImpl doc row column

foreign import getInsertRight :: forall eff. Anchor -> Eff (ace :: ACE |eff) Boolean
foreign import setInsertRight
  :: forall eff
   . Boolean -> Anchor -> Eff (ace :: ACE|eff) Unit
