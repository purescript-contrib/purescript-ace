module Ace.BackgroundTokenizer
  ( onUpdate
  , setTokenizer
  , setDocument
  , fireUpdateEvent
  , start
  , stop
  , getTokens
  , getState
  , create
  ) where

import Prelude

import Ace.Types (BackgroundTokenizer, Editor, Tokenizer, TokenInfo, Document, BackgroundTokenizerEvent)
import Effect (Effect)
import Data.Function.Uncurried (Fn2, runFn2, Fn3, runFn3)

foreign import onUpdateImpl :: forall a. Fn2 BackgroundTokenizer (BackgroundTokenizerEvent -> Effect a) (Effect Unit)

onUpdate :: forall a. BackgroundTokenizer -> (BackgroundTokenizerEvent -> Effect a) -> Effect Unit
onUpdate self fn = runFn2 onUpdateImpl self fn

foreign import setTokenizerImpl :: Fn2 Tokenizer BackgroundTokenizer (Effect Unit)

setTokenizer :: Tokenizer -> BackgroundTokenizer -> Effect Unit
setTokenizer tokenizer self = runFn2 setTokenizerImpl tokenizer self

foreign import setDocumentImpl :: Fn2 Document BackgroundTokenizer (Effect Unit)

setDocument :: Document -> BackgroundTokenizer -> Effect Unit
setDocument doc self = runFn2 setDocumentImpl doc self

foreign import fireUpdateEventImpl :: Fn3 Int Int BackgroundTokenizer (Effect Unit)

fireUpdateEvent :: Int -> Int -> BackgroundTokenizer -> Effect Unit
fireUpdateEvent firstRow lastRow self = runFn3 fireUpdateEventImpl firstRow lastRow self

foreign import startImpl :: Fn2 Int BackgroundTokenizer (Effect Unit)

start :: Int -> BackgroundTokenizer -> Effect Unit
start startRow self = runFn2 startImpl startRow self

foreign import stop :: BackgroundTokenizer -> (Effect Unit)

foreign import getTokensImpl :: Fn2 Int BackgroundTokenizer (Effect (Array TokenInfo))

getTokens :: Int -> BackgroundTokenizer -> Effect (Array TokenInfo)
getTokens row self = runFn2 getTokensImpl row self

foreign import getStateImpl :: Fn2 Int BackgroundTokenizer (Effect String)

getState :: Int -> BackgroundTokenizer -> Effect String
getState row self = runFn2 getStateImpl row self

foreign import createImpl :: Fn2 Tokenizer Editor (Effect BackgroundTokenizer)

create :: Tokenizer -> Editor -> Effect BackgroundTokenizer
create tokenizer editor = runFn2 createImpl tokenizer editor
