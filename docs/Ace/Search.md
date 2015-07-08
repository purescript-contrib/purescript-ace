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
findAll :: forall eff. EditSession -> Search -> Eff (ace :: ACE | eff) (Array Range)
```

#### `replace`

``` purescript
replace :: forall eff. String -> String -> Search -> Eff (ace :: ACE | eff) String
```

#### `create`

``` purescript
create :: forall eff. Eff (ace :: ACE | eff) Search
```


