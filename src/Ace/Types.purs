module Ace.Types where

import Prelude

import Data.Foreign (F, ForeignError(..), readString, fail)
import Data.Foreign.Class (class IsForeign, readProp)
import Data.Maybe (Maybe)

type AnchorEvent =
  { old :: Position
  , value :: Position
  }

data BackgroundTokenizerEvent

data DocumentEventType = Insert | Remove

showDocumentEventType :: DocumentEventType -> String
showDocumentEventType Insert = "insert"
showDocumentEventType Remove = "remove"

readDocumentEventType :: String -> F DocumentEventType
readDocumentEventType "insert" = pure Insert
readDocumentEventType "remove" = pure Remove
readDocumentEventType s =
  fail $ TypeMismatch ("'" <> s <> "'") " a valid value for the DocumentEventType enum"


instance documentEventTypeIsForeign :: IsForeign DocumentEventType where
  read = readString >=> readDocumentEventType

newtype DocumentEvent = DocumentEvent
  { action :: DocumentEventType
  , start :: Position
  , end :: Position
  , lines :: Array String
  }

instance documentEventIsForeign :: IsForeign DocumentEvent where
  read e = do
    r <- { action: _, start: _, end: _, lines: _ }
         <$> readProp "action" e
         <*> readProp "start" e
         <*> readProp "end" e
         <*> readProp "lines" e
    pure $ DocumentEvent r

data PasteEvent

data NewlineMode = Windows | Unix | Auto

showNewlineMode :: NewlineMode -> String
showNewlineMode Windows = "windows"
showNewlineMode Unix = "unix"
showNewlineMode Auto = "auto"

readNewlineMode :: String -> F NewlineMode
readNewlineMode "windows" = pure Windows
readNewlineMode "unix" = pure Unix
readNewlineMode "auto" = pure Auto
readNewlineMode s =
  fail $ TypeMismatch ("'" <> s <> "'") " a valid value for the NewlineMode enum"

data Rules

type Annotation =
  { row :: Int
  , column :: Int
  , text :: String
  , "type" :: String
  }

newtype Position = Position
  { row :: Int
  , column :: Int
  }

getRow :: Position -> Int
getRow (Position {row : row}) = row

getColumn :: Position -> Int
getColumn (Position {column : column}) = column

instance positionIsForeign :: IsForeign Position where
  read e = do
    r <- { row: _, column: _ }
         <$> readProp "row" e
         <*> readProp "column" e
    pure $ Position r

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

data KeyBinding

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

data LanguageTools

data Completer

data Marker

type Completion =
  { value :: String
  , score :: Number
  , meta :: String
  , caption :: Maybe String
  }

data Command = Null | InsertText

type HandlerResult =
  { command :: Command
  , passEvent :: Boolean
  }
