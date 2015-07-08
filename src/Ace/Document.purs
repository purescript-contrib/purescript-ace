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

import Prelude

import Data.Maybe
import Data.Either
import Data.Foreign
import Data.Foreign.Class
import Data.Function

import Control.Monad.Eff

import Ace.Types
import Data.Nullable

foreign import onChangeImpl :: forall eff a. Fn2 Document (Foreign -> Eff (ace :: ACE | eff) a) (Eff (ace :: ACE | eff) Unit)

onChange :: forall eff a. Document -> (DocumentEvent -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
onChange self fn = runFn2 onChangeImpl self (fn <<< readResult <<< read)
  where
  readResult :: forall a. F a -> a
  readResult (Right r) = r

foreign import setValueImpl :: forall eff. Fn2 String Document (Eff (ace :: ACE | eff) Unit)

setValue :: forall eff. String -> Document -> Eff (ace :: ACE | eff) Unit
setValue text self = runFn2 setValueImpl text self

foreign import getValueImpl :: forall eff. Fn1 Document (Eff (ace :: ACE | eff) String)

getValue :: forall eff. Document -> Eff (ace :: ACE | eff) String
getValue self = runFn1 getValueImpl self

foreign import createAnchorImpl :: forall eff. Fn3 Int Int Document (Eff (ace :: ACE | eff) Anchor)

createAnchor :: forall eff. Int -> Int -> Document -> Eff (ace :: ACE | eff) Anchor
createAnchor row column self = runFn3 createAnchorImpl row column self

foreign import getNewLineCharacterImpl :: forall eff. Fn1 Document (Eff (ace :: ACE | eff) String)

getNewLineCharacter :: forall eff. Document -> Eff (ace :: ACE | eff) String
getNewLineCharacter self = runFn1 getNewLineCharacterImpl self

foreign import setNewLineModeImpl :: forall eff. Fn2 String Document (Eff (ace :: ACE | eff) Unit)

setNewLineMode :: forall eff. NewlineMode -> Document -> Eff (ace :: ACE | eff) Unit
setNewLineMode newLineMode self = runFn2 setNewLineModeImpl (showNewlineMode newLineMode) self

foreign import getNewLineModeImpl :: forall eff. Fn1 Document (Eff (ace :: ACE | eff) String)

getNewLineMode :: forall eff. Document -> Eff (ace :: ACE | eff) NewlineMode
getNewLineMode self = readNewlineMode <$> runFn1 getNewLineModeImpl self

foreign import isNewLineImpl :: forall eff. Fn2 String Document (Eff (ace :: ACE | eff) Boolean)

isNewLine :: forall eff. String -> Document -> Eff (ace :: ACE | eff) Boolean
isNewLine text self = runFn2 isNewLineImpl text self

foreign import getLineImpl :: forall eff. Fn2 Int Document (Eff (ace :: ACE | eff) String)

getLine :: forall eff. Int -> Document -> Eff (ace :: ACE | eff) String
getLine row self = runFn2 getLineImpl row self

foreign import getLinesImpl :: forall eff. Fn3 Int Int Document (Eff (ace :: ACE | eff) (Array String))

getLines :: forall eff. Int -> Int -> Document -> Eff (ace :: ACE | eff) (Array String)
getLines firstRow lastRow self = runFn3 getLinesImpl firstRow lastRow self

foreign import getAllLinesImpl :: forall eff. Fn1 Document (Eff (ace :: ACE | eff) (Array String))

getAllLines :: forall eff. Document -> Eff (ace :: ACE | eff) (Array String)
getAllLines self = runFn1 getAllLinesImpl self

foreign import getLengthImpl :: forall eff. Fn1 Document (Eff (ace :: ACE | eff) Int)

getLength :: forall eff. Document -> Eff (ace :: ACE | eff) Int
getLength self = runFn1 getLengthImpl self

foreign import getTextRangeImpl :: forall eff. Fn2 Range Document (Eff (ace :: ACE | eff) String)

getTextRange :: forall eff. Range -> Document -> Eff (ace :: ACE | eff) String
getTextRange range self = runFn2 getTextRangeImpl range self

foreign import insertImpl :: forall eff. Fn3 Position String Document (Eff (ace :: ACE | eff) Unit)

insert :: forall eff. Position -> String -> Document -> Eff (ace :: ACE | eff) Unit
insert position text self = runFn3 insertImpl position text self

foreign import insertLinesImpl :: forall eff. Fn3 Int (Array String) Document (Eff (ace :: ACE | eff) Unit)

insertLines :: forall eff. Int -> Array String -> Document -> Eff (ace :: ACE | eff) Unit
insertLines row lines self = runFn3 insertLinesImpl row lines self

foreign import insertNewLineImpl :: forall eff. Fn2 Position Document (Eff (ace :: ACE | eff) Unit)

insertNewLine :: forall eff. Position -> Document -> Eff (ace :: ACE | eff) Unit
insertNewLine position self = runFn2 insertNewLineImpl position self

foreign import insertInLineImpl :: forall eff. Fn3 Position String Document (Eff (ace :: ACE | eff) Unit)

insertInLine :: forall eff. Position -> String -> Document -> Eff (ace :: ACE | eff) Unit
insertInLine position text self = runFn3 insertInLineImpl position text self

foreign import removeImpl :: forall eff. Fn2 Range Document (Eff (ace :: ACE | eff) Unit)

remove :: forall eff. Range -> Document -> Eff (ace :: ACE | eff) Unit
remove range self = runFn2 removeImpl range self

foreign import removeInLineImpl :: forall eff. Fn4 Int Int Int Document (Eff (ace :: ACE | eff) Unit)

removeInLine :: forall eff. Int -> Int -> Int -> Document -> Eff (ace :: ACE | eff) Unit
removeInLine row startColumn endColumn self = runFn4 removeInLineImpl row startColumn endColumn self

foreign import removeLinesImpl :: forall eff. Fn3 Int Int Document (Eff (ace :: ACE | eff) (Array String))

removeLines :: forall eff. Int -> Int -> Document -> Eff (ace :: ACE | eff) (Array String)
removeLines firstRow lastRow self = runFn3 removeLinesImpl firstRow lastRow self

foreign import removeNewLineImpl :: forall eff. Fn2 Int Document (Eff (ace :: ACE | eff) Unit)

removeNewLine :: forall eff. Int -> Document -> Eff (ace :: ACE | eff) Unit
removeNewLine row self = runFn2 removeNewLineImpl row self

foreign import replaceImpl :: forall eff. Fn3 Range String Document (Eff (ace :: ACE | eff) Unit)

replace :: forall eff. Range -> String -> Document -> Eff (ace :: ACE | eff) Unit
replace range text self = runFn3 replaceImpl range text self

foreign import indexToPositionImpl :: forall eff. Fn3 Int Int Document (Eff (ace :: ACE | eff) Position)

indexToPosition :: forall eff. Int -> Int -> Document -> Eff (ace :: ACE | eff) Position
indexToPosition index startRow self = runFn3 indexToPositionImpl index startRow self

foreign import positionToIndexImpl :: forall eff. Fn3 Position Int Document (Eff (ace :: ACE | eff) Int)

positionToIndex :: forall eff. Position -> Int -> Document -> Eff (ace :: ACE | eff) Int
positionToIndex pos startRow self = runFn3 positionToIndexImpl pos startRow self

foreign import createImpl :: forall eff. Fn1 (Nullable String) (Eff (ace :: ACE | eff) Document)

create :: forall eff. Maybe String -> Eff (ace :: ACE | eff) Document
create text = runFn1 createImpl (toNullable text)

foreign import createFromLinesImpl :: forall eff. Fn1 (Array String) (Eff (ace :: ACE | eff) Document)

createFromLines :: forall eff. Array String -> Eff (ace :: ACE | eff) Document
createFromLines text = runFn1 createFromLinesImpl text
