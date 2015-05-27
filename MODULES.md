# Module Documentation

## Module Ace

#### `ace`

``` purescript
ace :: Ace
```


#### `edit`

``` purescript
edit :: forall eff. String -> Ace -> Eff (ace :: ACE | eff) Editor
```


#### `editNode`

``` purescript
editNode :: forall eff. HTMLElement -> Ace -> Eff (ace :: ACE | eff) Editor
```


#### `createEditSessionForDocument`

``` purescript
createEditSessionForDocument :: forall eff. Document -> TextMode -> Ace -> Eff (ace :: ACE | eff) EditSession
```


#### `createEditSession`

``` purescript
createEditSession :: forall eff. String -> TextMode -> Ace -> Eff (ace :: ACE | eff) EditSession
```



## Module Ace.Anchor

#### `onChange`

``` purescript
onChange :: forall eff a. Anchor -> (AnchorEvent -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
```


#### `getPosition`

``` purescript
getPosition :: forall eff. Anchor -> Eff (ace :: ACE | eff) Position
```


#### `getDocument`

``` purescript
getDocument :: forall eff. Anchor -> Eff (ace :: ACE | eff) Document
```


#### `setPosition`

``` purescript
setPosition :: forall eff. Number -> Number -> Boolean -> Anchor -> Eff (ace :: ACE | eff) Unit
```


#### `detach`

``` purescript
detach :: forall eff. Anchor -> Eff (ace :: ACE | eff) Unit
```


#### `create`

``` purescript
create :: forall eff. Document -> Number -> Number -> Eff (ace :: ACE | eff) Anchor
```



## Module Ace.BackgroundTokenizer

#### `onUpdate`

``` purescript
onUpdate :: forall eff a. BackgroundTokenizer -> (BackgroundTokenizerEvent -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
```


#### `setTokenizer`

``` purescript
setTokenizer :: forall eff. Tokenizer -> BackgroundTokenizer -> Eff (ace :: ACE | eff) Unit
```


#### `setDocument`

``` purescript
setDocument :: forall eff. Document -> BackgroundTokenizer -> Eff (ace :: ACE | eff) Unit
```


#### `fireUpdateEvent`

``` purescript
fireUpdateEvent :: forall eff. Number -> Number -> BackgroundTokenizer -> Eff (ace :: ACE | eff) Unit
```


#### `start`

``` purescript
start :: forall eff. Number -> BackgroundTokenizer -> Eff (ace :: ACE | eff) Unit
```


#### `stop`

``` purescript
stop :: forall eff. BackgroundTokenizer -> Eff (ace :: ACE | eff) Unit
```


#### `getTokens`

``` purescript
getTokens :: forall eff. Number -> BackgroundTokenizer -> Eff (ace :: ACE | eff) [TokenInfo]
```


#### `getState`

``` purescript
getState :: forall eff. Number -> BackgroundTokenizer -> Eff (ace :: ACE | eff) String
```


#### `create`

``` purescript
create :: forall eff. Tokenizer -> Editor -> Eff (ace :: ACE | eff) BackgroundTokenizer
```



## Module Ace.Config

#### `ConfigOption`

``` purescript
newtype ConfigOption a
```


#### `set`

``` purescript
set :: forall a eff. ConfigOption a -> a -> Eff (ace :: ACE | eff) Ace
```


#### `packaged`

``` purescript
packaged :: ConfigOption Boolean
```


#### `workerPath`

``` purescript
workerPath :: ConfigOption String
```


#### `modePath`

``` purescript
modePath :: ConfigOption String
```


#### `themePath`

``` purescript
themePath :: ConfigOption String
```


#### `basePath`

``` purescript
basePath :: ConfigOption String
```


#### `suffix`

``` purescript
suffix :: ConfigOption String
```



## Module Ace.Document

#### `onChange`

``` purescript
onChange :: forall eff a. Document -> (DocumentEvent -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
```


#### `setValue`

``` purescript
setValue :: forall eff. String -> Document -> Eff (ace :: ACE | eff) Unit
```


#### `getValue`

``` purescript
getValue :: forall eff. Document -> Eff (ace :: ACE | eff) String
```


#### `createAnchor`

``` purescript
createAnchor :: forall eff. Number -> Number -> Document -> Eff (ace :: ACE | eff) Anchor
```


#### `getNewLineCharacter`

``` purescript
getNewLineCharacter :: forall eff. Document -> Eff (ace :: ACE | eff) String
```


#### `setNewLineMode`

``` purescript
setNewLineMode :: forall eff. NewlineMode -> Document -> Eff (ace :: ACE | eff) Unit
```


#### `getNewLineMode`

``` purescript
getNewLineMode :: forall eff. Document -> Eff (ace :: ACE | eff) NewlineMode
```


#### `isNewLine`

``` purescript
isNewLine :: forall eff. String -> Document -> Eff (ace :: ACE | eff) Boolean
```


#### `getLine`

``` purescript
getLine :: forall eff. Number -> Document -> Eff (ace :: ACE | eff) String
```


#### `getLines`

``` purescript
getLines :: forall eff. Number -> Number -> Document -> Eff (ace :: ACE | eff) [String]
```


#### `getAllLines`

``` purescript
getAllLines :: forall eff. Document -> Eff (ace :: ACE | eff) [String]
```


#### `getLength`

``` purescript
getLength :: forall eff. Document -> Eff (ace :: ACE | eff) Number
```


#### `getTextRange`

``` purescript
getTextRange :: forall eff. Range -> Document -> Eff (ace :: ACE | eff) String
```


#### `insert`

``` purescript
insert :: forall eff. Position -> String -> Document -> Eff (ace :: ACE | eff) Unit
```


#### `insertNewLine`

``` purescript
insertNewLine :: forall eff. Position -> Document -> Eff (ace :: ACE | eff) Unit
```


#### `insertInLine`

``` purescript
insertInLine :: forall eff. Position -> String -> Document -> Eff (ace :: ACE | eff) Unit
```


#### `remove`

