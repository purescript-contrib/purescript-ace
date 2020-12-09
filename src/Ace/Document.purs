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
  , insertLines
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

import Ace.Types (Document, Position, Range, NewlineMode, Anchor, DocumentEvent, readDocumentEvent, showNewlineMode)
import Control.Monad.Except (runExcept)
import Data.Either (either)
import Data.Function.Uncurried (Fn2, runFn2, Fn3, runFn3, Fn4, runFn4)
import Data.Nullable (Nullable)
import Effect (Effect)
import Foreign (Foreign)
import Partial.Unsafe (unsafeCrashWith)

foreign import onChangeImpl
  :: forall a
   . Fn2 Document (Foreign -> Effect a) (Effect Unit)

onChange
  :: forall a
   . Document
  -> (DocumentEvent -> Effect a)
  -> Effect Unit
onChange self fn =
  runFn2 onChangeImpl self (fn <<< fromRight <<< runExcept <<< readDocumentEvent)
  where
  fromRight = either (\_ -> unsafeCrashWith "Expected Left in Ace.Document.onChange") identity

foreign import setValueImpl
  :: Fn2 String Document (Effect Unit)

setValue :: String -> Document -> Effect Unit
setValue text self = runFn2 setValueImpl text self

foreign import getValue :: Document -> Effect String

foreign import createAnchorImpl
  :: Fn3 Int Int Document (Effect Anchor)

createAnchor :: Int -> Int -> Document -> Effect Anchor
createAnchor row column self = runFn3 createAnchorImpl row column self

foreign import getNewLineCharacter
  :: Document -> Effect String

foreign import setNewLineModeImpl
  :: Fn2 String Document (Effect Unit)

setNewLineMode :: NewlineMode -> Document -> Effect Unit
setNewLineMode newLineMode self =
  runFn2 setNewLineModeImpl (showNewlineMode newLineMode) self

foreign import getNewLineMode
  :: Document -> Effect String

foreign import isNewLineImpl
  :: Fn2 String Document (Effect Boolean)

isNewLine :: String -> Document -> Effect Boolean
isNewLine text self = runFn2 isNewLineImpl text self

foreign import getLineImpl
  :: Fn2 Int Document (Effect String)

getLine :: Int -> Document -> Effect String
getLine row self = runFn2 getLineImpl row self

foreign import getLinesImpl
  :: Fn3 Int Int Document (Effect (Array String))

getLines
  :: Int -> Int -> Document -> Effect (Array String)
getLines firstRow lastRow self = runFn3 getLinesImpl firstRow lastRow self

foreign import getAllLines
  :: Document -> Effect (Array String)

foreign import getLength
  :: Document -> Effect Int

foreign import getTextRangeImpl
  :: Fn2 Range Document (Effect String)

getTextRange :: Range -> Document -> Effect String
getTextRange range self = runFn2 getTextRangeImpl range self

foreign import insertImpl
  :: Fn3 Position String Document (Effect Unit)

insert :: Position -> String -> Document -> Effect Unit
insert position text self = runFn3 insertImpl position text self

foreign import insertLinesImpl
  :: Fn3 Int (Array String) Document (Effect Unit)

insertLines
  :: Int -> Array String -> Document -> Effect Unit
insertLines row lines self = runFn3 insertLinesImpl row lines self

foreign import insertNewLineImpl :: Fn2 Position Document (Effect Unit)

insertNewLine :: Position -> Document -> Effect Unit
insertNewLine position self = runFn2 insertNewLineImpl position self

foreign import insertInLineImpl
  :: Fn3 Position String Document (Effect Unit)

insertInLine
  :: Position -> String -> Document -> Effect Unit
insertInLine position text self = runFn3 insertInLineImpl position text self

foreign import removeImpl
  :: Fn2 Range Document (Effect Unit)

remove :: Range -> Document -> Effect Unit
remove range self = runFn2 removeImpl range self

foreign import removeInLineImpl
  :: Fn4 Int Int Int Document (Effect Unit)

removeInLine
  :: Int -> Int -> Int -> Document -> Effect Unit
removeInLine row startColumn endColumn self = runFn4 removeInLineImpl row startColumn endColumn self

foreign import removeLinesImpl
  :: Fn3 Int Int Document (Effect (Array String))

removeLines
  :: Int -> Int -> Document -> Effect (Array String)
removeLines firstRow lastRow self = runFn3 removeLinesImpl firstRow lastRow self

foreign import removeNewLineImpl
  :: Fn2 Int Document (Effect Unit)

removeNewLine :: Int -> Document -> Effect Unit
removeNewLine row self = runFn2 removeNewLineImpl row self

foreign import replaceImpl
  :: Fn3 Range String Document (Effect Unit)

replace :: Range -> String -> Document -> Effect Unit
replace range text self = runFn3 replaceImpl range text self

foreign import indexToPositionImpl
  :: Fn3 Int Int Document (Effect Position)

indexToPosition
  :: Int -> Int -> Document -> Effect Position
indexToPosition index startRow self = runFn3 indexToPositionImpl index startRow self

foreign import positionToIndexImpl
  :: Fn3 Position Int Document (Effect Int)

positionToIndex
  :: Position -> Int -> Document -> Effect Int
positionToIndex pos startRow self = runFn3 positionToIndexImpl pos startRow self

foreign import create
  :: Nullable String -> Effect Document

foreign import createFromLines
  :: Array String -> Effect Document
