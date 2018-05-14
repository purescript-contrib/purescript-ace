module Ace.Ext.LanguageTools where

import Prelude (Unit)
import Ace.Types
import Effect (Effect)

foreign import languageTools
  :: Effect LanguageTools

foreign import textCompleter
  :: LanguageTools -> Effect Completer

foreign import keyWordCompleter
  :: LanguageTools -> Effect Completer

foreign import snippetCompleter
  :: LanguageTools -> Effect Completer

foreign import setCompleters
  :: Array Completer -> LanguageTools -> Effect Unit

foreign import addCompleter
  :: Completer -> LanguageTools -> Effect Unit