``` purescript
remove :: forall eff. Range -> Document -> Eff (ace :: ACE | eff) Unit
```


#### `removeInLine`

``` purescript
removeInLine :: forall eff. Number -> Number -> Number -> Document -> Eff (ace :: ACE | eff) Unit
```


#### `removeLines`

``` purescript
removeLines :: forall eff. Number -> Number -> Document -> Eff (ace :: ACE | eff) [String]
```


#### `removeNewLine`

``` purescript
removeNewLine :: forall eff. Number -> Document -> Eff (ace :: ACE | eff) Unit
```


#### `replace`

``` purescript
replace :: forall eff. Range -> String -> Document -> Eff (ace :: ACE | eff) Unit
```


#### `indexToPosition`

``` purescript
indexToPosition :: forall eff. Number -> Number -> Document -> Eff (ace :: ACE | eff) Position
```


#### `positionToIndex`

``` purescript
positionToIndex :: forall eff. Position -> Number -> Document -> Eff (ace :: ACE | eff) Number
```


#### `create`

``` purescript
create :: forall eff. Maybe String -> Eff (ace :: ACE | eff) Document
```


#### `createFromLines`

``` purescript
createFromLines :: forall eff. [String] -> Eff (ace :: ACE | eff) Document
```



## Module Ace.EditSession

#### `getBackgroundTokenizer`

``` purescript
getBackgroundTokenizer :: forall eff. EditSession -> Eff (ace :: ACE | eff) BackgroundTokenizer
```


#### `onChange`

``` purescript
onChange :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
```


#### `onChangeAnnotation`

``` purescript
onChangeAnnotation :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
```


#### `onChangeBackMarker`

``` purescript
onChangeBackMarker :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
```


#### `onChangeBreakpoint`

``` purescript
onChangeBreakpoint :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
```


#### `onChangeFold`

``` purescript
onChangeFold :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
```


#### `onChangeFrontMarker`

``` purescript
onChangeFrontMarker :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
```


#### `onChangeMode`

``` purescript
onChangeMode :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
```


#### `onChangeOverwrite`

``` purescript
onChangeOverwrite :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
```


#### `onChangeScrollLeft`

``` purescript
onChangeScrollLeft :: forall eff a. EditSession -> (Number -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
```


#### `onChangeScrollTop`

``` purescript
onChangeScrollTop :: forall eff a. EditSession -> (Number -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
```


#### `onChangeTabSize`

``` purescript
onChangeTabSize :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
```


#### `onChangeWrapLimit`

``` purescript
onChangeWrapLimit :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
```


#### `onChangeWrapMode`

``` purescript
onChangeWrapMode :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
```


#### `onTokenizerUpdate`

``` purescript
onTokenizerUpdate :: forall eff a. EditSession -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
```


#### `findMatchingBracket`

``` purescript
findMatchingBracket :: forall eff. Position -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `addFold`

``` purescript
addFold :: forall eff. String -> Range -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `screenToDocumentColumn`

``` purescript
screenToDocumentColumn :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `highlight`

``` purescript
highlight :: forall eff. String -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `setDocument`

``` purescript
setDocument :: forall eff. Document -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `getDocument`

``` purescript
getDocument :: forall eff. EditSession -> Eff (ace :: ACE | eff) Document
```


#### `resetRowCache`

``` purescript
resetRowCache :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `setValue`

``` purescript
setValue :: forall eff. String -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `setMode`

``` purescript
setMode :: forall eff. String -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `getValue`

``` purescript
getValue :: forall eff. EditSession -> Eff (ace :: ACE | eff) String
```


#### `getSelection`

``` purescript
getSelection :: forall eff. EditSession -> Eff (ace :: ACE | eff) Selection
```


#### `getState`

``` purescript
getState :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) String
```


#### `getTokens`

``` purescript
getTokens :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) [TokenInfo]
```


#### `getTokenAt`

``` purescript
getTokenAt :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) TokenInfo
```


#### `setUndoManager`

``` purescript
setUndoManager :: forall eff. UndoManager -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `getUndoManager`

``` purescript
getUndoManager :: forall eff. EditSession -> Eff (ace :: ACE | eff) UndoManager
```


#### `getTabString`

``` purescript
getTabString :: forall eff. EditSession -> Eff (ace :: ACE | eff) String
```


#### `setUseSoftTabs`

``` purescript
setUseSoftTabs :: forall eff. Boolean -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `getUseSoftTabs`

``` purescript
getUseSoftTabs :: forall eff. EditSession -> Eff (ace :: ACE | eff) Boolean
```


#### `setTabSize`

``` purescript
setTabSize :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `getTabSize`

``` purescript
getTabSize :: forall eff. EditSession -> Eff (ace :: ACE | eff) String
```


#### `isTabStop`

``` purescript
isTabStop :: forall eff. Position -> EditSession -> Eff (ace :: ACE | eff) Boolean
```


#### `setOverwrite`

``` purescript
setOverwrite :: forall eff. Boolean -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `getOverwrite`

``` purescript
getOverwrite :: forall eff. EditSession -> Eff (ace :: ACE | eff) Boolean
```


#### `toggleOverwrite`

``` purescript
toggleOverwrite :: forall eff. EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `addGutterDecoration`

``` purescript
addGutterDecoration :: forall eff. Number -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `removeGutterDecoration`

``` purescript
removeGutterDecoration :: forall eff. Number -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `getBreakpoints`

``` purescript
getBreakpoints :: forall eff. EditSession -> Eff (ace :: ACE | eff) [Number]
```


#### `setBreakpoints`

``` purescript
setBreakpoints :: forall eff. [Number] -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `clearBreakpoints`

``` purescript
clearBreakpoints :: forall eff. EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `setBreakpoint`

``` purescript
setBreakpoint :: forall eff. Number -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `clearBreakpoint`

``` purescript
clearBreakpoint :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `addMarker`

``` purescript
addMarker :: forall eff. Range -> String -> String -> Boolean -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `DynamicMarker`

``` purescript
type DynamicMarker eff a = forall h. STArray h String -> HTMLElement -> Eff (st :: ST h | eff) a
```


