module Ace.Types where

import Prelude
import Foreign (F, Foreign, ForeignError(..), fail, readArray, readInt, readString)
import Foreign.Index ((!))
import Data.Maybe (Maybe)
import Data.Traversable (traverse)

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
readDocumentEventType s = fail $ TypeMismatch ("'" <> s <> "'") " a valid value for the DocumentEventType enum"

newtype DocumentEvent = DocumentEvent
  { action :: DocumentEventType
  , start :: Position
  , end :: Position
  , lines :: Array String
  }

readDocumentEvent :: Foreign -> F DocumentEvent
readDocumentEvent e = do
  action <- e ! "action" >>= readString >>= readDocumentEventType
  start <- e ! "start" >>= readPosition
  end <- e ! "end" >>= readPosition
  lines <- e ! "lines" >>= readArray >>= traverse readString
  pure $ DocumentEvent { action, start, end, lines }

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
readNewlineMode s = fail $ TypeMismatch ("'" <> s <> "'") " a valid value for the NewlineMode enum"

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

readPosition :: Foreign -> F Position
readPosition e = do
  row <- e ! "row" >>= readInt
  column <- e ! "column" >>= readInt
  pure $ Position { row, column }

getRow :: Position -> Int
getRow (Position { row }) = row

getColumn :: Position -> Int
getColumn (Position { column }) = column

type TokenInfo = { value :: String }

type SearchOptions =
  { needle :: String
  , backwards :: Boolean
  , wrap :: Boolean
  , caseSensitive :: Boolean
  , wholeWord :: Boolean
  , regExp :: Boolean
  , skipCurrent :: Boolean
  }

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
