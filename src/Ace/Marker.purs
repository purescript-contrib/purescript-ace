module Ace.Marker
  ( getId
  , getClazz
  , getInFront
  , getType
  , getRange
  ) where

import Ace.Types
import Data.Maybe (Maybe(..))
import Effect (Effect)

foreign import getId :: Marker -> Effect Int
foreign import getClazz :: Marker -> Effect String
foreign import getInFront :: Marker -> Effect Boolean
foreign import getType :: Marker -> Effect String
foreign import getRangeImpl
  :: forall a
   . Maybe a
  -> (a -> Maybe a)
  -> Marker
  -> Effect (Maybe Range)

getRange :: Marker -> Effect (Maybe Range)
getRange = getRangeImpl Nothing Just