#### `addDynamicMarker`

``` purescript
addDynamicMarker :: forall eff a. DynamicMarker (ace :: ACE | eff) a -> Boolean -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `removeMarker`

``` purescript
removeMarker :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `setAnnotations`

``` purescript
setAnnotations :: forall eff. [Annotation] -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `getAnnotations`

``` purescript
getAnnotations :: forall eff. EditSession -> Eff (ace :: ACE | eff) [Annotation]
```


#### `clearAnnotations`

``` purescript
clearAnnotations :: forall eff. EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `detectNewLine`

``` purescript
detectNewLine :: forall eff. String -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `getWordRange`

``` purescript
getWordRange :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Range
```


#### `getAWordRange`

``` purescript
getAWordRange :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Range
```


#### `setNewLineMode`

``` purescript
setNewLineMode :: forall eff. String -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `getNewLineMode`

``` purescript
getNewLineMode :: forall eff. EditSession -> Eff (ace :: ACE | eff) String
```


#### `setUseWorker`

``` purescript
setUseWorker :: forall eff. Boolean -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `getUseWorker`

``` purescript
getUseWorker :: forall eff. EditSession -> Eff (ace :: ACE | eff) Boolean
```


#### `onReloadTokenizer`

``` purescript
onReloadTokenizer :: forall eff. EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `mode`

``` purescript
mode :: forall eff. TextMode -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `getMode`

``` purescript
getMode :: forall eff. EditSession -> Eff (ace :: ACE | eff) TextMode
```


#### `setScrollTop`

``` purescript
setScrollTop :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `getScrollTop`

``` purescript
getScrollTop :: forall eff. EditSession -> Eff (ace :: ACE | eff) Number
```


#### `setScrollLeft`

``` purescript
setScrollLeft :: forall eff. EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `getScrollLeft`

``` purescript
getScrollLeft :: forall eff. EditSession -> Eff (ace :: ACE | eff) Number
```


#### `getScreenWidth`

``` purescript
getScreenWidth :: forall eff. EditSession -> Eff (ace :: ACE | eff) Number
```


#### `getLine`

``` purescript
getLine :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) String
```


#### `getLines`

``` purescript
getLines :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) [String]
```


#### `getLength`

``` purescript
getLength :: forall eff. EditSession -> Eff (ace :: ACE | eff) Number
```


#### `getTextRange`

``` purescript
getTextRange :: forall eff. Range -> EditSession -> Eff (ace :: ACE | eff) String
```


#### `insert`

``` purescript
insert :: forall eff. Position -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `remove`

``` purescript
remove :: forall eff. Range -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `setUndoSelect`

``` purescript
setUndoSelect :: forall eff. Boolean -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `replace`

``` purescript
replace :: forall eff. Range -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `moveText`

``` purescript
moveText :: forall eff. Range -> Position -> EditSession -> Eff (ace :: ACE | eff) Range
```


#### `indentRows`

``` purescript
indentRows :: forall eff. Number -> Number -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `outdentRows`

``` purescript
outdentRows :: forall eff. Range -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `moveLinesUp`

``` purescript
moveLinesUp :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Number
```


#### `moveLinesDown`

``` purescript
moveLinesDown :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Number
```


#### `duplicateLines`

``` purescript
duplicateLines :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Number
```


#### `setUseWrapMode`

``` purescript
setUseWrapMode :: forall eff. Boolean -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `getUseWrapMode`

``` purescript
getUseWrapMode :: forall eff. EditSession -> Eff (ace :: ACE | eff) Boolean
```


#### `setWrapLimitRange`

``` purescript
setWrapLimitRange :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `adjustWrapLimit`

``` purescript
adjustWrapLimit :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) Boolean
```


#### `getWrapLimit`

``` purescript
getWrapLimit :: forall eff. EditSession -> Eff (ace :: ACE | eff) Number
```


#### `getWrapLimitRange`

``` purescript
getWrapLimitRange :: forall eff. EditSession -> Eff (ace :: ACE | eff) { max :: Number, min :: Number }
```


#### `getDisplayTokens`

``` purescript
getDisplayTokens :: forall eff. String -> Number -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `getStringScreenWidth`

``` purescript
getStringScreenWidth :: forall eff. String -> Number -> Number -> EditSession -> Eff (ace :: ACE | eff) [Number]
```


#### `getRowLength`

``` purescript
getRowLength :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) Number
```


#### `getScreenLastRowColumn`

``` purescript
getScreenLastRowColumn :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) Number
```


#### `getDocumentLastRowColumn`

``` purescript
getDocumentLastRowColumn :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Number
```


#### `getDocumentLastRowColumnPosition`

``` purescript
getDocumentLastRowColumnPosition :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Number
```


#### `getRowSplitData`

``` purescript
getRowSplitData :: forall eff. EditSession -> Eff (ace :: ACE | eff) String
```


#### `getScreenTabSize`

``` purescript
getScreenTabSize :: forall eff. Number -> EditSession -> Eff (ace :: ACE | eff) Number
```


#### `screenToDocumentPosition`

``` purescript
screenToDocumentPosition :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Position
```


#### `documentToScreenPosition`

``` purescript
documentToScreenPosition :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Position
```


#### `documentToScreenColumn`

``` purescript
documentToScreenColumn :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Number
```


#### `documentToScreenRow`

``` purescript
documentToScreenRow :: forall eff. Number -> Number -> EditSession -> Eff (ace :: ACE | eff) Unit
```


#### `getScreenLength`

``` purescript
getScreenLength :: forall eff. EditSession -> Eff (ace :: ACE | eff) Number
```


#### `createWithMode`

``` purescript
createWithMode :: forall eff. String -> Maybe TextMode -> Eff (ace :: ACE | eff) EditSession
```


#### `create`

``` purescript
create :: forall eff. String -> Maybe String -> Eff (ace :: ACE | eff) EditSession
```


#### `createFromLines`

``` purescript
createFromLines :: forall eff. [String] -> Maybe String -> Eff (ace :: ACE | eff) EditSession
```



