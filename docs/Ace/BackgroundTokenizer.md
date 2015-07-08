## Module Ace.BackgroundTokenizer

#### `onUpdate`

``` purescript
onUpdate :: forall eff a. BackgroundTokenizer -> (BackgroundTokenizerEvent -> Eff (ace :: ACE | eff) a) -> Eff (ace :: ACE | eff) Unit
```

#### `setTokenizer`

``` purescript
setTokenizer :: forall eff. Tokenizer -> BackgroundTokenizer -> Eff (ace :: ACE | eff) Unit
```

#### `setDocument`

``` purescript
setDocument :: forall eff. Document -> BackgroundTokenizer -> Eff (ace :: ACE | eff) Unit
```

#### `fireUpdateEvent`

``` purescript
fireUpdateEvent :: forall eff. Int -> Int -> BackgroundTokenizer -> Eff (ace :: ACE | eff) Unit
```

#### `start`

``` purescript
start :: forall eff. Int -> BackgroundTokenizer -> Eff (ace :: ACE | eff) Unit
```

#### `stop`

``` purescript
stop :: forall eff. BackgroundTokenizer -> Eff (ace :: ACE | eff) Unit
```

#### `getTokens`

``` purescript
getTokens :: forall eff. Int -> BackgroundTokenizer -> Eff (ace :: ACE | eff) (Array TokenInfo)
```

#### `getState`

``` purescript
getState :: forall eff. Int -> BackgroundTokenizer -> Eff (ace :: ACE | eff) String
```

#### `create`

``` purescript
create :: forall eff. Tokenizer -> Editor -> Eff (ace :: ACE | eff) BackgroundTokenizer
```


