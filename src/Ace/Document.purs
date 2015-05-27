module Ace.Document
  ( onChange
  , setValue
  , getValue
  , createAnchor
  , getNewLineCharacter
  , setNewLineMode
  , getNewLineMode
  , isNewLine
  , getLine
  , getLines
  , getAllLines
  , getLength
  , getTextRange
  , insert
  , insertNewLine
  , insertInLine
  , remove
  , removeInLine
  , removeNewLine
  , removeLines
  , replace
  , indexToPosition
  , positionToIndex
  , create
  , createFromLines
  ) where

import Data.Maybe
import Data.Either
import Data.Foreign
import Data.Foreign.Class
import Data.Function

import Control.Monad.Eff

import Ace.Types
import Data.Nullable

foreign import onChangeImpl
  "function onChangeImpl(self, fn) {\
  \  return function() {\
  \    return self.on('change', function(e) {\
  \      fn(e.data)();\
  \    });\
  \  };\
  \}" :: forall eff a. Fn2 Document (Foreign -> Eff (ace :: ACE | eff) a) (Eff (ace :: ACE | eff) Unit)

onChange :: forall eff a. Document -> (DocumentEvent -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onChange self fn = runFn2 onChangeImpl self (fn <<< readResult <<< read)
  where
  readResult :: forall a. F a -> a
  readResult (Right r) = r

foreign import setValueImpl
  "function setValueImpl(text, self) {\
  \  return function() {\
  \    return self.setValue(text);\
  \  };\
  \}" :: forall eff. Fn2 String Document (Eff (ace :: ACE | eff) Unit)

setValue :: forall eff. String -> Document -> Eff (ace :: ACE | eff) Unit
setValue text self = runFn2 setValueImpl text self

foreign import getValueImpl
  "function getValueImpl(self) {\
  \  return function() {\
  \    return self.getValue();\
  \  };\
  \}" :: forall eff. Fn1 Document (Eff (ace :: ACE | eff) String)

getValue :: forall eff. Document -> Eff (ace :: ACE | eff) String
getValue self = runFn1 getValueImpl self

foreign import createAnchorImpl
  "function createAnchorImpl(row, column, self) {\
  \  return function() {\
  \    return self.createAnchor(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Document (Eff (ace :: ACE | eff) Anchor)

createAnchor :: forall eff. Number -> Number -> Document -> Eff (ace :: ACE | eff) Anchor
createAnchor row column self = runFn3 createAnchorImpl row column self

foreign import getNewLineCharacterImpl
  "function getNewLineCharacterImpl(self) {\
  \  return function() {\
  \    return self.getNewLineCharacter();\
  \  };\
  \}" :: forall eff. Fn1 Document (Eff (ace :: ACE | eff) String)

getNewLineCharacter :: forall eff. Document -> Eff (ace :: ACE | eff) String
getNewLineCharacter self = runFn1 getNewLineCharacterImpl self

foreign import setNewLineModeImpl
  "function setNewLineModeImpl(newLineMode, self) {\
  \  return function() {\
  \    return self.setNewLineMode(newLineMode);\
  \  };\
  \}" :: forall eff. Fn2 String Document (Eff (ace :: ACE | eff) Unit)

setNewLineMode :: forall eff. NewlineMode -> Document -> Eff (ace :: ACE | eff) Unit
setNewLineMode newLineMode self = runFn2 setNewLineModeImpl (showNewlineMode newLineMode) self

foreign import getNewLineModeImpl
  "function getNewLineModeImpl(self) {\
  \  return function() {\
  \    return self.getNewLineMode();\
  \  };\
  \}" :: forall eff. Fn1 Document (Eff (ace :: ACE | eff) String)

getNewLineMode :: forall eff. Document -> Eff (ace :: ACE | eff) NewlineMode
getNewLineMode self = readNewlineMode <$> runFn1 getNewLineModeImpl self

foreign import isNewLineImpl
  "function isNewLineImpl(text, self) {\
  \  return function() {\
  \    return self.isNewLine(text);\
  \  };\
  \}" :: forall eff. Fn2 String Document (Eff (ace :: ACE | eff) Boolean)

isNewLine :: forall eff. String -> Document -> Eff (ace :: ACE | eff) Boolean
isNewLine text self = runFn2 isNewLineImpl text self

foreign import getLineImpl
  "function getLineImpl(row, self) {\
  \  return function() {\
  \    return self.getLine(row);\
  \  };\
  \}" :: forall eff. Fn2 Number Document (Eff (ace :: ACE | eff) String)

getLine :: forall eff. Number -> Document -> Eff (ace :: ACE | eff) String
getLine row self = runFn2 getLineImpl row self

foreign import getLinesImpl
  "function getLinesImpl(firstRow, lastRow, self) {\
  \  return function() {\
  \    return self.getLines(firstRow, lastRow);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Document (Eff (ace :: ACE | eff) [String])

getLines :: forall eff. Number -> Number -> Document -> Eff (ace :: ACE | eff) [String]
getLines firstRow lastRow self = runFn3 getLinesImpl firstRow lastRow self

foreign import getAllLinesImpl
  "function getAllLinesImpl(self) {\
  \  return function() {\
  \    return self.getAllLines();\
  \  };\
  \}" :: forall eff. Fn1 Document (Eff (ace :: ACE | eff) [String])

getAllLines :: forall eff. Document -> Eff (ace :: ACE | eff) [String]
getAllLines self = runFn1 getAllLinesImpl self

foreign import getLengthImpl
  "function getLengthImpl(self) {\
  \  return function() {\
  \    return self.getLength();\
  \  };\
  \}" :: forall eff. Fn1 Document (Eff (ace :: ACE | eff) Number)

getLength :: forall eff. Document -> Eff (ace :: ACE | eff) Number
getLength self = runFn1 getLengthImpl self

foreign import getTextRangeImpl
  "function getTextRangeImpl(range, self) {\
  \  return function() {\
  \    return self.getTextRange(range);\
  \  };\
  \}" :: forall eff. Fn2 Range Document (Eff (ace :: ACE | eff) String)

getTextRange :: forall eff. Range -> Document -> Eff (ace :: ACE | eff) String
getTextRange range self = runFn2 getTextRangeImpl range self

foreign import insertImpl
  "function insertImpl(position, text, self) {\
  \  return function() {\
  \    return self.insert(position, text);\
  \  };\
  \}" :: forall eff. Fn3 Position String Document (Eff (ace :: ACE | eff) Unit)

insert :: forall eff. Position -> String -> Document -> Eff (ace :: ACE | eff) Unit
insert position text self = runFn3 insertImpl position text self

foreign import insertLinesImpl
  "function insertLinesImpl(row, lines, self) {\
  \  return function() {\
  \    return self.insertLines(row, lines);\
  \  };\
  \}" :: forall eff. Fn3 Number [String] Document (Eff (ace :: ACE | eff) Unit)

insertLines :: forall eff. Number -> [String] -> Document -> Eff (ace :: ACE | eff) Unit
insertLines row lines self = runFn3 insertLinesImpl row lines self

foreign import insertNewLineImpl
  "function insertNewLineImpl(position, self) {\
  \  return function() {\
  \    return self.insertNewLine(position);\
  \  };\
  \}" :: forall eff. Fn2 Position Document (Eff (ace :: ACE | eff) Unit)

insertNewLine :: forall eff. Position -> Document -> Eff (ace :: ACE | eff) Unit
insertNewLine position self = runFn2 insertNewLineImpl position self

foreign import insertInLineImpl
  "function insertInLineImpl(position, text, self) {\
  \  return function() {\
  \    return self.insertInLine(position, text);\
  \  };\
  \}" :: forall eff. Fn3 Position String Document (Eff (ace :: ACE | eff) Unit)

insertInLine :: forall eff. Position -> String -> Document -> Eff (ace :: ACE | eff) Unit
insertInLine position text self = runFn3 insertInLineImpl position text self

foreign import removeImpl
  "function removeImpl(range, self) {\
  \  return function() {\
  \    return self.remove(range);\
  \  };\
  \}" :: forall eff. Fn2 Range Document (Eff (ace :: ACE | eff) Unit)

remove :: forall eff. Range -> Document -> Eff (ace :: ACE | eff) Unit
remove range self = runFn2 removeImpl range self

foreign import removeInLineImpl
  "function removeInLineImpl(row, startColumn, endColumn, self) {\
  \  return function() {\
  \    return self.removeInLine(row, startColumn, endColumn);\
  \  };\
  \}" :: forall eff. Fn4 Number Number Number Document (Eff (ace :: ACE | eff) Unit)

removeInLine :: forall eff. Number -> Number -> Number -> Document -> Eff (ace :: ACE | eff) Unit
removeInLine row startColumn endColumn self = runFn4 removeInLineImpl row startColumn endColumn self

foreign import removeLinesImpl
  "function removeLinesImpl(firstRow, lastRow, self) {\
  \  return function() {\
  \    return self.removeLines(firstRow, lastRow);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Document (Eff (ace :: ACE | eff) [String])

removeLines :: forall eff. Number -> Number -> Document -> Eff (ace :: ACE | eff) [String]
removeLines firstRow lastRow self = runFn3 removeLinesImpl firstRow lastRow self

foreign import removeNewLineImpl
  "function removeNewLineImpl(row, self) {\
  \  return function() {\
  \    return self.removeNewLine(row);\
  \  };\
  \}" :: forall eff. Fn2 Number Document (Eff (ace :: ACE | eff) Unit)

removeNewLine :: forall eff. Number -> Document -> Eff (ace :: ACE | eff) Unit
removeNewLine row self = runFn2 removeNewLineImpl row self

foreign import replaceImpl
  "function replaceImpl(range, text, self) {\
  \  return function() {\
  \    return self.replace(range, text);\
  \  };\
  \}" :: forall eff. Fn3 Range String Document (Eff (ace :: ACE | eff) Unit)

replace :: forall eff. Range -> String -> Document -> Eff (ace :: ACE | eff) Unit
replace range text self = runFn3 replaceImpl range text self

foreign import indexToPositionImpl
  "function indexToPositionImpl(index, startRow, self) {\
  \  return function() {\
  \    return self.indexToPosition(index, startRow);\
  \  };\
  \}" :: forall eff. Fn3 Number Number Document (Eff (ace :: ACE | eff) Position)

indexToPosition :: forall eff. Number -> Number -> Document -> Eff (ace :: ACE | eff) Position
indexToPosition index startRow self = runFn3 indexToPositionImpl index startRow self

foreign import positionToIndexImpl
  "function positionToIndexImpl(pos, startRow, self) {\
  \  return function() {\
  \    return self.positionToIndex(pos, startRow);\
  \  };\
  \}" :: forall eff. Fn3 Position Number Document (Eff (ace :: ACE | eff) Number)

positionToIndex :: forall eff. Position -> Number -> Document -> Eff (ace :: ACE | eff) Number
positionToIndex pos startRow self = runFn3 positionToIndexImpl pos startRow self

foreign import createImpl
  "function createImpl(text) {\
  \  return function() {\
  \    var Document = ace.require('ace/document').Document;\
  \    return new Document(text);\
  \  };\
  \}" :: forall eff. Fn1 (Nullable String) (Eff (ace :: ACE | eff) Document)

create :: forall eff. Maybe String -> Eff (ace :: ACE | eff) Document
create text = runFn1 createImpl (toNullable text)

foreign import createFromLinesImpl
  "function createFromLinesImpl(text) {\
  \  return function() {\
  \    var Document = ace.require('ace/document').Document;\
  \    return new Document(text);\
  \  };\
  \}" :: forall eff. Fn1 [String] (Eff (ace :: ACE | eff) Document)

createFromLines :: forall eff. [String] -> Eff (ace :: ACE | eff) Document
createFromLines text = runFn1 createFromLinesImpl text