## Module Ace.Editor

#### `onBlur`

``` purescript
onBlur :: forall eff a. Editor -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
```


#### `onFocus`

``` purescript
onFocus :: forall eff a. Editor -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
```


#### `onCopy`

``` purescript
onCopy :: forall eff a. Editor -> (String -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
```


#### `onPaste`

``` purescript
onPaste :: forall eff a. Editor -> (PasteEvent -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
```


#### `getPasteEventText`

``` purescript
getPasteEventText :: forall eff. PasteEvent -> Eff (ace :: ACE | eff) String
```


#### `setPasteEventText`

``` purescript
setPasteEventText :: forall eff. String -> PasteEvent -> Eff (ace :: ACE | eff) Unit
```


#### `onChangeSession`

``` purescript
onChangeSession :: forall eff. Editor -> ({ session :: EditSession, oldSession :: EditSession } -> Eff (ace :: ACE | eff) Unit) -> Eff (ace :: ACE | eff) Unit
```


#### `onChangeSelectionStyle`

``` purescript
onChangeSelectionStyle :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit -> Eff (ace :: ACE | eff) Unit
```


#### `getRenderer`

``` purescript
getRenderer :: forall eff. Editor -> Eff (ace :: ACE | eff) VirtualRenderer
```


#### `isInMultiSelectMode`

``` purescript
isInMultiSelectMode :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean
```


#### `selectMoreLines`

``` purescript
selectMoreLines :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `getContainer`

``` purescript
getContainer :: forall eff. Editor -> Eff (ace :: ACE | eff) HTMLElement
```


#### `setKeyboardHandler`

``` purescript
setKeyboardHandler :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `getKeyboardHandler`

``` purescript
getKeyboardHandler :: forall eff. Editor -> Eff (ace :: ACE | eff) String
```


#### `setSession`

``` purescript
setSession :: forall eff. EditSession -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `getSession`

``` purescript
getSession :: forall eff. Editor -> Eff (ace :: ACE | eff) EditSession
```


#### `setValue`

``` purescript
setValue :: forall eff. String -> Maybe Number -> Editor -> Eff (ace :: ACE | eff) String
```


#### `getValue`

``` purescript
getValue :: forall eff. Editor -> Eff (ace :: ACE | eff) String
```


#### `getSelection`

``` purescript
getSelection :: forall eff. Editor -> Eff (ace :: ACE | eff) Selection
```


#### `resize`

``` purescript
resize :: forall eff. Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `setTheme`

``` purescript
setTheme :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `getTheme`

``` purescript
getTheme :: forall eff. Editor -> Eff (ace :: ACE | eff) String
```


#### `setStyle`

``` purescript
setStyle :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `unsetStyle`

``` purescript
unsetStyle :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `setFontSize`

``` purescript
setFontSize :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `focus`

``` purescript
focus :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `isFocused`

``` purescript
isFocused :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `blur`

``` purescript
blur :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `getCopyText`

``` purescript
getCopyText :: forall eff. Editor -> Eff (ace :: ACE | eff) String
```


#### `insert`

``` purescript
insert :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `setOverwrite`

``` purescript
setOverwrite :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `getOverwrite`

``` purescript
getOverwrite :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean
```


#### `toggleOverwrite`

``` purescript
toggleOverwrite :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `setScrollSpeed`

``` purescript
setScrollSpeed :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `getScrollSpeed`

``` purescript
getScrollSpeed :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
```


#### `setDragDelay`

``` purescript
setDragDelay :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `getDragDelay`

``` purescript
getDragDelay :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
```


#### `setSelectionStyle`

``` purescript
setSelectionStyle :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `getSelectionStyle`

``` purescript
getSelectionStyle :: forall eff. Editor -> Eff (ace :: ACE | eff) String
```


#### `setHighlightActiveLine`

``` purescript
setHighlightActiveLine :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `getHighlightActiveLine`

``` purescript
getHighlightActiveLine :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `setHighlightSelectedWord`

``` purescript
setHighlightSelectedWord :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `getHighlightSelectedWord`

``` purescript
getHighlightSelectedWord :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean
```


#### `setShowInvisibles`

``` purescript
setShowInvisibles :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `getShowInvisibles`

``` purescript
getShowInvisibles :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean
```


#### `setShowPrintMargin`

``` purescript
setShowPrintMargin :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `getShowPrintMargin`

``` purescript
getShowPrintMargin :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean
```


#### `setPrintMarginColumn`

``` purescript
setPrintMarginColumn :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `getPrintMarginColumn`

``` purescript
getPrintMarginColumn :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
```


#### `setReadOnly`

``` purescript
setReadOnly :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `getReadOnly`

``` purescript
getReadOnly :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean
```


#### `setBehavioursEnabled`

``` purescript
setBehavioursEnabled :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `getBehavioursEnabled`

``` purescript
getBehavioursEnabled :: forall eff. Editor -> Eff (ace :: ACE | eff) Boolean
```


#### `setWrapBehavioursEnabled`

``` purescript
setWrapBehavioursEnabled :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `getWrapBehavioursEnabled`

``` purescript
getWrapBehavioursEnabled :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `setShowFoldWidgets`

``` purescript
setShowFoldWidgets :: forall eff. Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `getShowFoldWidgets`

``` purescript
getShowFoldWidgets :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `remove`

``` purescript
remove :: forall eff. String -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `removeWordRight`

``` purescript
removeWordRight :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `removeWordLeft`

``` purescript
removeWordLeft :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `removeToLineStart`

``` purescript
removeToLineStart :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `removeToLineEnd`

``` purescript
removeToLineEnd :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `splitLine`

``` purescript
splitLine :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `transposeLetters`

``` purescript
transposeLetters :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `toLowerCase`

``` purescript
toLowerCase :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `toUpperCase`

``` purescript
toUpperCase :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `indent`

``` purescript
indent :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `blockIndent`

``` purescript
blockIndent :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `blockOutdent`

