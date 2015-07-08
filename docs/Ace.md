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


