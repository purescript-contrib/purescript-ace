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

import Data.Maybe
import Data.Function hiding (on)

import Control.Monad.Eff

import Ace.Types
import Data.DOM.Simple.Types
import Data.Nullable

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

foreign import updateTextImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Unit)

updateText :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
updateText self = runFn1 updateTextImpl self

foreign import updateFullImpl :: forall eff. Fn2 Boolean VirtualRenderer (Eff (ace :: ACE | eff) Unit)

updateFull :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
updateFull force self = runFn2 updateFullImpl force self

foreign import updateFontSizeImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Unit)

updateFontSize :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
updateFontSize self = runFn1 updateFontSizeImpl self

foreign import onResizeImpl :: forall eff. Fn5 Boolean Int Int Int VirtualRenderer (Eff (ace :: ACE | eff) Unit)

onResize :: forall eff. Boolean -> Int -> Int -> Int -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
onResize force gutterWidth width height self = runFn5 onResizeImpl force gutterWidth width height self

foreign import adjustWrapLimitImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Unit)

adjustWrapLimit :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
adjustWrapLimit self = runFn1 adjustWrapLimitImpl self

foreign import setAnimatedScrollImpl :: forall eff. Fn2 Boolean VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setAnimatedScroll :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setAnimatedScroll shouldAnimate self = runFn2 setAnimatedScrollImpl shouldAnimate self

foreign import getAnimatedScrollImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Boolean)

getAnimatedScroll :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean
getAnimatedScroll self = runFn1 getAnimatedScrollImpl self

foreign import setShowInvisiblesImpl :: forall eff. Fn2 Boolean VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setShowInvisibles :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setShowInvisibles showInvisibles self = runFn2 setShowInvisiblesImpl showInvisibles self

foreign import getShowInvisiblesImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Boolean)

getShowInvisibles :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean
getShowInvisibles self = runFn1 getShowInvisiblesImpl self

foreign import setShowPrintMarginImpl :: forall eff. Fn2 Boolean VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setShowPrintMargin :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setShowPrintMargin showPrintMargin self = runFn2 setShowPrintMarginImpl showPrintMargin self

foreign import getShowPrintMarginImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Boolean)

getShowPrintMargin :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean
getShowPrintMargin self = runFn1 getShowPrintMarginImpl self

foreign import setPrintMarginColumnImpl :: forall eff. Fn2 Boolean VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setPrintMarginColumn :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setPrintMarginColumn showPrintMargin self = runFn2 setPrintMarginColumnImpl showPrintMargin self

foreign import getPrintMarginColumnImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Boolean)

getPrintMarginColumn :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean
getPrintMarginColumn self = runFn1 getPrintMarginColumnImpl self

foreign import getShowGutterImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Boolean)

getShowGutter :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean
getShowGutter self = runFn1 getShowGutterImpl self

foreign import setShowGutterImpl :: forall eff. Fn2 Boolean VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setShowGutter :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setShowGutter show self = runFn2 setShowGutterImpl show self

foreign import getContainerElementImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) HTMLElement)

getContainerElement :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) HTMLElement
getContainerElement self = runFn1 getContainerElementImpl self

foreign import getMouseEventTargetImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) HTMLElement)

getMouseEventTarget :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) HTMLElement
getMouseEventTarget self = runFn1 getMouseEventTargetImpl self

foreign import getTextAreaContainerImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) HTMLElement)

getTextAreaContainer :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) HTMLElement
getTextAreaContainer self = runFn1 getTextAreaContainerImpl self

foreign import getFirstVisibleRowImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Int)

getFirstVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int
getFirstVisibleRow self = runFn1 getFirstVisibleRowImpl self

foreign import getFirstFullyVisibleRowImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Int)

getFirstFullyVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int
getFirstFullyVisibleRow self = runFn1 getFirstFullyVisibleRowImpl self

foreign import getLastFullyVisibleRowImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Int)

getLastFullyVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int
getLastFullyVisibleRow self = runFn1 getLastFullyVisibleRowImpl self

foreign import getLastVisibleRowImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Int)

getLastVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int
getLastVisibleRow self = runFn1 getLastVisibleRowImpl self

foreign import setPaddingImpl :: forall eff. Fn2 Int VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setPadding :: forall eff. Int -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setPadding padding self = runFn2 setPaddingImpl padding self

foreign import getHScrollBarAlwaysVisibleImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Boolean)

getHScrollBarAlwaysVisible :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Boolean
getHScrollBarAlwaysVisible self = runFn1 getHScrollBarAlwaysVisibleImpl self