``` purescript
blockOutdent :: forall eff. Maybe String -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `toggleCommentLines`

``` purescript
toggleCommentLines :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `getNumberAt`

``` purescript
getNumberAt :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
```


#### `modifyNumber`

``` purescript
modifyNumber :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `removeLines`

``` purescript
removeLines :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `moveLinesDown`

``` purescript
moveLinesDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
```


#### `moveLinesUp`

``` purescript
moveLinesUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
```


#### `copyLinesUp`

``` purescript
copyLinesUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
```


#### `copyLinesDown`

``` purescript
copyLinesDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
```


#### `getFirstVisibleRow`

``` purescript
getFirstVisibleRow :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
```


#### `getLastVisibleRow`

``` purescript
getLastVisibleRow :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
```


#### `isRowVisible`

``` purescript
isRowVisible :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Boolean
```


#### `isRowFullyVisible`

``` purescript
isRowFullyVisible :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Boolean
```


#### `selectPageDown`

``` purescript
selectPageDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `selectPageUp`

``` purescript
selectPageUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `gotoPageDown`

``` purescript
gotoPageDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `gotoPageUp`

``` purescript
gotoPageUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `scrollPageDown`

``` purescript
scrollPageDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `scrollPageUp`

``` purescript
scrollPageUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `scrollToRow`

``` purescript
scrollToRow :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `scrollToLine`

``` purescript
scrollToLine :: forall eff. Number -> Boolean -> Boolean -> Eff (ace :: ACE | eff) Unit -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `centerSelection`

``` purescript
centerSelection :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `getCursorPosition`

``` purescript
getCursorPosition :: forall eff. Editor -> Eff (ace :: ACE | eff) Position
```


#### `getCursorPositionScreen`

``` purescript
getCursorPositionScreen :: forall eff. Editor -> Eff (ace :: ACE | eff) Number
```


#### `getSelectionRange`

``` purescript
getSelectionRange :: forall eff. Editor -> Eff (ace :: ACE | eff) Range
```


#### `selectAll`

``` purescript
selectAll :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `clearSelection`

``` purescript
clearSelection :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `moveCursorTo`

``` purescript
moveCursorTo :: forall eff. Number -> Maybe Number -> Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `moveCursorToPosition`

``` purescript
moveCursorToPosition :: forall eff. Position -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `jumpToMatching`

``` purescript
jumpToMatching :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `gotoLine`

``` purescript
gotoLine :: forall eff. Number -> Maybe Number -> Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `navigateTo`

``` purescript
navigateTo :: forall eff. Number -> Number -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `navigateUp`

``` purescript
navigateUp :: forall eff. Maybe Number -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `navigateDown`

``` purescript
navigateDown :: forall eff. Maybe Number -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `navigateLeft`

``` purescript
navigateLeft :: forall eff. Maybe Number -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `navigateRight`

``` purescript
navigateRight :: forall eff. Number -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `navigateLineStart`

``` purescript
navigateLineStart :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `navigateLineEnd`

``` purescript
navigateLineEnd :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `navigateFileEnd`

``` purescript
navigateFileEnd :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `navigateFileStart`

``` purescript
navigateFileStart :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `navigateWordRight`

``` purescript
navigateWordRight :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `navigateWordLeft`

``` purescript
navigateWordLeft :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `replace`

``` purescript
replace :: forall eff. String -> Maybe SearchOptions -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `replaceAll`

``` purescript
replaceAll :: forall eff. String -> Maybe SearchOptions -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `getLastSearchOptions`

``` purescript
getLastSearchOptions :: forall eff. Editor -> Eff (ace :: ACE | eff) SearchOptions
```


#### `find`

``` purescript
find :: forall eff. String -> Maybe SearchOptions -> Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `findNext`

``` purescript
findNext :: forall eff. Maybe SearchOptions -> Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `findPrevious`

``` purescript
findPrevious :: forall eff. Maybe SearchOptions -> Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
```


#### `undo`

``` purescript
undo :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `redo`

``` purescript
redo :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `destroy`

``` purescript
destroy :: forall eff. Editor -> Eff (ace :: ACE | eff) Unit
```


#### `create`

``` purescript
create :: forall eff. VirtualRenderer -> Maybe EditSession -> Eff (ace :: ACE | eff) Editor
```



## Module Ace.Range

#### `getStartColumn`

``` purescript
getStartColumn :: forall eff. Range -> Eff (ace :: ACE | eff) Number
```


#### `getEndRow`

``` purescript
getEndRow :: forall eff. Range -> Eff (ace :: ACE | eff) Number
```


#### `getEnd`

``` purescript
getEnd :: forall eff. Range -> Eff (ace :: ACE | eff) Position
```


#### `isEmpty`

``` purescript
isEmpty :: forall eff. Range -> Eff (ace :: ACE | eff) Boolean
```


#### `isEqual`

``` purescript
isEqual :: forall eff. Range -> Range -> Eff (ace :: ACE | eff) Unit
```


#### `toString`

``` purescript
toString :: forall eff. Range -> Eff (ace :: ACE | eff) Unit
```


#### `contains`

``` purescript
contains :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Boolean
```


#### `compareRange`

``` purescript
compareRange :: forall eff. Range -> Range -> Eff (ace :: ACE | eff) Number
```


#### `comparePoint`

``` purescript
comparePoint :: forall eff. Range -> Range -> Eff (ace :: ACE | eff) Number
```


#### `containsRange`

``` purescript
containsRange :: forall eff. Range -> Range -> Eff (ace :: ACE | eff) Boolean
```


#### `intersects`

``` purescript
intersects :: forall eff. Range -> Range -> Eff (ace :: ACE | eff) Boolean
```


#### `isEnd`

``` purescript
isEnd :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Boolean
```


#### `isStart`

``` purescript
isStart :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Boolean
```


#### `setStart`

``` purescript
setStart :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Unit
```


#### `setEnd`

``` purescript
setEnd :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Unit
```


#### `inside`

``` purescript
inside :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Boolean
```


#### `insideStart`

``` purescript
insideStart :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Boolean
```


