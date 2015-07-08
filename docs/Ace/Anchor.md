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
setPosition :: forall eff. Int -> Int -> Boolean -> Anchor -> Eff (ace :: ACE | eff) Unit
```

#### `detach`

``` purescript
detach :: forall eff. Anchor -> Eff (ace :: ACE | eff) Unit
```

#### `create`

``` purescript
create :: forall eff. Document -> Int -> Int -> Eff (ace :: ACE | eff) Anchor
```


