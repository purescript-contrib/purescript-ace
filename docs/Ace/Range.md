## Module Ace.Range

#### `getStartColumn`

``` purescript
getStartColumn :: forall eff. Range -> Eff (ace :: ACE | eff) Int
```

#### `getEndRow`

``` purescript
getEndRow :: forall eff. Range -> Eff (ace :: ACE | eff) Int
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
contains :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Boolean
```

#### `compareRange`

``` purescript
compareRange :: forall eff. Range -> Range -> Eff (ace :: ACE | eff) Int
```

#### `comparePoint`

``` purescript
comparePoint :: forall eff. Range -> Range -> Eff (ace :: ACE | eff) Int
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
isEnd :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Boolean
```

#### `isStart`

``` purescript
isStart :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Boolean
```

#### `setStart`

``` purescript
setStart :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Unit
```

#### `setEnd`

``` purescript
setEnd :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Unit
```

#### `inside`

``` purescript
inside :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Boolean
```

#### `insideStart`

``` purescript
insideStart :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Boolean
```

#### `insideEnd`

``` purescript
insideEnd :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Boolean
```

#### `compare`

``` purescript
compare :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Int
```

#### `compareStart`

``` purescript
compareStart :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Int
```

#### `compareEnd`

``` purescript
compareEnd :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Int
```

#### `compareInside`

``` purescript
compareInside :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Int
```

#### `clipRows`

``` purescript
clipRows :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Range
```

#### `extend`

``` purescript
extend :: forall eff. Int -> Int -> Range -> Eff (ace :: ACE | eff) Range
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
create :: forall eff. Int -> Int -> Int -> Int -> Eff (ace :: ACE | eff) Range
```


