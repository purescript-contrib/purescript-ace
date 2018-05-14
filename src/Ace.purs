module Ace
  ( ace
  , edit
  , editNode
  , createEditSession
  , createEditSessionForDocument
  , module Ace.Types
  ) where

import Ace.Types
import Effect (Effect)
import Data.Function.Uncurried (Fn2, runFn2, Fn3, runFn3)
import Web.HTML.HTMLElement (HTMLElement)

foreign import ace :: Ace

foreign import editImpl :: Fn2 String Ace (Effect Editor)

edit :: String -> Ace -> Effect Editor
edit el self = runFn2 editImpl el self

foreign import editNodeImpl :: Fn2 HTMLElement Ace (Effect Editor)

editNode :: HTMLElement -> Ace -> Effect Editor
editNode el self = runFn2 editNodeImpl el self

foreign import createEditSessionForDocumentImpl :: Fn3 Document TextMode Ace (Effect EditSession)

createEditSessionForDocument :: Document -> TextMode -> Ace -> Effect EditSession
createEditSessionForDocument text mode self = runFn3 createEditSessionForDocumentImpl text mode self

foreign import createEditSessionImpl :: Fn3 String TextMode Ace (Effect EditSession)

createEditSession :: String -> TextMode -> Ace -> Effect EditSession
createEditSession text mode self = runFn3 createEditSessionImpl text mode self
