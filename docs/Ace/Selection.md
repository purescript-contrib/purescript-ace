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
getAllRanges :: forall eff. Selection -> Eff (ace :: ACE | eff) (Array Range)
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
setSelectionAnchor :: forall eff. Int -> Int -> Selection -> Eff (ace :: ACE | eff) Unit
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
shiftSelection :: forall eff. Int -> Selection -> Eff (ace :: ACE | eff) Unit
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
selectTo :: forall eff. Int -> Int -> Selection -> Eff (ace :: ACE | eff) Unit
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
moveCursorBy :: forall eff. Int -> Int -> Selection -> Eff (ace :: ACE | eff) Unit
```

#### `moveCursorToPosition`

``` purescript
moveCursorToPosition :: forall eff. Position -> Selection -> Eff (ace :: ACE | eff) Unit
```

#### `moveCursorTo`

``` purescript
moveCursorTo :: forall eff. Int -> Int -> Maybe Boolean -> Selection -> Eff (ace :: ACE | eff) Unit
```

#### `moveCursorToScreen`

``` purescript
moveCursorToScreen :: forall eff. Int -> Int -> Boolean -> Selection -> Eff (ace :: ACE | eff) Unit
```

#### `create`

``` purescript
create :: forall eff. EditSession -> Eff (ace :: ACE | eff) Selection
```


