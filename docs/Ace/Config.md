## Module Ace.Config

#### `ConfigOption`

``` purescript
newtype ConfigOption a
```

#### `set`

``` purescript
set :: forall a eff. ConfigOption a -> a -> Eff (ace :: ACE | eff) Ace
```

#### `packaged`

``` purescript
packaged :: ConfigOption Boolean
```

#### `workerPath`

``` purescript
workerPath :: ConfigOption String
```

#### `modePath`

``` purescript
modePath :: ConfigOption String
```

#### `themePath`

``` purescript
themePath :: ConfigOption String
```

#### `basePath`

``` purescript
basePath :: ConfigOption String
```

#### `suffix`

``` purescript
suffix :: ConfigOption String
```


