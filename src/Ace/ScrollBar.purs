module Ace.ScrollBar
  ( create
  , getWidth
  , onScroll
  , setHeight
  , setInnerHeight
  , setScrollTop
  )
where

import Data.Maybe
import Data.Function

import Control.Monad.Eff

import Ace.Types
import Data.DOM.Simple.Types

foreign import onScrollImpl
  "function onScrollImpl(self, fn) {\
  \  return function() {\
  \    return self.on('scroll', function() {\
  \      fn();\
  \    });\
  \  };\
  \}" :: forall eff a. Fn2 ScrollBar (Eff (ace :: ACE | eff) a) (Eff (ace :: ACE | eff) Unit)

onScroll :: forall eff a. ScrollBar -> (Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onScroll self fn = runFn2 onScrollImpl self fn

foreign import getWidthImpl
  "function getWidthImpl(self) {\
  \  return function() {\
  \    return self.getWidth();\
  \  };\
  \}" :: forall eff. Fn1 ScrollBar (Eff (ace :: ACE | eff) Number)

getWidth :: forall eff. ScrollBar -> Eff (ace :: ACE | eff) Number
getWidth self = runFn1 getWidthImpl self

foreign import setHeightImpl
  "function setHeightImpl(height, self) {\
  \  return function() {\
  \    return self.setHeight(height);\
  \  };\
  \}" :: forall eff. Fn2 Number ScrollBar (Eff (ace :: ACE | eff) Unit)

setHeight :: forall eff. Number -> ScrollBar -> Eff (ace :: ACE | eff) Unit
setHeight height self = runFn2 setHeightImpl height self

foreign import setInnerHeightImpl
  "function setInnerHeightImpl(height, self) {\
  \  return function() {\
  \    return self.setInnerHeight(height);\
  \  };\
  \}" :: forall eff. Fn2 Number ScrollBar (Eff (ace :: ACE | eff) Unit)

setInnerHeight :: forall eff. Number -> ScrollBar -> Eff (ace :: ACE | eff) Unit
setInnerHeight height self = runFn2 setInnerHeightImpl height self

foreign import setScrollTopImpl
  "function setScrollTopImpl(scrollTop, self) {\
  \  return function() {\
  \    return self.setScrollTop(scrollTop);\
  \  };\
  \}" :: forall eff. Fn2 Number ScrollBar (Eff (ace :: ACE | eff) Unit)

setScrollTop :: forall eff. Number -> ScrollBar -> Eff (ace :: ACE | eff) Unit
setScrollTop scrollTop self = runFn2 setScrollTopImpl scrollTop self

foreign import createImpl
  "function createImpl(parent, vr) {\
  \  return function() {\
  \    var ScrollBar = ace.require('ace/scrollbar').ScrollBar;\
  \    return new ScrollBar(parent, vr);\
  \  };\
  \}" :: forall eff. Fn2 HTMLElement VirtualRenderer (Eff (ace :: ACE | eff) ScrollBar)

create :: forall eff. HTMLElement -> VirtualRenderer -> Eff (ace :: ACE | eff) ScrollBar
create parent vr = runFn2 createImpl parent vr
