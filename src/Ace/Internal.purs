module Ace.Internal 
  ( Nullable()
  , toNullable
  ) where
    
import Data.Maybe    
    
foreign import data Nullable :: * -> *

foreign import null
  "var $$null = null" :: forall a. Nullable a
  
foreign import notNull 
  "function notNull(x) {\
  \  return x;\
  \}" :: forall a. a -> Nullable a
  
toNullable :: forall a. Maybe a -> Nullable a
toNullable = maybe null notNull