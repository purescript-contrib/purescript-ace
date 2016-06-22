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

import Control.Monad.Eff (Eff())

import Data.Function.Uncurried (Fn2(), runFn2, Fn3(), runFn3, Fn5(), runFn5)
import Data.Maybe (Maybe())
import Data.Nullable (Nullable(), toNullable)

import DOM.HTML.Types (HTMLElement())

import Ace.Types

foreign import getCharacterWidth :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Number

foreign import getLineHeight :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Number

foreign import screenToTextCoordinatesImpl :: forall eff. Fn3 Number Number VirtualRenderer (Eff (ace :: ACE | eff) Unit)

screenToTextCoordinates :: forall eff. Number -> Number -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
screenToTextCoordinates left top self = runFn3 screenToTextCoordinatesImpl left top self

foreign import setSessionImpl :: forall eff. Fn2 EditSession VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setSession :: forall eff. EditSession -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setSession session self = runFn2 setSessionImpl session self

foreign import updateLinesImpl :: forall eff. Fn3 Int Int VirtualRenderer (Eff (ace :: ACE | eff) Unit)

updateLines :: forall eff. Int -> Int -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
updateLines firstRow lastRow self = runFn3 updateLinesImpl firstRow lastRow self

foreign import updateText :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit

foreign import updateFullImpl :: forall eff. Fn2 Boolean VirtualRenderer (Eff (ace :: ACE | eff) Unit)

updateFull :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
updateFull force self = runFn2 updateFullImpl force self

foreign import updateFontSize :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit

foreign import onResizeImpl :: forall eff. Fn5 Boolean Int Int Int VirtualRenderer (Eff (ace :: ACE | eff) Unit)

onResize :: forall eff. Boolean -> Int -> Int -> Int -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
onResize force gutterWidth width height self = runFn5 onResizeImpl force gutterWidth width height self

foreign import adjustWrapLimit :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit

foreign import setAnimatedScrollImpl :: forall eff. Fn2 Boolean VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setAnimatedScroll :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setAnimatedScroll shouldAnimate self = runFn2 setAnimatedScrollImpl shouldAnimate self

foreign import getAnimatedScroll :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean

foreign import setShowInvisiblesImpl :: forall eff. Fn2 Boolean VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setShowInvisibles :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setShowInvisibles showInvisibles self = runFn2 setShowInvisiblesImpl showInvisibles self

foreign import getShowInvisibles :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean

foreign import setShowPrintMarginImpl :: forall eff. Fn2 Boolean VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setShowPrintMargin :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setShowPrintMargin showPrintMargin self = runFn2 setShowPrintMarginImpl showPrintMargin self

foreign import getShowPrintMargin :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean

foreign import setPrintMarginColumnImpl :: forall eff. Fn2 Boolean VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setPrintMarginColumn :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setPrintMarginColumn showPrintMargin self = runFn2 setPrintMarginColumnImpl showPrintMargin self

foreign import getPrintMarginColumn :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean

foreign import getShowGutter :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean

foreign import setShowGutterImpl :: forall eff. Fn2 Boolean VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setShowGutter :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setShowGutter show self = runFn2 setShowGutterImpl show self

foreign import getContainerElement :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) HTMLElement

foreign import getMouseEventTarget :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) HTMLElement

foreign import getTextAreaContainer :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) HTMLElement

foreign import getFirstVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int

foreign import getFirstFullyVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int

foreign import getLastFullyVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int

foreign import getLastVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int

foreign import setPaddingImpl :: forall eff. Fn2 Int VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setPadding :: forall eff. Int -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setPadding padding self = runFn2 setPaddingImpl padding self

foreign import getHScrollBarAlwaysVisible :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean

foreign import setHScrollBarAlwaysVisibleImpl :: forall eff. Fn2 Boolean VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setHScrollBarAlwaysVisible :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setHScrollBarAlwaysVisible alwaysVisible self = runFn2 setHScrollBarAlwaysVisibleImpl alwaysVisible self

foreign import updateFrontMarkers :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit

foreign import updateBackMarkers :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit

foreign import addGutterDecoration :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit

foreign import removeGutterDecoration :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit

foreign import updateBreakpoints :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit

