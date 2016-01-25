module Ace.Marker (
    getId
  , getClazz
  , getInFront
  , getType
  , getRange
  ) where

import Ace.Types
import Data.Maybe (Maybe(..))
import Control.Monad.Eff (Eff())

foreign import getId :: forall e. Marker -> Eff (ace :: ACE|e) Int
foreign import getClazz :: forall e. Marker -> Eff (ace :: ACE|e) String
foreign import getInFront :: forall e. Marker -> Eff (ace :: ACE|e) Boolean
foreign import getType :: forall e. Marker -> Eff (ace :: ACE|e) String
foreign import getRangeImpl
  :: forall e a
   . Maybe a -> (a -> Maybe a) -> Marker -> Eff (ace :: ACE|e) (Maybe Range)

getRange :: forall e. Marker -> Eff (ace :: ACE|e) (Maybe Range)
getRange = getRangeImpl Nothing Just
