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
onChangeScrollLeft :: forall eff a. EditSession -> (Int -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
```

#### `onChangeScrollTop`

``` purescript
onChangeScrollTop :: forall eff a. EditSession -> (Int -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
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
screenToDocumentColumn :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Unit
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
resetRowCache :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) Unit
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
getState :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) String
```

#### `getTokens`

``` purescript
getTokens :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) (Array TokenInfo)
```

#### `getTokenAt`

``` purescript
getTokenAt :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) TokenInfo
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
setTabSize :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) Unit
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
addGutterDecoration :: forall eff. Int -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
```

#### `removeGutterDecoration`

``` purescript
removeGutterDecoration :: forall eff. Int -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
```

#### `getBreakpoints`

``` purescript
getBreakpoints :: forall eff. EditSession -> Eff (ace :: ACE | eff) (Array Int)
```

#### `setBreakpoints`

``` purescript
setBreakpoints :: forall eff. Array Int -> EditSession -> Eff (ace :: ACE | eff) Unit
```

#### `clearBreakpoints`

``` purescript
clearBreakpoints :: forall eff. EditSession -> Eff (ace :: ACE | eff) Unit
```

#### `setBreakpoint`

``` purescript
setBreakpoint :: forall eff. Int -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
```

#### `clearBreakpoint`

``` purescript
clearBreakpoint :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) Unit
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
removeMarker :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) Unit
```

#### `setAnnotations`

``` purescript
setAnnotations :: forall eff. Array Annotation -> EditSession -> Eff (ace :: ACE | eff) Unit
```

#### `getAnnotations`

``` purescript
getAnnotations :: forall eff. EditSession -> Eff (ace :: ACE | eff) (Array Annotation)
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
getWordRange :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Range
```

#### `getAWordRange`

``` purescript
getAWordRange :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Range
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
setScrollTop :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) Unit
```

#### `getScrollTop`

``` purescript
getScrollTop :: forall eff. EditSession -> Eff (ace :: ACE | eff) Int
```

#### `setScrollLeft`

``` purescript
setScrollLeft :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) Unit
```

#### `getScrollLeft`

``` purescript
getScrollLeft :: forall eff. EditSession -> Eff (ace :: ACE | eff) Int
```

#### `getScreenWidth`

``` purescript
getScreenWidth :: forall eff. EditSession -> Eff (ace :: ACE | eff) Int
```

#### `getLine`

``` purescript
getLine :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) String
```

#### `getLines`

``` purescript
getLines :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) (Array String)
```

#### `getLength`

``` purescript
getLength :: forall eff. EditSession -> Eff (ace :: ACE | eff) Int
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
indentRows :: forall eff. Int -> Int -> String -> EditSession -> Eff (ace :: ACE | eff) Unit
```

#### `outdentRows`

``` purescript
outdentRows :: forall eff. Range -> EditSession -> Eff (ace :: ACE | eff) Unit
```

#### `moveLinesUp`

``` purescript
moveLinesUp :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Int
```

#### `moveLinesDown`

``` purescript
moveLinesDown :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Int
```

#### `duplicateLines`

``` purescript
duplicateLines :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Int
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
setWrapLimitRange :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Unit
```

#### `adjustWrapLimit`

``` purescript
adjustWrapLimit :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) Boolean
```

#### `getWrapLimit`

``` purescript
getWrapLimit :: forall eff. EditSession -> Eff (ace :: ACE | eff) Int
```

#### `getWrapLimitRange`

``` purescript
getWrapLimitRange :: forall eff. EditSession -> Eff (ace :: ACE | eff) { min :: Int, max :: Int }
```

#### `getDisplayTokens`

``` purescript
getDisplayTokens :: forall eff. String -> Int -> EditSession -> Eff (ace :: ACE | eff) Unit
```

#### `getStringScreenWidth`

``` purescript
getStringScreenWidth :: forall eff. String -> Int -> Int -> EditSession -> Eff (ace :: ACE | eff) (Array Int)
```

#### `getRowLength`

``` purescript
getRowLength :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) Int
```

#### `getScreenLastRowColumn`

``` purescript
getScreenLastRowColumn :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) Int
```

#### `getDocumentLastRowColumn`

``` purescript
getDocumentLastRowColumn :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Int
```

#### `getDocumentLastRowColumnPosition`

``` purescript
getDocumentLastRowColumnPosition :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Int
```

#### `getRowSplitData`

``` purescript
getRowSplitData :: forall eff. EditSession -> Eff (ace :: ACE | eff) String
```

#### `getScreenTabSize`

``` purescript
getScreenTabSize :: forall eff. Int -> EditSession -> Eff (ace :: ACE | eff) Int
```

#### `screenToDocumentPosition`

``` purescript
screenToDocumentPosition :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Position
```

#### `documentToScreenPosition`

``` purescript
documentToScreenPosition :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Position
```

#### `documentToScreenColumn`

``` purescript
documentToScreenColumn :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Int
```

#### `documentToScreenRow`

``` purescript
documentToScreenRow :: forall eff. Int -> Int -> EditSession -> Eff (ace :: ACE | eff) Unit
```

#### `getScreenLength`

``` purescript
getScreenLength :: forall eff. EditSession -> Eff (ace :: ACE | eff) Int
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
createFromLines :: forall eff. Array String -> Maybe String -> Eff (ace :: ACE | eff) EditSession
```