foreign import setAnnotationsImpl :: forall eff. Fn2 (Array Annotation) VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setAnnotations :: forall eff. Array Annotation -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setAnnotations annotations self = runFn2 setAnnotationsImpl annotations self

foreign import updateCursor :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit

foreign import hideCursor :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit

foreign import showCursor :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit

foreign import scrollCursorIntoView :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit

foreign import getScrollTop :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int

foreign import getScrollLeft :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int

foreign import getScrollTopRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int

foreign import getScrollBottomRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int

foreign import scrollToRowImpl :: forall eff. Fn2 Int VirtualRenderer (Eff (ace :: ACE | eff) Unit)

scrollToRow :: forall eff. Int -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
scrollToRow row self = runFn2 scrollToRowImpl row self

foreign import scrollToLineImpl :: forall eff. Fn5 Int Boolean Boolean (Eff (ace :: ACE | eff) Unit) VirtualRenderer (Eff (ace :: ACE | eff) Unit)

scrollToLine :: forall eff. Int -> Boolean -> Boolean -> Eff (ace :: ACE | eff) Unit -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
scrollToLine line center animate callback self = runFn5 scrollToLineImpl line center animate callback self

foreign import scrollToYImpl :: forall eff. Fn2 Number VirtualRenderer (Eff (ace :: ACE | eff) Number)

scrollToY :: forall eff. Number -> VirtualRenderer -> Eff (ace :: ACE | eff) Number
scrollToY scrollTop self = runFn2 scrollToYImpl scrollTop self

foreign import scrollToXImpl :: forall eff. Fn2 Number VirtualRenderer (Eff (ace :: ACE | eff) Number)

scrollToX :: forall eff. Number -> VirtualRenderer -> Eff (ace :: ACE | eff) Number
scrollToX scrollLeft self = runFn2 scrollToXImpl scrollLeft self

foreign import scrollByImpl :: forall eff. Fn3 Number Number VirtualRenderer (Eff (ace :: ACE | eff) Unit)

scrollBy :: forall eff. Number -> Number -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
scrollBy deltaX deltaY self = runFn3 scrollByImpl deltaX deltaY self

foreign import isScrollableByImpl :: forall eff. Fn3 Number Number VirtualRenderer (Eff (ace :: ACE | eff) Boolean)

isScrollableBy :: forall eff. Number -> Number -> VirtualRenderer -> Eff (ace :: ACE | eff) Boolean
isScrollableBy deltaX deltaY self = runFn3 isScrollableByImpl deltaX deltaY self

foreign import textToScreenCoordinatesImpl :: forall eff. Fn3 Int Int VirtualRenderer (Eff (ace :: ACE | eff) Position)

textToScreenCoordinates :: forall eff. Int -> Int -> VirtualRenderer -> Eff (ace :: ACE | eff) Position
textToScreenCoordinates row column self = runFn3 textToScreenCoordinatesImpl row column self

foreign import visualizeFocus :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit

foreign import visualizeBlur :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit

foreign import showCompositionImpl :: forall eff. Fn2 Int VirtualRenderer (Eff (ace :: ACE | eff) Unit)

showComposition :: forall eff. Int -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
showComposition position self = runFn2 showCompositionImpl position self

foreign import setCompositionTextImpl :: forall eff. Fn2 String VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setCompositionText :: forall eff. String -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setCompositionText text self = runFn2 setCompositionTextImpl text self

foreign import hideComposition :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit

foreign import setThemeImpl :: forall eff. Fn2 String VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setTheme :: forall eff. String -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setTheme theme self = runFn2 setThemeImpl theme self

foreign import getTheme :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) String

foreign import setStyleImpl :: forall eff. Fn2 String VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setStyle :: forall eff. String -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setStyle style self = runFn2 setStyleImpl style self

foreign import unsetStyleImpl :: forall eff. Fn2 String VirtualRenderer (Eff (ace :: ACE | eff) Unit)

unsetStyle :: forall eff. String -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
unsetStyle style self = runFn2 unsetStyleImpl style self

foreign import destroy :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit

foreign import createImpl :: forall eff. Fn2 HTMLElement (Nullable String) (Eff (ace :: ACE | eff) VirtualRenderer)

create :: forall eff. HTMLElement -> Maybe String -> Eff (ace :: ACE | eff) VirtualRenderer
create container theme = runFn2 createImpl container (toNullable theme)
