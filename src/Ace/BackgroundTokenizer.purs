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

import Ace.Types (BackgroundTokenizer, ACE, Editor, Tokenizer, TokenInfo, Document, BackgroundTokenizerEvent)
import Control.Monad.Eff (Eff)
import Data.Function.Uncurried (Fn2, runFn2, Fn3, runFn3)

foreign import onUpdateImpl :: forall eff a. Fn2 BackgroundTokenizer (BackgroundTokenizerEvent -> Eff (ace :: ACE | eff) a) (Eff (ace :: ACE | eff) Unit)

onUpdate :: forall eff a. BackgroundTokenizer -> (BackgroundTokenizerEvent -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onUpdate self fn = runFn2 onUpdateImpl self fn

foreign import setTokenizerImpl :: forall eff. Fn2 Tokenizer BackgroundTokenizer (Eff (ace :: ACE | eff) Unit)

setTokenizer :: forall eff. Tokenizer -> BackgroundTokenizer -> Eff (ace :: ACE | eff) Unit
setTokenizer tokenizer self = runFn2 setTokenizerImpl tokenizer self

foreign import setDocumentImpl :: forall eff. Fn2 Document BackgroundTokenizer (Eff (ace :: ACE | eff) Unit)

setDocument :: forall eff. Document -> BackgroundTokenizer -> Eff (ace :: ACE | eff) Unit
setDocument doc self = runFn2 setDocumentImpl doc self

foreign import fireUpdateEventImpl :: forall eff. Fn3 Int Int BackgroundTokenizer (Eff (ace :: ACE | eff) Unit)

fireUpdateEvent :: forall eff. Int -> Int -> BackgroundTokenizer -> Eff (ace :: ACE | eff) Unit
fireUpdateEvent firstRow lastRow self = runFn3 fireUpdateEventImpl firstRow lastRow self

foreign import startImpl :: forall eff. Fn2 Int BackgroundTokenizer (Eff (ace :: ACE | eff) Unit)

start :: forall eff. Int -> BackgroundTokenizer -> Eff (ace :: ACE | eff) Unit
start startRow self = runFn2 startImpl startRow self

foreign import stop :: forall eff. BackgroundTokenizer -> (Eff (ace :: ACE | eff) Unit)

foreign import getTokensImpl :: forall eff. Fn2 Int BackgroundTokenizer (Eff (ace :: ACE | eff) (Array TokenInfo))

getTokens :: forall eff. Int -> BackgroundTokenizer -> Eff (ace :: ACE | eff) (Array TokenInfo)
getTokens row self = runFn2 getTokensImpl row self

foreign import getStateImpl :: forall eff. Fn2 Int BackgroundTokenizer (Eff (ace :: ACE | eff) String)

getState :: forall eff. Int -> BackgroundTokenizer -> Eff (ace :: ACE | eff) String
getState row self = runFn2 getStateImpl row self

foreign import createImpl :: forall eff. Fn2 Tokenizer Editor (Eff (ace :: ACE | eff) BackgroundTokenizer)

create :: forall eff. Tokenizer -> Editor -> Eff (ace :: ACE | eff) BackgroundTokenizer
create tokenizer editor = runFn2 createImpl tokenizer editor