#### `insideEnd`

``` purescript
insideEnd :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Boolean
```


#### `compare`

``` purescript
compare :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Number
```


#### `compareStart`

``` purescript
compareStart :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Number
```


#### `compareEnd`

``` purescript
compareEnd :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Number
```


#### `compareInside`

``` purescript
compareInside :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Number
```


#### `clipRows`

``` purescript
clipRows :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Range
```


#### `extend`

``` purescript
extend :: forall eff. Number -> Number -> Range -> Eff (ace :: ACE | eff) Range
```


#### `isMultiLine`

``` purescript
isMultiLine :: forall eff. Range -> Eff (ace :: ACE | eff) Boolean
```


#### `clone`

``` purescript
clone :: forall eff. Range -> Eff (ace :: ACE | eff) Range
```


#### `collapseRows`

``` purescript
collapseRows :: forall eff. Range -> Eff (ace :: ACE | eff) Range
```


#### `toScreenRange`

``` purescript
toScreenRange :: forall eff. EditSession -> Range -> Eff (ace :: ACE | eff) Range
```


#### `fromPoints`

``` purescript
fromPoints :: forall eff. Range -> Range -> Eff (ace :: ACE | eff) Range
```


#### `create`

``` purescript
create :: forall eff. Number -> Number -> Number -> Number -> Eff (ace :: ACE | eff) Range
```



## Module Ace.ScrollBar

#### `onScroll`

``` purescript
onScroll :: forall eff a. ScrollBar -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
```


#### `getWidth`

``` purescript
getWidth :: forall eff. ScrollBar -> Eff (ace :: ACE | eff) Number
```


#### `setHeight`

``` purescript
setHeight :: forall eff. Number -> ScrollBar -> Eff (ace :: ACE | eff) Unit
```


#### `setInnerHeight`

``` purescript
setInnerHeight :: forall eff. Number -> ScrollBar -> Eff (ace :: ACE | eff) Unit
```


#### `setScrollTop`

``` purescript
setScrollTop :: forall eff. Number -> ScrollBar -> Eff (ace :: ACE | eff) Unit
```


#### `create`

``` purescript
create :: forall eff. HTMLElement -> VirtualRenderer -> Eff (ace :: ACE | eff) ScrollBar
```



## Module Ace.Search

#### `set`

``` purescript
set :: forall eff. SearchOptions -> Search -> Eff (ace :: ACE | eff) Search
```


#### `find`

``` purescript
find :: forall eff. EditSession -> Search -> Eff (ace :: ACE | eff) Range
```


#### `findAll`

``` purescript
findAll :: forall eff. EditSession -> Search -> Eff (ace :: ACE | eff) [Range]
```


#### `replace`

``` purescript
replace :: forall eff. String -> String -> Search -> Eff (ace :: ACE | eff) String
```


#### `create`

``` purescript
create :: forall eff. Eff (ace :: ACE | eff) Search
```



## Module Ace.Selection

#### `onChangeCursor`

``` purescript
onChangeCursor :: forall eff a. Selection -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
```


#### `onChangeSelection`

``` purescript
onChangeSelection :: forall eff a. Selection -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
```


#### `moveCursorWordLeft`

``` purescript
moveCursorWordLeft :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `moveCursorWordRight`

``` purescript
moveCursorWordRight :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `fromOrientedRange`

``` purescript
fromOrientedRange :: forall eff. Range -> Selection -> Eff (ace :: ACE | eff) Unit
```


#### `setSelectionRange`

``` purescript
setSelectionRange :: forall eff. Range -> Selection -> Eff (ace :: ACE | eff) Unit
```


#### `getAllRanges`

``` purescript
getAllRanges :: forall eff. Selection -> Eff (ace :: ACE | eff) [Range]
```


#### `addRange`

``` purescript
addRange :: forall eff. Range -> Selection -> Eff (ace :: ACE | eff) Unit
```


#### `isEmpty`

``` purescript
isEmpty :: forall eff. Selection -> Eff (ace :: ACE | eff) Boolean
```


#### `isMultiLine`

``` purescript
isMultiLine :: forall eff. Selection -> Eff (ace :: ACE | eff) Boolean
```


#### `getCursor`

``` purescript
getCursor :: forall eff. Selection -> Eff (ace :: ACE | eff) Position
```


#### `setSelectionAnchor`

``` purescript
setSelectionAnchor :: forall eff. Number -> Number -> Selection -> Eff (ace :: ACE | eff) Unit
```


#### `getSelectionAnchor`

``` purescript
getSelectionAnchor :: forall eff. Selection -> Eff (ace :: ACE | eff) Position
```


#### `getSelectionLead`

``` purescript
getSelectionLead :: forall eff. Selection -> Eff (ace :: ACE | eff) Position
```


#### `shiftSelection`

``` purescript
shiftSelection :: forall eff. Number -> Selection -> Eff (ace :: ACE | eff) Unit
```


#### `isBackwards`

``` purescript
isBackwards :: forall eff. Selection -> Eff (ace :: ACE | eff) Boolean
```


#### `getRange`

``` purescript
getRange :: forall eff. Selection -> Eff (ace :: ACE | eff) Range
```


#### `clearSelection`

``` purescript
clearSelection :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `selectAll`

``` purescript
selectAll :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `setRange`

``` purescript
setRange :: forall eff. Range -> Boolean -> Selection -> Eff (ace :: ACE | eff) Unit
```


#### `selectTo`

``` purescript
selectTo :: forall eff. Number -> Number -> Selection -> Eff (ace :: ACE | eff) Unit
```


#### `selectToPosition`

``` purescript
selectToPosition :: forall eff. Position -> Selection -> Eff (ace :: ACE | eff) Unit
```


#### `selectUp`

``` purescript
selectUp :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `selectDown`

``` purescript
selectDown :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `selectRight`

``` purescript
selectRight :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `selectLeft`

``` purescript
selectLeft :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `selectLineStart`

``` purescript
selectLineStart :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `selectLineEnd`

``` purescript
selectLineEnd :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `selectFileEnd`

