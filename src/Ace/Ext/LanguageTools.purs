module Ace.Ext.LanguageTools where

import Prelude (Unit())

import Control.Monad.Eff (Eff())

import Ace.Types


foreign import languageTools
  :: forall eff. Eff (ace :: ACE | eff) LanguageTools

foreign import textCompleter
  :: forall eff. LanguageTools -> Eff (ace :: ACE | eff) Completer
foreign import keyWordCompleter
  :: forall eff. LanguageTools -> Eff (ace :: ACE | eff) Completer
foreign import snippetCompleter
  :: forall eff. LanguageTools -> Eff (ace :: ACE | eff) Completer

foreign import setCompleters
  :: forall eff. Array Completer -> LanguageTools -> Eff (ace :: ACE | eff) Unit
foreign import addCompleter
  :: forall eff. Completer -> LanguageTools -> Eff (ace :: ACE | eff) Unit
