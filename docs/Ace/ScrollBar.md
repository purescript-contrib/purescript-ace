## Module Ace.ScrollBar

#### `onScroll`

``` purescript
onScroll :: forall eff a. ScrollBar -> Eff (ace :: ACE | eff) a -> Eff (ace :: ACE | eff) Unit
```

#### `getWidth`

``` purescript
getWidth :: forall eff. ScrollBar -> Eff (ace :: ACE | eff) Int
```

#### `setHeight`

``` purescript
setHeight :: forall eff. Int -> ScrollBar -> Eff (ace :: ACE | eff) Unit
```

#### `setInnerHeight`

``` purescript
setInnerHeight :: forall eff. Int -> ScrollBar -> Eff (ace :: ACE | eff) Unit
```

#### `setScrollTop`

``` purescript
setScrollTop :: forall eff. Int -> ScrollBar -> Eff (ace :: ACE | eff) Unit
```

#### `create`

``` purescript
create :: forall eff. HTMLElement -> VirtualRenderer -> Eff (ace :: ACE | eff) ScrollBar
```


