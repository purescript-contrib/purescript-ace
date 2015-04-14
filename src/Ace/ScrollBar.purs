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
  \}" :: forall eff a. Fn2 ScrollBar (Eff (ace :: EAce | eff) a) (Eff (ace :: EAce | eff) Unit)

onScroll :: forall eff a. ScrollBar -> (Eff (ace :: EAce | eff) a) -> Eff (ace :: EAce | eff) Unit
onScroll self fn = runFn2 onScrollImpl self fn

foreign import getWidthImpl
  "function getWidthImpl(self) {\
  \  return function() {\
  \    return self.getWidth();\
  \  };\
  \}" :: forall eff. Fn1 ScrollBar (Eff (ace :: EAce | eff) Number)

getWidth :: forall eff. ScrollBar -> Eff (ace :: EAce | eff) Number
getWidth self = runFn1 getWidthImpl self

foreign import setHeightImpl
  "function setHeightImpl(height, self) {\
  \  return function() {\
  \    return self.setHeight(height);\
  \  };\
  \}" :: forall eff. Fn2 Number ScrollBar (Eff (ace :: EAce | eff) Unit)

setHeight :: forall eff. Number -> ScrollBar -> Eff (ace :: EAce | eff) Unit
setHeight height self = runFn2 setHeightImpl height self

foreign import setInnerHeightImpl
  "function setInnerHeightImpl(height, self) {\
  \  return function() {\
  \    return self.setInnerHeight(height);\
  \  };\
  \}" :: forall eff. Fn2 Number ScrollBar (Eff (ace :: EAce | eff) Unit)

setInnerHeight :: forall eff. Number -> ScrollBar -> Eff (ace :: EAce | eff) Unit
setInnerHeight height self = runFn2 setInnerHeightImpl height self

foreign import setScrollTopImpl
  "function setScrollTopImpl(scrollTop, self) {\
  \  return function() {\
  \    return self.setScrollTop(scrollTop);\
  \  };\
  \}" :: forall eff. Fn2 Number ScrollBar (Eff (ace :: EAce | eff) Unit)

setScrollTop :: forall eff. Number -> ScrollBar -> Eff (ace :: EAce | eff) Unit
setScrollTop scrollTop self = runFn2 setScrollTopImpl scrollTop self

foreign import createImpl
  "function createImpl(parent, vr) {\
  \  return function() {\
  \    var ScrollBar = ace.require('ace/scrollbar').ScrollBar;\
  \    return new ScrollBar(parent, vr);\
  \  };\
  \}" :: forall eff. Fn2 HTMLElement VirtualRenderer (Eff (ace :: EAce | eff) ScrollBar)

create :: forall eff. HTMLElement -> VirtualRenderer -> Eff (ace :: EAce | eff) ScrollBar
create parent vr = runFn2 createImpl parent vr
