module Ace.Config
  ( ConfigOption()
  , set
  , packaged
  , workerPath
  , modePath
  , themePath
  , basePath
  , suffix
  ) where

import Ace.Types
import Control.Monad.Eff
import Data.Function
import Data.Maybe

newtype ConfigOption a = ConfigOption String

foreign import setImpl
  """
  function setImpl(key, value) {
    return function() {
      ace.config.set(key, value)
      return ace;
    };
  }
  """ :: forall a eff. Fn2 (ConfigOption a) a (Eff (ace :: ACE | eff) Ace)

set :: forall a eff. ConfigOption a -> a -> Eff (ace :: ACE | eff) Ace
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
