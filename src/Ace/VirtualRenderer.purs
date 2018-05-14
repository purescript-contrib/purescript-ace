module Ace.VirtualRenderer
  ( addGutterDecoration
  , adjustWrapLimit
  , create
  , destroy
  , getAnimatedScroll
  , getCharacterWidth
  , getContainerElement
  , getFirstFullyVisibleRow
  , getFirstVisibleRow
  , getHScrollBarAlwaysVisible
  , getLastFullyVisibleRow
  , getLastVisibleRow
  , getMouseEventTarget
  , getPrintMarginColumn
  , getScrollBottomRow
  , getScrollLeft
  , getScrollTop
  , getScrollTopRow
  , getShowGutter
  , getShowInvisibles
  , getShowPrintMargin
  , getTextAreaContainer
  , getTheme
  , hideComposition
  , hideCursor
  , isScrollableBy
  , onResize
  , removeGutterDecoration
  , screenToTextCoordinates
  , scrollBy
  , scrollCursorIntoView
  , scrollToLine
  , scrollToRow
  , scrollToX
  , scrollToY
  , setAnimatedScroll
  , setAnnotations
  , setCompositionText
  , setHScrollBarAlwaysVisible
  , setPadding
  , setPrintMarginColumn
  , setSession
  , setShowGutter
  , setShowInvisibles
  , setShowPrintMargin
  , setStyle
  , setTheme
  , showComposition
  , showCursor
  , textToScreenCoordinates
  , unsetStyle
  , updateBackMarkers
  , updateBreakpoints
  , updateCursor
  , updateFontSize
  , updateFrontMarkers
  , updateFull
  , updateLines
  , updateText
  , visualizeBlur
  , visualizeFocus
  ) where

import Prelude hiding (compare)

import Ace.Types (VirtualRenderer, Position, Annotation, EditSession)
import Effect (Effect)
import Data.Function.Uncurried (Fn2, runFn2, Fn3, runFn3, Fn5, runFn5)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Web.HTML.HTMLElement (HTMLElement)

foreign import getCharacterWidth :: VirtualRenderer -> Effect Number

foreign import getLineHeight :: VirtualRenderer -> Effect Number

foreign import screenToTextCoordinatesImpl :: Fn3 Number Number VirtualRenderer (Effect Unit)

screenToTextCoordinates :: Number -> Number -> VirtualRenderer -> Effect Unit
screenToTextCoordinates left top self = runFn3 screenToTextCoordinatesImpl left top self

foreign import setSessionImpl :: Fn2 EditSession VirtualRenderer (Effect Unit)

setSession :: EditSession -> VirtualRenderer -> Effect Unit
setSession session self = runFn2 setSessionImpl session self

foreign import updateLinesImpl :: Fn3 Int Int VirtualRenderer (Effect Unit)

updateLines :: Int -> Int -> VirtualRenderer -> Effect Unit
updateLines firstRow lastRow self = runFn3 updateLinesImpl firstRow lastRow self

foreign import updateText :: VirtualRenderer -> Effect Unit

foreign import updateFullImpl :: Fn2 Boolean VirtualRenderer (Effect Unit)

updateFull :: Boolean -> VirtualRenderer -> Effect Unit
updateFull force self = runFn2 updateFullImpl force self

foreign import updateFontSize :: VirtualRenderer -> Effect Unit

foreign import onResizeImpl :: Fn5 Boolean Int Int Int VirtualRenderer (Effect Unit)

onResize :: Boolean -> Int -> Int -> Int -> VirtualRenderer -> Effect Unit
onResize force gutterWidth width height self = runFn5 onResizeImpl force gutterWidth width height self

foreign import adjustWrapLimit :: VirtualRenderer -> Effect Unit

foreign import setAnimatedScrollImpl :: Fn2 Boolean VirtualRenderer (Effect Unit)

setAnimatedScroll :: Boolean -> VirtualRenderer -> Effect Unit
setAnimatedScroll shouldAnimate self = runFn2 setAnimatedScrollImpl shouldAnimate self