``` purescript
selectFileEnd :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `selectFileStart`

``` purescript
selectFileStart :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `selectWordRight`

``` purescript
selectWordRight :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `selectWordLeft`

``` purescript
selectWordLeft :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `getWordRange`

``` purescript
getWordRange :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `selectWord`

``` purescript
selectWord :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `selectAWord`

``` purescript
selectAWord :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `selectLine`

``` purescript
selectLine :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `moveCursorUp`

``` purescript
moveCursorUp :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `moveCursorDown`

``` purescript
moveCursorDown :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `moveCursorLeft`

``` purescript
moveCursorLeft :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `moveCursorRight`

``` purescript
moveCursorRight :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `moveCursorLineStart`

``` purescript
moveCursorLineStart :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `moveCursorLineEnd`

``` purescript
moveCursorLineEnd :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `moveCursorFileEnd`

``` purescript
moveCursorFileEnd :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `moveCursorFileStart`

``` purescript
moveCursorFileStart :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `moveCursorLongWordRight`

``` purescript
moveCursorLongWordRight :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `moveCursorLongWordLeft`

``` purescript
moveCursorLongWordLeft :: forall eff. Selection -> Eff (ace :: ACE | eff) Unit
```


#### `moveCursorBy`

``` purescript
moveCursorBy :: forall eff. Number -> Number -> Selection -> Eff (ace :: ACE | eff) Unit
```


#### `moveCursorToPosition`

``` purescript
moveCursorToPosition :: forall eff. Position -> Selection -> Eff (ace :: ACE | eff) Unit
```


#### `moveCursorTo`

``` purescript
moveCursorTo :: forall eff. Number -> Number -> Maybe Boolean -> Selection -> Eff (ace :: ACE | eff) Unit
```


#### `moveCursorToScreen`

``` purescript
moveCursorToScreen :: forall eff. Number -> Number -> Boolean -> Selection -> Eff (ace :: ACE | eff) Unit
```


#### `create`

``` purescript
create :: forall eff. EditSession -> Eff (ace :: ACE | eff) Selection
```



## Module Ace.TokenIterator

#### `stepBackward`

``` purescript
stepBackward :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) [String]
```


#### `stepForward`

``` purescript
stepForward :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) String
```


#### `getCurrentToken`

``` purescript
getCurrentToken :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) TokenInfo
```


#### `getCurrentTokenRow`

``` purescript
getCurrentTokenRow :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) Number
```


#### `getCurrentTokenColumn`

``` purescript
getCurrentTokenColumn :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) Number
```


#### `create`

``` purescript
create :: forall eff. EditSession -> Number -> Number -> Eff (ace :: ACE | eff) TokenIterator
```



## Module Ace.Tokenizer

#### `getLineTokens`

``` purescript
getLineTokens :: forall eff. Tokenizer -> Eff (ace :: ACE | eff) { state :: String, tokens :: [TokenInfo] }
```


#### `create`

``` purescript
create :: forall eff. Rules -> String -> Eff (ace :: ACE | eff) Tokenizer
```



## Module Ace.Types

#### `AnchorEvent`

``` purescript
type AnchorEvent = { value :: Position, old :: Position }
```


#### `BackgroundTokenizerEvent`

``` purescript
data BackgroundTokenizerEvent
```


#### `DocumentEventType`

``` purescript
data DocumentEventType
  = InsertLines 
  | InsertText 
  | RemoveLines 
  | RemoveText 
```


#### `showDocumentEventType`

``` purescript
showDocumentEventType :: DocumentEventType -> String
```


#### `readDocumentEventType`

``` purescript
readDocumentEventType :: String -> DocumentEventType
```


#### `DocumentEvent`

``` purescript
data DocumentEvent
  = DocumentEvent DocumentEventType Range (Maybe [String]) (Maybe String) (Maybe String)
```


#### `documentEventIsForeign`

``` purescript
instance documentEventIsForeign :: IsForeign DocumentEvent
```


#### `PasteEvent`

``` purescript
data PasteEvent
```


#### `NewlineMode`

``` purescript
data NewlineMode
  = Windows 
  | Unix 
  | Auto 
```


#### `showNewlineMode`

``` purescript
showNewlineMode :: NewlineMode -> String
```


#### `readNewlineMode`

``` purescript
readNewlineMode :: String -> NewlineMode
```


#### `Rules`

``` purescript
data Rules
```


#### `Annotation`

``` purescript
type Annotation = { "type" :: String, text :: String, column :: Number, row :: Number }
```


#### `Position`

``` purescript
type Position = { column :: Number, row :: Number }
```


#### `TokenInfo`

``` purescript
type TokenInfo = { value :: String }
```


#### `SearchOptions`

``` purescript
type SearchOptions = { skipCurrent :: Boolean, regExp :: Boolean, wholeWord :: Boolean, caseSensitive :: Boolean, wrap :: Boolean, backwards :: Boolean, needle :: String }
```


#### `ACE`

``` purescript
data ACE :: !
```


#### `Ace`

``` purescript
data Ace
```


#### `Anchor`

``` purescript
data Anchor
```


#### `BackgroundTokenizer`

``` purescript
data BackgroundTokenizer
```


#### `Document`

``` purescript
data Document
```


#### `Editor`

``` purescript
data Editor
```


#### `EditSession`

``` purescript
data EditSession
```


#### `Range`

``` purescript
data Range
```


#### `RangeList`

``` purescript
data RangeList
```


#### `ScrollBar`

``` purescript
data ScrollBar
```


#### `Search`

``` purescript
data Search
```


#### `Selection`

``` purescript
data Selection
```


#### `TextMode`

``` purescript
newtype TextMode
  = TextMode String
