## Module Ace.TokenIterator

#### `stepBackward`

``` purescript
stepBackward :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) (Array String)
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
getCurrentTokenRow :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) Int
```

#### `getCurrentTokenColumn`

``` purescript
getCurrentTokenColumn :: forall eff. TokenIterator -> Eff (ace :: ACE | eff) Int
```

#### `create`

``` purescript
create :: forall eff. EditSession -> Int -> Int -> Eff (ace :: ACE | eff) TokenIterator
```


