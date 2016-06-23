module Ace.ScrollBar
  ( create
  , getWidth
  , onScroll
  , setHeight
  , setInnerHeight
  , setScrollTop
  ) where

import Prelude

import Ace.Types (ScrollBar, ACE, VirtualRenderer)
import Control.Monad.Eff (Eff)
import Data.Function.Uncurried (Fn2, runFn2)
import DOM.HTML.Types (HTMLElement)

foreign import onScrollImpl :: forall eff a. Fn2 ScrollBar (Eff (ace :: ACE | eff) a) (Eff (ace :: ACE | eff) Unit)

onScroll :: forall eff a. ScrollBar -> (Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onScroll self fn = runFn2 onScrollImpl self fn

foreign import getWidth :: forall eff. ScrollBar -> Eff (ace :: ACE | eff) Int

foreign import setHeightImpl :: forall eff. Fn2 Int ScrollBar (Eff (ace :: ACE | eff) Unit)

setHeight :: forall eff. Int -> ScrollBar -> Eff (ace :: ACE | eff) Unit
setHeight height self = runFn2 setHeightImpl height self

foreign import setInnerHeightImpl :: forall eff. Fn2 Int ScrollBar (Eff (ace :: ACE | eff) Unit)

setInnerHeight :: forall eff. Int -> ScrollBar -> Eff (ace :: ACE | eff) Unit
setInnerHeight height self = runFn2 setInnerHeightImpl height self

foreign import setScrollTopImpl :: forall eff. Fn2 Int ScrollBar (Eff (ace :: ACE | eff) Unit)

setScrollTop :: forall eff. Int -> ScrollBar -> Eff (ace :: ACE | eff) Unit
setScrollTop scrollTop self = runFn2 setScrollTopImpl scrollTop self

foreign import createImpl :: forall eff. Fn2 HTMLElement VirtualRenderer (Eff (ace :: ACE | eff) ScrollBar)

create :: forall eff. HTMLElement -> VirtualRenderer -> Eff (ace :: ACE | eff) ScrollBar
create parent vr = runFn2 createImpl parent vr
