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
onChangeSession :: forall eff. Editor -> ({ oldSession :: EditSession, session :: EditSession } -> Eff (ace :: ACE | eff) Unit) -> Eff (ace :: ACE | eff) Unit
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
selectMoreLines :: forall eff. Int -> Editor -> Eff (ace :: ACE | eff) Unit
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
setValue :: forall eff. String -> Maybe Int -> Editor -> Eff (ace :: ACE | eff) String
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
setPrintMarginColumn :: forall eff. Int -> Editor -> Eff (ace :: ACE | eff) Unit
```

#### `getPrintMarginColumn`

``` purescript
getPrintMarginColumn :: forall eff. Editor -> Eff (ace :: ACE | eff) Int
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
moveLinesDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Int
```

#### `moveLinesUp`

``` purescript
moveLinesUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Int
```

#### `copyLinesUp`

``` purescript
copyLinesUp :: forall eff. Editor -> Eff (ace :: ACE | eff) Int
```

#### `copyLinesDown`

``` purescript
copyLinesDown :: forall eff. Editor -> Eff (ace :: ACE | eff) Int
```

#### `getFirstVisibleRow`

``` purescript
getFirstVisibleRow :: forall eff. Editor -> Eff (ace :: ACE | eff) Int
```

#### `getLastVisibleRow`

``` purescript
getLastVisibleRow :: forall eff. Editor -> Eff (ace :: ACE | eff) Int
```

#### `isRowVisible`

``` purescript
isRowVisible :: forall eff. Int -> Editor -> Eff (ace :: ACE | eff) Boolean
```

#### `isRowFullyVisible`

``` purescript
isRowFullyVisible :: forall eff. Int -> Editor -> Eff (ace :: ACE | eff) Boolean
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
scrollToLine :: forall eff. Int -> Boolean -> Boolean -> Eff (ace :: ACE | eff) Unit -> Editor -> Eff (ace :: ACE | eff) Unit
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
getCursorPositionScreen :: forall eff. Editor -> Eff (ace :: ACE | eff) Int
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
moveCursorTo :: forall eff. Int -> Maybe Int -> Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
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
gotoLine :: forall eff. Int -> Maybe Int -> Maybe Boolean -> Editor -> Eff (ace :: ACE | eff) Unit
```

#### `navigateTo`

``` purescript
navigateTo :: forall eff. Int -> Int -> Editor -> Eff (ace :: ACE | eff) Unit
```

#### `navigateUp`

``` purescript
navigateUp :: forall eff. Maybe Int -> Editor -> Eff (ace :: ACE | eff) Unit
```

#### `navigateDown`

``` purescript
navigateDown :: forall eff. Maybe Int -> Editor -> Eff (ace :: ACE | eff) Unit
```

#### `navigateLeft`

``` purescript
navigateLeft :: forall eff. Maybe Int -> Editor -> Eff (ace :: ACE | eff) Unit
```

#### `navigateRight`

``` purescript
navigateRight :: forall eff. Int -> Editor -> Eff (ace :: ACE | eff) Unit
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


