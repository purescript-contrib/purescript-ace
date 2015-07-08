## Module Ace.Tokenizer

#### `getLineTokens`

``` purescript
getLineTokens :: forall eff. Tokenizer -> Eff (ace :: ACE | eff) { tokens :: Array TokenInfo, state :: String }
```

#### `create`

``` purescript
create :: forall eff. Rules -> String -> Eff (ace :: ACE | eff) Tokenizer
```


