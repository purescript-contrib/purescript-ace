module Ace.Types where

import Data.Maybe

import Data.Foreign
import Data.Foreign.Index
import Data.Foreign.Class
import Data.Foreign.Undefined

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
  
readDocumentEventType :: String -> DocumentEventType
readDocumentEventType "insertLines" = InsertLines
readDocumentEventType "insertText"  = InsertText 
readDocumentEventType "removeLines" = RemoveLines
readDocumentEventType "removeText"  = RemoveText 

data DocumentEvent = DocumentEvent DocumentEventType Range (Maybe [String]) (Maybe String) (Maybe String)
  
instance documentEventIsForeign :: IsForeign DocumentEvent where
  read e = do
    action <- readProp "action" e
    range  <- unsafeFromForeign <$> prop "range" e
    lines  <- runUndefined <$> readProp "lines" e
    text   <- runUndefined <$> readProp "text" e
    nl     <- runUndefined <$> readProp "nl" e
    return $ DocumentEvent (readDocumentEventType action) range lines text nl
             
data PasteEvent

data NewlineMode = Windows | Unix | Auto

showNewlineMode :: NewlineMode -> String
showNewlineMode Windows = "windows"
showNewlineMode Unix    = "unix"
showNewlineMode Auto    = "auto"
  
readNewlineMode :: String -> NewlineMode
readNewlineMode "windows" = Windows
readNewlineMode "unix"    = Unix
readNewlineMode "auto"    = Auto

data Rules

type Annotation = 
  { row :: Number
  , column :: Number
  , text :: String
  , "type" :: String
  }

type Position = 
  { row :: Number
  , column :: Number
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

foreign import data EAce :: !  

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

data TextMode

data TokenIterator

data Tokenizer

data UndoManager

data VirtualRenderer