foreign import setHScrollBarAlwaysVisibleImpl :: forall eff. Fn2 Boolean VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setHScrollBarAlwaysVisible :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setHScrollBarAlwaysVisible alwaysVisible self = runFn2 setHScrollBarAlwaysVisibleImpl alwaysVisible self

foreign import updateFrontMarkersImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Unit)

updateFrontMarkers :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
updateFrontMarkers self = runFn1 updateFrontMarkersImpl self

foreign import updateBackMarkersImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Unit)

updateBackMarkers :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
updateBackMarkers self = runFn1 updateBackMarkersImpl self

foreign import addGutterDecorationImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Unit)

addGutterDecoration :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
addGutterDecoration self = runFn1 addGutterDecorationImpl self

foreign import removeGutterDecorationImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Unit)

removeGutterDecoration :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
removeGutterDecoration self = runFn1 removeGutterDecorationImpl self

foreign import updateBreakpointsImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Unit)

updateBreakpoints :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
updateBreakpoints self = runFn1 updateBreakpointsImpl self

foreign import setAnnotationsImpl :: forall eff. Fn2 (Array Annotation) VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setAnnotations :: forall eff. Array Annotation -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setAnnotations annotations self = runFn2 setAnnotationsImpl annotations self

foreign import updateCursorImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Unit)

updateCursor :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
updateCursor self = runFn1 updateCursorImpl self

foreign import hideCursorImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Unit)

hideCursor :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
hideCursor self = runFn1 hideCursorImpl self

foreign import showCursorImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Unit)

showCursor :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
showCursor self = runFn1 showCursorImpl self

foreign import scrollCursorIntoViewImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Unit)

scrollCursorIntoView :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
scrollCursorIntoView self = runFn1 scrollCursorIntoViewImpl self

foreign import getScrollTopImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Int)

getScrollTop :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int
getScrollTop self = runFn1 getScrollTopImpl self

foreign import getScrollLeftImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Int)

getScrollLeft :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int
getScrollLeft self = runFn1 getScrollLeftImpl self

foreign import getScrollTopRowImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Int)

getScrollTopRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int
getScrollTopRow self = runFn1 getScrollTopRowImpl self

foreign import getScrollBottomRowImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Int)

getScrollBottomRow :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Int
getScrollBottomRow self = runFn1 getScrollBottomRowImpl self

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

foreign import visualizeFocusImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Unit)

visualizeFocus :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
visualizeFocus self = runFn1 visualizeFocusImpl self

foreign import visualizeBlurImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Unit)

visualizeBlur :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
visualizeBlur self = runFn1 visualizeBlurImpl self

foreign import showCompositionImpl :: forall eff. Fn2 Int VirtualRenderer (Eff (ace :: ACE | eff) Unit)

showComposition :: forall eff. Int -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
showComposition position self = runFn2 showCompositionImpl position self

foreign import setCompositionTextImpl :: forall eff. Fn2 String VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setCompositionText :: forall eff. String -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setCompositionText text self = runFn2 setCompositionTextImpl text self

foreign import hideCompositionImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Unit)

hideComposition :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
hideComposition self = runFn1 hideCompositionImpl self

foreign import setThemeImpl :: forall eff. Fn2 String VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setTheme :: forall eff. String -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setTheme theme self = runFn2 setThemeImpl theme self

foreign import getThemeImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) String)

getTheme :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) String
getTheme self = runFn1 getThemeImpl self

foreign import setStyleImpl :: forall eff. Fn2 String VirtualRenderer (Eff (ace :: ACE | eff) Unit)

setStyle :: forall eff. String -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
setStyle style self = runFn2 setStyleImpl style self

foreign import unsetStyleImpl :: forall eff. Fn2 String VirtualRenderer (Eff (ace :: ACE | eff) Unit)

unsetStyle :: forall eff. String -> VirtualRenderer -> Eff (ace :: ACE | eff) Unit
unsetStyle style self = runFn2 unsetStyleImpl style self

foreign import destroyImpl :: forall eff. Fn1 VirtualRenderer (Eff (ace :: ACE | eff) Unit)

destroy :: forall eff. VirtualRenderer -> Eff (ace :: ACE | eff) Unit
destroy self = runFn1 destroyImpl self

foreign import createImpl :: forall eff. Fn2 HTMLElement (Nullable String) (Eff (ace :: ACE | eff) VirtualRenderer)

create :: forall eff. HTMLElement -> Maybe String -> Eff (ace :: ACE | eff) VirtualRenderer
create container theme = runFn2 createImpl container (toNullable theme)
