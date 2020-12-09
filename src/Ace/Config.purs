module Ace.Config
  ( ConfigOption
  , set
  , packaged
  , workerPath
  , modePath
  , themePath
  , basePath
  , suffix
  ) where

import Ace.Types
import Effect (Effect)
import Data.Function.Uncurried (Fn2, runFn2)

newtype ConfigOption :: Type -> Type
newtype ConfigOption a = ConfigOption String

type role ConfigOption representational

foreign import setImpl :: forall a. Fn2 (ConfigOption a) a (Effect Ace)

set :: forall a. ConfigOption a -> a -> Effect Ace
set key value = runFn2 setImpl key value

packaged :: ConfigOption Boolean
packaged = ConfigOption "packaged"

workerPath :: ConfigOption String
workerPath = ConfigOption "workerPath"

modePath :: ConfigOption String
modePath = ConfigOption "modePath"

themePath :: ConfigOption String
themePath = ConfigOption "themePath"

basePath :: ConfigOption String
basePath = ConfigOption "basePath"

suffix :: ConfigOption String
suffix = ConfigOption "suffix"
