## Module Ace.VirtualRenderer

#### `getCharacterWidth`

``` purescript
getCharacterWidth :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Number
```

#### `screenToTextCoordinates`

``` purescript
screenToTextCoordinates :: forall eff. Number -> Number -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `setSession`

``` purescript
setSession :: forall eff. EditSession -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `updateLines`

``` purescript
updateLines :: forall eff. Int -> Int -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `updateText`

``` purescript
updateText :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `updateFull`

``` purescript
updateFull :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `updateFontSize`

``` purescript
updateFontSize :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `onResize`

``` purescript
onResize :: forall eff. Boolean -> Int -> Int -> Int -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `adjustWrapLimit`

``` purescript
adjustWrapLimit :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `setAnimatedScroll`

``` purescript
setAnimatedScroll :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `getAnimatedScroll`

``` purescript
getAnimatedScroll :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean
```

#### `setShowInvisibles`

``` purescript
setShowInvisibles :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `getShowInvisibles`

``` purescript
getShowInvisibles :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean
```

#### `setShowPrintMargin`

``` purescript
setShowPrintMargin :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `getShowPrintMargin`

``` purescript
getShowPrintMargin :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean
```

#### `setPrintMarginColumn`

``` purescript
setPrintMarginColumn :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `getPrintMarginColumn`

``` purescript
getPrintMarginColumn :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean
```

#### `getShowGutter`

``` purescript
getShowGutter :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean
```

#### `setShowGutter`

``` purescript
setShowGutter :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `getContainerElement`

``` purescript
getContainerElement :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) HTMLElement
```

#### `getMouseEventTarget`

``` purescript
getMouseEventTarget :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) HTMLElement
```

#### `getTextAreaContainer`

``` purescript
getTextAreaContainer :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) HTMLElement
```

#### `getFirstVisibleRow`

``` purescript
getFirstVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int
```

#### `getFirstFullyVisibleRow`

``` purescript
getFirstFullyVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int
```

#### `getLastFullyVisibleRow`

``` purescript
getLastFullyVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int
```

#### `getLastVisibleRow`

``` purescript
getLastVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int
```

#### `setPadding`

``` purescript
setPadding :: forall eff. Int -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `getHScrollBarAlwaysVisible`

``` purescript
getHScrollBarAlwaysVisible :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean
```

#### `setHScrollBarAlwaysVisible`

``` purescript
setHScrollBarAlwaysVisible :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `updateFrontMarkers`

``` purescript
updateFrontMarkers :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `updateBackMarkers`

``` purescript
updateBackMarkers :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `addGutterDecoration`

``` purescript
addGutterDecoration :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `removeGutterDecoration`

``` purescript
removeGutterDecoration :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `updateBreakpoints`

``` purescript
updateBreakpoints :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `setAnnotations`

``` purescript
setAnnotations :: forall eff. Array Annotation -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `updateCursor`

``` purescript
updateCursor :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `hideCursor`

``` purescript
hideCursor :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `showCursor`

``` purescript
showCursor :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `scrollCursorIntoView`

``` purescript
scrollCursorIntoView :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `getScrollTop`

``` purescript
getScrollTop :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int
```

#### `getScrollLeft`

``` purescript
getScrollLeft :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int
```

#### `getScrollTopRow`

``` purescript
getScrollTopRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int
```

#### `getScrollBottomRow`

``` purescript
getScrollBottomRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int
```

#### `scrollToRow`

``` purescript
scrollToRow :: forall eff. Int -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `scrollToLine`

``` purescript
scrollToLine :: forall eff. Int -> Boolean -> Boolean -> Eff (ace :: ACE | eff) Unit -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `scrollToY`

``` purescript
scrollToY :: forall eff. Number -> VirtualRenderer -> Eff (ace :: ACE | eff) Number
```

#### `scrollToX`

``` purescript
scrollToX :: forall eff. Number -> VirtualRenderer -> Eff (ace :: ACE | eff) Number
```

#### `scrollBy`

``` purescript
scrollBy :: forall eff. Number -> Number -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `isScrollableBy`

``` purescript
isScrollableBy :: forall eff. Number -> Number -> VirtualRenderer -> Eff (ace :: ACE | eff) Boolean
```

#### `textToScreenCoordinates`

``` purescript
textToScreenCoordinates :: forall eff. Int -> Int -> VirtualRenderer -> Eff (ace :: ACE | eff) Position
```

#### `visualizeFocus`

``` purescript
visualizeFocus :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `visualizeBlur`

``` purescript
visualizeBlur :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `showComposition`

``` purescript
showComposition :: forall eff. Int -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `setCompositionText`

``` purescript
setCompositionText :: forall eff. String -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `hideComposition`

``` purescript
hideComposition :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `setTheme`

``` purescript
setTheme :: forall eff. String -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `getTheme`

``` purescript
getTheme :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) String
```

#### `setStyle`

``` purescript
setStyle :: forall eff. String -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `unsetStyle`

``` purescript
unsetStyle :: forall eff. String -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `destroy`

``` purescript
destroy :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
```

#### `create`

``` purescript
create :: forall eff. HTMLElement -> Maybe String -> Eff (ace :: ACE | eff) VirtualRenderer
```


