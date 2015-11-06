module Ace
  ( ace
  , edit
  , editNode
  , createEditSession
  , createEditSessionForDocument
  , module Ace.Types
  ) where

import Control.Monad.Eff (Eff())

import Data.Function (Fn2(), runFn2, Fn3(), runFn3)

import DOM.HTML.Types (HTMLElement())

import Ace.Types

foreign import ace :: Ace

foreign import editImpl :: forall eff. Fn2 String Ace (Eff (ace :: ACE | eff) Editor)

edit :: forall eff. String -> Ace -> Eff (ace :: ACE | eff) Editor
edit el self = runFn2 editImpl el self

foreign import editNodeImpl :: forall eff. Fn2 HTMLElement Ace (Eff (ace :: ACE | eff) Editor)

editNode :: forall eff. HTMLElement -> Ace -> Eff (ace :: ACE | eff) Editor
editNode el self = runFn2 editNodeImpl el self

foreign import createEditSessionForDocumentImpl :: forall eff. Fn3 Document TextMode Ace (Eff (ace :: ACE | eff) EditSession)

createEditSessionForDocument :: forall eff. Document -> TextMode -> Ace -> Eff (ace :: ACE | eff) EditSession
createEditSessionForDocument text mode self = runFn3 createEditSessionForDocumentImpl text mode self

foreign import createEditSessionImpl :: forall eff. Fn3 String TextMode Ace (Eff (ace :: ACE | eff) EditSession)

createEditSession :: forall eff. String -> TextMode -> Ace -> Eff (ace :: ACE | eff) EditSession
createEditSession text mode self = runFn3 createEditSessionImpl text mode self