foreign import getAnimatedScroll :: VirtualRenderer -> Effect Boolean

foreign import setShowInvisiblesImpl :: Fn2 Boolean VirtualRenderer (Effect Unit)

setShowInvisibles :: Boolean -> VirtualRenderer -> Effect Unit
setShowInvisibles showInvisibles self = runFn2 setShowInvisiblesImpl showInvisibles self

foreign import getShowInvisibles :: VirtualRenderer -> Effect Boolean

foreign import setShowPrintMarginImpl :: Fn2 Boolean VirtualRenderer (Effect Unit)

setShowPrintMargin :: Boolean -> VirtualRenderer -> Effect Unit
setShowPrintMargin showPrintMargin self = runFn2 setShowPrintMarginImpl showPrintMargin self

foreign import getShowPrintMargin :: VirtualRenderer -> Effect Boolean

foreign import setPrintMarginColumnImpl :: Fn2 Boolean VirtualRenderer (Effect Unit)

setPrintMarginColumn :: Boolean -> VirtualRenderer -> Effect Unit
setPrintMarginColumn showPrintMargin self = runFn2 setPrintMarginColumnImpl showPrintMargin self

foreign import getPrintMarginColumn :: VirtualRenderer -> Effect Boolean

foreign import getShowGutter :: VirtualRenderer -> Effect Boolean

foreign import setShowGutterImpl :: Fn2 Boolean VirtualRenderer (Effect Unit)

setShowGutter :: Boolean -> VirtualRenderer -> Effect Unit
setShowGutter show self = runFn2 setShowGutterImpl show self

foreign import getContainerElement :: VirtualRenderer -> Effect HTMLElement

foreign import getMouseEventTarget :: VirtualRenderer -> Effect HTMLElement

foreign import getTextAreaContainer :: VirtualRenderer -> Effect HTMLElement

foreign import getFirstVisibleRow :: VirtualRenderer -> Effect Int

foreign import getFirstFullyVisibleRow :: VirtualRenderer -> Effect Int

foreign import getLastFullyVisibleRow :: VirtualRenderer -> Effect Int

foreign import getLastVisibleRow :: VirtualRenderer -> Effect Int

foreign import setPaddingImpl :: Fn2 Int VirtualRenderer (Effect Unit)

setPadding :: Int -> VirtualRenderer -> Effect Unit
setPadding padding self = runFn2 setPaddingImpl padding self

foreign import getHScrollBarAlwaysVisible :: VirtualRenderer -> Effect Boolean

foreign import setHScrollBarAlwaysVisibleImpl :: Fn2 Boolean VirtualRenderer (Effect Unit)

setHScrollBarAlwaysVisible :: Boolean -> VirtualRenderer -> Effect Unit
setHScrollBarAlwaysVisible alwaysVisible self = runFn2 setHScrollBarAlwaysVisibleImpl alwaysVisible self

foreign import updateFrontMarkers :: VirtualRenderer -> Effect Unit

foreign import updateBackMarkers :: VirtualRenderer -> Effect Unit

foreign import addGutterDecoration :: VirtualRenderer -> Effect Unit

foreign import removeGutterDecoration :: VirtualRenderer -> Effect Unit

foreign import updateBreakpoints :: VirtualRenderer -> Effect Unit

foreign import setAnnotationsImpl :: Fn2 (Array Annotation) VirtualRenderer (Effect Unit)

setAnnotations :: Array Annotation -> VirtualRenderer -> Effect Unit
setAnnotations annotations self = runFn2 setAnnotationsImpl annotations self

foreign import updateCursor :: VirtualRenderer -> Effect Unit

foreign import hideCursor :: VirtualRenderer -> Effect Unit

foreign import showCursor :: VirtualRenderer -> Effect Unit

foreign import scrollCursorIntoView :: VirtualRenderer -> Effect Unit

