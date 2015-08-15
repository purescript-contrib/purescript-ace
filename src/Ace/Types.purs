module Ace.Types where

import Prelude

import Data.Either (Either(..))
import Data.Foreign (Foreign(), F(), ForeignError(..), unsafeFromForeign)
import Data.Foreign.Class (IsForeign, read, readProp)
import Data.Foreign.Index (prop)
import Data.Foreign.Undefined (runUndefined)
import Data.Maybe (Maybe())

type AnchorEvent =
  { old :: Position
  , value :: Position
  }

data BackgroundTokenizerEvent

data DocumentEventType = InsertLines | InsertText | RemoveLines | RemoveText

showDocumentEventType :: DocumentEventType -> String
showDocumentEventType InsertLines = "insertLines"
showDocumentEventType InsertText  = "insertText"
showDocumentEventType RemoveLines = "removeLines"
showDocumentEventType RemoveText  = "removeText"

readDocumentEventType :: String -> F DocumentEventType
readDocumentEventType "insertLines" = Right InsertLines
readDocumentEventType "insertText"  = Right InsertText
readDocumentEventType "removeLines" = Right RemoveLines
readDocumentEventType "removeText"  = Right RemoveText
readDocumentEventType s = Left $ TypeMismatch ("'" ++ s ++ "'") " a valid value for the DocumentEventType enum"

data DocumentEvent = DocumentEvent DocumentEventType Range (Maybe (Array String)) (Maybe String) (Maybe String)

instance documentEventIsForeign :: IsForeign DocumentEvent where
  read e = do
    et     <- readProp "action" e >>= readDocumentEventType
    range  <- unsafeFromForeign <$> prop "range" e
    lines  <- runUndefined <$> readProp "lines" e
    text   <- runUndefined <$> readProp "text" e
    nl     <- runUndefined <$> readProp "nl" e
    return $ DocumentEvent et range lines text nl

data PasteEvent

data NewlineMode = Windows | Unix | Auto

showNewlineMode :: NewlineMode -> String
showNewlineMode Windows = "windows"
showNewlineMode Unix    = "unix"
showNewlineMode Auto    = "auto"

readNewlineMode :: String -> F NewlineMode
readNewlineMode "windows" = Right Windows
readNewlineMode "unix"    = Right Unix
readNewlineMode "auto"    = Right Auto
readNewlineMode s = Left $ TypeMismatch ("'" ++ s ++ "'") " a valid value for the NewlineMode enum"

data Rules

type Annotation =
  { row :: Int
  , column :: Int
  , text :: String
  , "type" :: String
  }

type Position =
  { row :: Int
  , column :: Int
  }

type TokenInfo =
  { value :: String
  }

type SearchOptions =
  { needle :: String
  , backwards :: Boolean
  , wrap :: Boolean
  , caseSensitive :: Boolean
  , wholeWord :: Boolean
  , regExp :: Boolean
  , skipCurrent :: Boolean
  }

foreign import data ACE :: !

data Ace

data Anchor

data BackgroundTokenizer

data Document

data Editor

data EditSession

data Range

data RangeList

data ScrollBar

data Search

data Selection

newtype TextMode = TextMode String

data TokenIterator

data Tokenizer

data UndoManager

data VirtualRenderer
