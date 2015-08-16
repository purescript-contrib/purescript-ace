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
createAnchor :: forall eff. Int -> Int -> Document -> Eff (ace :: ACE | eff) Anchor
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
getNewLineMode :: forall eff. Document -> Eff (ace :: ACE | eff) String
```

#### `isNewLine`

``` purescript
isNewLine :: forall eff. String -> Document -> Eff (ace :: ACE | eff) Boolean
```

#### `getLine`

``` purescript
getLine :: forall eff. Int -> Document -> Eff (ace :: ACE | eff) String
```

#### `getLines`

``` purescript
getLines :: forall eff. Int -> Int -> Document -> Eff (ace :: ACE | eff) (Array String)
```

#### `getAllLines`

``` purescript
getAllLines :: forall eff. Document -> Eff (ace :: ACE | eff) (Array String)
```

#### `getLength`

``` purescript
getLength :: forall eff. Document -> Eff (ace :: ACE | eff) Int
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
removeInLine :: forall eff. Int -> Int -> Int -> Document -> Eff (ace :: ACE | eff) Unit
```

#### `removeLines`

``` purescript
removeLines :: forall eff. Int -> Int -> Document -> Eff (ace :: ACE | eff) (Array String)
```

#### `removeNewLine`

``` purescript
removeNewLine :: forall eff. Int -> Document -> Eff (ace :: ACE | eff) Unit
```

#### `replace`

``` purescript
replace :: forall eff. Range -> String -> Document -> Eff (ace :: ACE | eff) Unit
```

#### `indexToPosition`

``` purescript
indexToPosition :: forall eff. Int -> Int -> Document -> Eff (ace :: ACE | eff) Position
```

#### `positionToIndex`

``` purescript
positionToIndex :: forall eff. Position -> Int -> Document -> Eff (ace :: ACE | eff) Int
```

#### `create`

``` purescript
create :: forall eff. Nullable String -> Eff (ace :: ACE | eff) Document
```

#### `createFromLines`

``` purescript
createFromLines :: forall eff. Array String -> Eff (ace :: ACE | eff) Document
```