foreign import getScrollTop :: VirtualRenderer -> Effect Int

foreign import getScrollLeft :: VirtualRenderer -> Effect Int

foreign import getScrollTopRow :: VirtualRenderer -> Effect Int

foreign import getScrollBottomRow :: VirtualRenderer -> Effect Int

foreign import scrollToRowImpl :: Fn2 Int VirtualRenderer (Effect Unit)

scrollToRow :: Int -> VirtualRenderer -> Effect Unit
scrollToRow row self = runFn2 scrollToRowImpl row self

foreign import scrollToLineImpl :: Fn5 Int Boolean Boolean (Effect Unit) VirtualRenderer (Effect Unit)

scrollToLine :: Int -> Boolean -> Boolean -> Effect Unit -> VirtualRenderer -> Effect Unit
scrollToLine line center animate callback self = runFn5 scrollToLineImpl line center animate callback self

foreign import scrollToYImpl :: Fn2 Number VirtualRenderer (Effect Number)

scrollToY :: Number -> VirtualRenderer -> Effect Number
scrollToY scrollTop self = runFn2 scrollToYImpl scrollTop self

foreign import scrollToXImpl :: Fn2 Number VirtualRenderer (Effect Number)

scrollToX :: Number -> VirtualRenderer -> Effect Number
scrollToX scrollLeft self = runFn2 scrollToXImpl scrollLeft self

foreign import scrollByImpl :: Fn3 Number Number VirtualRenderer (Effect Unit)

scrollBy :: Number -> Number -> VirtualRenderer -> Effect Unit
scrollBy deltaX deltaY self = runFn3 scrollByImpl deltaX deltaY self

foreign import isScrollableByImpl :: Fn3 Number Number VirtualRenderer (Effect Boolean)

isScrollableBy :: Number -> Number -> VirtualRenderer -> Effect Boolean
isScrollableBy deltaX deltaY self = runFn3 isScrollableByImpl deltaX deltaY self

foreign import textToScreenCoordinatesImpl :: Fn3 Int Int VirtualRenderer (Effect Position)

textToScreenCoordinates :: Int -> Int -> VirtualRenderer -> Effect Position
textToScreenCoordinates row column self = runFn3 textToScreenCoordinatesImpl row column self

foreign import visualizeFocus :: VirtualRenderer -> Effect Unit

foreign import visualizeBlur :: VirtualRenderer -> Effect Unit

foreign import showCompositionImpl :: Fn2 Int VirtualRenderer (Effect Unit)

showComposition :: Int -> VirtualRenderer -> Effect Unit
showComposition position self = runFn2 showCompositionImpl position self

foreign import setCompositionTextImpl :: Fn2 String VirtualRenderer (Effect Unit)

setCompositionText :: String -> VirtualRenderer -> Effect Unit
setCompositionText text self = runFn2 setCompositionTextImpl text self

foreign import hideComposition :: VirtualRenderer -> Effect Unit

foreign import setThemeImpl :: Fn2 String VirtualRenderer (Effect Unit)

setTheme :: String -> VirtualRenderer -> Effect Unit
setTheme theme self = runFn2 setThemeImpl theme self

foreign import getTheme :: VirtualRenderer -> Effect String

foreign import setStyleImpl :: Fn2 String VirtualRenderer (Effect Unit)

setStyle :: String -> VirtualRenderer -> Effect Unit
setStyle style self = runFn2 setStyleImpl style self

foreign import unsetStyleImpl :: Fn2 String VirtualRenderer (Effect Unit)

unsetStyle :: String -> VirtualRenderer -> Effect Unit
unsetStyle style self = runFn2 unsetStyleImpl style self

foreign import destroy :: VirtualRenderer -> Effect Unit

foreign import createImpl :: Fn2 HTMLElement (Nullable String) (Effect VirtualRenderer)

create :: HTMLElement -> Maybe String -> Effect VirtualRenderer
create container theme = runFn2 createImpl container (toNullable theme)
