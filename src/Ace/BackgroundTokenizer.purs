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

import Prelude hiding (compare)

import Data.Maybe
import Data.Function hiding (on)

import Control.Monad.Eff

import Ace.Types
import Ace.Internal

foreign import onUpdateImpl
  "function onUpdateImpl(self, fn) {\
  \  return function() {\
  \    return self.on('update', function(e) {\
  \      fn(e)();\
  \    });\
  \  };\
  \}" :: forall eff a. Fn2 BackgroundTokenizer (BackgroundTokenizerEvent -> Eff (ace :: EAce | eff) a) (Eff (ace :: EAce | eff) Unit)

onUpdate :: forall eff a. BackgroundTokenizer -> (BackgroundTokenizerEvent -> Eff (ace :: EAce | eff) a) -> Eff (ace :: EAce | eff) Unit
onUpdate self fn = runFn2 onUpdateImpl self fn

foreign import setTokenizerImpl
  "function setTokenizerImpl(tokenizer, self) {\
  \  return function() {\
  \    return self.setTokenizer(tokenizer);\
  \  };\
  \}" :: forall eff. Fn2 Tokenizer BackgroundTokenizer (Eff (ace :: EAce | eff) Unit)

setTokenizer :: forall eff. Tokenizer -> BackgroundTokenizer -> Eff (ace :: EAce | eff) Unit
setTokenizer tokenizer self = runFn2 setTokenizerImpl tokenizer self

foreign import setDocumentImpl
  "function setDocumentImpl(doc, self) {\
  \  return function() {\
  \    return self.setDocument(doc);\
  \  };\
  \}" :: forall eff. Fn2 Document BackgroundTokenizer (Eff (ace :: EAce | eff) Unit)

setDocument :: forall eff. Document -> BackgroundTokenizer -> Eff (ace :: EAce | eff) Unit
setDocument doc self = runFn2 setDocumentImpl doc self

foreign import fireUpdateEventImpl
  "function fireUpdateEventImpl(firstRow, lastRow, self) {\
  \  return function() {\
  \    return self.fireUpdateEvent(firstRow, lastRow);\
  \  };\
  \}" :: forall eff. Fn3 Number Number BackgroundTokenizer (Eff (ace :: EAce | eff) Unit)

fireUpdateEvent :: forall eff. Number -> Number -> BackgroundTokenizer -> Eff (ace :: EAce | eff) Unit
fireUpdateEvent firstRow lastRow self = runFn3 fireUpdateEventImpl firstRow lastRow self

foreign import startImpl
  "function startImpl(startRow, self) {\
  \  return function() {\
  \    return self.start(startRow);\
  \  };\
  \}" :: forall eff. Fn2 Number BackgroundTokenizer (Eff (ace :: EAce | eff) Unit)

start :: forall eff. Number -> BackgroundTokenizer -> Eff (ace :: EAce | eff) Unit
start startRow self = runFn2 startImpl startRow self

foreign import stopImpl
  "function stopImpl(self) {\
  \  return function() {\
  \    return self.stop();\
  \  };\
  \}" :: forall eff. Fn1 BackgroundTokenizer (Eff (ace :: EAce | eff) Unit)

stop :: forall eff. BackgroundTokenizer -> Eff (ace :: EAce | eff) Unit
stop self = runFn1 stopImpl self

foreign import getTokensImpl
  "function getTokensImpl(row, self) {\
  \  return function() {\
  \    return self.getTokens(row);\
  \  };\
  \}" :: forall eff. Fn2 Number BackgroundTokenizer (Eff (ace :: EAce | eff) [TokenInfo])

getTokens :: forall eff. Number -> BackgroundTokenizer -> Eff (ace :: EAce | eff) [TokenInfo]
getTokens row self = runFn2 getTokensImpl row self

foreign import getStateImpl
  "function getStateImpl(row, self) {\
  \  return function() {\
  \    return self.getState(row);\
  \  };\
  \}" :: forall eff. Fn2 Number BackgroundTokenizer (Eff (ace :: EAce | eff) String)

getState :: forall eff. Number -> BackgroundTokenizer -> Eff (ace :: EAce | eff) String
getState row self = runFn2 getStateImpl row self

foreign import createImpl
  "function createImpl(tokenizer, editor) {\
  \  return function() {\
  \    var BackgroundTokenizer = ace.require('ace/background_tokenizer').BackgroundTokenizer;\
  \    return new BackgroundTokenizer(tokenizer, editor);\
  \  };\
  \}" :: forall eff. Fn2 Tokenizer Editor (Eff (ace :: EAce | eff) BackgroundTokenizer)

create :: forall eff. Tokenizer -> Editor -> Eff (ace :: EAce | eff) BackgroundTokenizer
create tokenizer editor = runFn2 createImpl tokenizer editor