```


#### `TokenIterator`

``` purescript
data TokenIterator
```


#### `Tokenizer`

``` purescript
data Tokenizer
```


#### `UndoManager`

``` purescript
data UndoManager
```


#### `VirtualRenderer`

``` purescript
data VirtualRenderer
```



## Module Ace.UndoManager

#### `undo`

``` purescript
undo :: forall eff. Maybe Boolean -> UndoManager -> Eff (ace :: ACE | eff) Range
```


#### `redo`

``` purescript
redo :: forall eff. Boolean -> UndoManager -> Eff (ace :: ACE | eff) Unit
```


#### `reset`

``` purescript
reset :: forall eff. UndoManager -> Eff (ace :: ACE | eff) Unit
```


#### `hasUndo`

``` purescript
hasUndo :: forall eff. UndoManager -> Eff (ace :: ACE | eff) Boolean
```


#### `hasRedo`

``` purescript
hasRedo :: forall eff. UndoManager -> Eff (ace :: ACE | eff) Boolean
```


#### `create`

``` purescript
create :: forall eff. Eff (ace :: ACE | eff) UndoManager
```



## Module Ace.VirtualRenderer

#### `getCharacterWidth`

``` purescript
getCharacterWidth :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Number
```


#### `screenToTextCoordinates`

``` purescript
screenToTextCoordinates :: forall eff. Number -> Number -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `setSession`

``` purescript
setSession :: forall eff. EditSession -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `updateLines`

``` purescript
updateLines :: forall eff. Number -> Number -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `updateText`

``` purescript
updateText :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `updateFull`

``` purescript
updateFull :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `updateFontSize`

``` purescript
updateFontSize :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `onResize`

``` purescript
onResize :: forall eff. Boolean -> Number -> Number -> Number -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `adjustWrapLimit`

``` purescript
adjustWrapLimit :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `setAnimatedScroll`

``` purescript
setAnimatedScroll :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `getAnimatedScroll`

``` purescript
getAnimatedScroll :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean
```


#### `setShowInvisibles`

``` purescript
setShowInvisibles :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `getShowInvisibles`

``` purescript
getShowInvisibles :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean
```


#### `setShowPrintMargin`

``` purescript
setShowPrintMargin :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `getShowPrintMargin`

``` purescript
getShowPrintMargin :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean
```


#### `setPrintMarginColumn`

``` purescript
setPrintMarginColumn :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `getPrintMarginColumn`

``` purescript
getPrintMarginColumn :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean
```


#### `getShowGutter`

``` purescript
getShowGutter :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean
```


#### `setShowGutter`

``` purescript
setShowGutter :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `getContainerElement`

``` purescript
getContainerElement :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) HTMLElement
```


#### `getMouseEventTarget`

``` purescript
getMouseEventTarget :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) HTMLElement
```


#### `getTextAreaContainer`

``` purescript
getTextAreaContainer :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) HTMLElement
```


#### `getFirstVisibleRow`

``` purescript
getFirstVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Number
```


#### `getFirstFullyVisibleRow`

``` purescript
getFirstFullyVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Number
```


#### `getLastFullyVisibleRow`

``` purescript
getLastFullyVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Number
```


#### `getLastVisibleRow`

``` purescript
getLastVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Number
```


#### `setPadding`

``` purescript
setPadding :: forall eff. Number -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `getHScrollBarAlwaysVisible`

``` purescript
getHScrollBarAlwaysVisible :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean
```


#### `setHScrollBarAlwaysVisible`

``` purescript
setHScrollBarAlwaysVisible :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `updateFrontMarkers`

``` purescript
updateFrontMarkers :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `updateBackMarkers`

``` purescript
updateBackMarkers :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `addGutterDecoration`

``` purescript
addGutterDecoration :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `removeGutterDecoration`

``` purescript
removeGutterDecoration :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `updateBreakpoints`

``` purescript
updateBreakpoints :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `setAnnotations`

``` purescript
setAnnotations :: forall eff. [Annotation] -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `updateCursor`

``` purescript
updateCursor :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `hideCursor`

``` purescript
hideCursor :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `showCursor`

``` purescript
showCursor :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `scrollCursorIntoView`

``` purescript
scrollCursorIntoView :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `getScrollTop`

``` purescript
getScrollTop :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Number
```


#### `getScrollLeft`

``` purescript
getScrollLeft :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Number
```


#### `getScrollTopRow`

``` purescript
getScrollTopRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Number
```


#### `getScrollBottomRow`

``` purescript
getScrollBottomRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Number
```


#### `scrollToRow`

``` purescript
scrollToRow :: forall eff. Number -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `scrollToLine`

``` purescript
scrollToLine :: forall eff. Number -> Boolean -> Boolean -> Eff (ace :: ACE | eff) Unit -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `scrollToY`

``` purescript
scrollToY :: forall eff. Number -> VirtualRenderer -> Eff (ace :: ACE | eff) Number
```


#### `scrollToX`

``` purescript
scrollToX :: forall eff. Number -> VirtualRenderer -> Eff (ace :: ACE | eff) Number
```


#### `scrollBy`

``` purescript
scrollBy :: forall eff. Number -> Number -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `isScrollableBy`

``` purescript
isScrollableBy :: forall eff. Number -> Number -> VirtualRenderer -> Eff (ace :: ACE | eff) Boolean
```


#### `textToScreenCoordinates`

``` purescript
textToScreenCoordinates :: forall eff. Number -> Number -> VirtualRenderer -> Eff (ace :: ACE | eff) Position
```


#### `visualizeFocus`

``` purescript
visualizeFocus :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `visualizeBlur`

``` purescript
visualizeBlur :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `showComposition`

``` purescript
showComposition :: forall eff. Number -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `setCompositionText`

``` purescript
setCompositionText :: forall eff. String -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `hideComposition`

``` purescript
hideComposition :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `setTheme`

``` purescript
setTheme :: forall eff. String -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `getTheme`

``` purescript
getTheme :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) String
```


#### `setStyle`

``` purescript
setStyle :: forall eff. String -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `unsetStyle`

``` purescript
unsetStyle :: forall eff. String -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `destroy`

``` purescript
destroy :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```


#### `create`

``` purescript
create :: forall eff. HTMLElement -> Maybe String -> Eff (ace :: ACE | eff) VirtualRenderer
```




