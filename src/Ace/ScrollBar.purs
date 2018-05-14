module Ace.ScrollBar
  ( create
  , getWidth
  , onScroll
  , setHeight
  , setInnerHeight
  , setScrollTop
  ) where

import Prelude

import Ace.Types (ScrollBar, VirtualRenderer)
import Effect (Effect)
import Data.Function.Uncurried (Fn2, runFn2)
import Web.HTML.HTMLElement (HTMLElement)

foreign import onScrollImpl :: forall a. Fn2 ScrollBar (Effect a) (Effect Unit)

onScroll :: forall a. ScrollBar -> (Effect a) -> Effect Unit
onScroll self fn = runFn2 onScrollImpl self fn

foreign import getWidth :: ScrollBar -> Effect Int

foreign import setHeightImpl :: Fn2 Int ScrollBar (Effect Unit)

setHeight :: Int -> ScrollBar -> Effect Unit
setHeight height self = runFn2 setHeightImpl height self

foreign import setInnerHeightImpl :: Fn2 Int ScrollBar (Effect Unit)

setInnerHeight :: Int -> ScrollBar -> Effect Unit
setInnerHeight height self = runFn2 setInnerHeightImpl height self

foreign import setScrollTopImpl :: Fn2 Int ScrollBar (Effect Unit)

setScrollTop :: Int -> ScrollBar -> Effect Unit
setScrollTop scrollTop self = runFn2 setScrollTopImpl scrollTop self

foreign import createImpl :: Fn2 HTMLElement VirtualRenderer (Effect ScrollBar)

create :: HTMLElement -> VirtualRenderer -> Effect ScrollBar
create parent vr = runFn2 createImpl parent vr
