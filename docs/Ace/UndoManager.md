## Module Ace.UndoManager

#### `undo`

``` purescript
undo :: forall eff. Maybe Boolean -> UndoManager -> Eff (ace :: ACE | eff) Range
```

#### `redo`

``` purescript
redo :: forall eff. Boolean -> UndoManager -> Eff (ace :: ACE | eff) Unit
```

#### `reset`

``` purescript
reset :: forall eff. UndoManager -> Eff (ace :: ACE | eff) Unit
```

#### `hasUndo`

``` purescript
hasUndo :: forall eff. UndoManager -> Eff (ace :: ACE | eff) Boolean
```

#### `hasRedo`

``` purescript
hasRedo :: forall eff. UndoManager -> Eff (ace :: ACE | eff) Boolean
```

#### `create`

``` purescript
create :: forall eff. Eff (ace :: ACE | eff) UndoManager
```


