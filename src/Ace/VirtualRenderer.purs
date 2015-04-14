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

foreign import getCharacterWidth
  "function getCharacterWidth(value) {\
  \  return value.characterWidth;\
  \}" :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Number

foreign import getLineHeight
  "function getLineHeight(value) {\
  \  return value.lineHeight;\
  \}" :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Number

foreign import screenToTextCoordinatesImpl
  "function screenToTextCoordinatesImpl(left, top, self) {\
  \  return function() {\
  \    return self.screenToTextCoordinates(left, top);\
  \  };\
  \}" :: forall eff. Fn3 Number Number VirtualRenderer (Eff (ace :: EAce | eff) Unit)

screenToTextCoordinates :: forall eff. Number -> Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit
screenToTextCoordinates left top self = runFn3 screenToTextCoordinatesImpl left top self

foreign import setSessionImpl
  "function setSessionImpl(session, self) {\
  \  return function() {\
  \    return self.setSession(session);\
  \  };\
  \}" :: forall eff. Fn2 EditSession VirtualRenderer (Eff (ace :: EAce | eff) Unit)

setSession :: forall eff. EditSession -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit
setSession session self = runFn2 setSessionImpl session self

foreign import updateLinesImpl
  "function updateLinesImpl(firstRow, lastRow, self) {\
  \  return function() {\
  \    return self.updateLines(firstRow, lastRow);\
  \  };\
  \}" :: forall eff. Fn3 Number Number VirtualRenderer (Eff (ace :: EAce | eff) Unit)

updateLines :: forall eff. Number -> Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit
updateLines firstRow lastRow self = runFn3 updateLinesImpl firstRow lastRow self

foreign import updateTextImpl
  "function updateTextImpl(self) {\
  \  return function() {\
  \    return self.updateText();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Unit)

updateText :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit
updateText self = runFn1 updateTextImpl self

foreign import updateFullImpl
  "function updateFullImpl(force, self) {\
  \  return function() {\
  \    return self.updateFull(force);\
  \  };\
  \}" :: forall eff. Fn2 Boolean VirtualRenderer (Eff (ace :: EAce | eff) Unit)

updateFull :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit
updateFull force self = runFn2 updateFullImpl force self

foreign import updateFontSizeImpl
  "function updateFontSizeImpl(self) {\
  \  return function() {\
  \    return self.updateFontSize();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Unit)

updateFontSize :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit
updateFontSize self = runFn1 updateFontSizeImpl self

foreign import onResizeImpl
  "function onResizeImpl(force, gutterWidth, width, height, self) {\
  \  return function() {\
  \    return self.onResize(force, gutterWidth, width, height);\
  \  };\
  \}" :: forall eff. Fn5 Boolean Number Number Number VirtualRenderer (Eff (ace :: EAce | eff) Unit)

onResize :: forall eff. Boolean -> Number -> Number -> Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit
onResize force gutterWidth width height self = runFn5 onResizeImpl force gutterWidth width height self

foreign import adjustWrapLimitImpl
  "function adjustWrapLimitImpl(self) {\
  \  return function() {\
  \    return self.adjustWrapLimit();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Unit)

adjustWrapLimit :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit
adjustWrapLimit self = runFn1 adjustWrapLimitImpl self

foreign import setAnimatedScrollImpl
  "function setAnimatedScrollImpl(shouldAnimate, self) {\
  \  return function() {\
  \    return self.setAnimatedScroll(shouldAnimate);\
  \  };\
  \}" :: forall eff. Fn2 Boolean VirtualRenderer (Eff (ace :: EAce | eff) Unit)

setAnimatedScroll :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit
setAnimatedScroll shouldAnimate self = runFn2 setAnimatedScrollImpl shouldAnimate self

foreign import getAnimatedScrollImpl
  "function getAnimatedScrollImpl(self) {\
  \  return function() {\
  \    return self.getAnimatedScroll();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Boolean)

getAnimatedScroll :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Boolean
getAnimatedScroll self = runFn1 getAnimatedScrollImpl self

foreign import setShowInvisiblesImpl
  "function setShowInvisiblesImpl(showInvisibles, self) {\
  \  return function() {\
  \    return self.setShowInvisibles(showInvisibles);\
  \  };\
  \}" :: forall eff. Fn2 Boolean VirtualRenderer (Eff (ace :: EAce | eff) Unit)

setShowInvisibles :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit
setShowInvisibles showInvisibles self = runFn2 setShowInvisiblesImpl showInvisibles self

foreign import getShowInvisiblesImpl
  "function getShowInvisiblesImpl(self) {\
  \  return function() {\
  \    return self.getShowInvisibles();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Boolean)

getShowInvisibles :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Boolean
getShowInvisibles self = runFn1 getShowInvisiblesImpl self

foreign import setShowPrintMarginImpl
  "function setShowPrintMarginImpl(showPrintMargin, self) {\
  \  return function() {\
  \    return self.setShowPrintMargin(showPrintMargin);\
  \  };\
  \}" :: forall eff. Fn2 Boolean VirtualRenderer (Eff (ace :: EAce | eff) Unit)

setShowPrintMargin :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit
setShowPrintMargin showPrintMargin self = runFn2 setShowPrintMarginImpl showPrintMargin self

foreign import getShowPrintMarginImpl
  "function getShowPrintMarginImpl(self) {\
  \  return function() {\
  \    return self.getShowPrintMargin();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Boolean)

getShowPrintMargin :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Boolean
getShowPrintMargin self = runFn1 getShowPrintMarginImpl self

foreign import setPrintMarginColumnImpl
  "function setPrintMarginColumnImpl(showPrintMargin, self) {\
  \  return function() {\
  \    return self.setPrintMarginColumn(showPrintMargin);\
  \  };\
  \}" :: forall eff. Fn2 Boolean VirtualRenderer (Eff (ace :: EAce | eff) Unit)

setPrintMarginColumn :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit
setPrintMarginColumn showPrintMargin self = runFn2 setPrintMarginColumnImpl showPrintMargin self

foreign import getPrintMarginColumnImpl
  "function getPrintMarginColumnImpl(self) {\
  \  return function() {\
  \    return self.getPrintMarginColumn();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Boolean)

getPrintMarginColumn :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Boolean
getPrintMarginColumn self = runFn1 getPrintMarginColumnImpl self

foreign import getShowGutterImpl
  "function getShowGutterImpl(self) {\
  \  return function() {\
  \    return self.getShowGutter();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Boolean)

getShowGutter :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Boolean
getShowGutter self = runFn1 getShowGutterImpl self

foreign import setShowGutterImpl
  "function setShowGutterImpl(show, self) {\
  \  return function() {\
  \    return self.setShowGutter(show);\
  \  };\
  \}" :: forall eff. Fn2 Boolean VirtualRenderer (Eff (ace :: EAce | eff) Unit)

setShowGutter :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit
setShowGutter show self = runFn2 setShowGutterImpl show self

foreign import getContainerElementImpl
  "function getContainerElementImpl(self) {\
  \  return function() {\
  \    return self.getContainerElement();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) HTMLElement)

getContainerElement :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) HTMLElement
getContainerElement self = runFn1 getContainerElementImpl self

foreign import getMouseEventTargetImpl
  "function getMouseEventTargetImpl(self) {\
  \  return function() {\
  \    return self.getMouseEventTarget();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) HTMLElement)

getMouseEventTarget :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) HTMLElement
getMouseEventTarget self = runFn1 getMouseEventTargetImpl self

foreign import getTextAreaContainerImpl
  "function getTextAreaContainerImpl(self) {\
  \  return function() {\
  \    return self.getTextAreaContainer();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) HTMLElement)

getTextAreaContainer :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) HTMLElement
getTextAreaContainer self = runFn1 getTextAreaContainerImpl self

foreign import getFirstVisibleRowImpl
  "function getFirstVisibleRowImpl(self) {\
  \  return function() {\
  \    return self.getFirstVisibleRow();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Number)

getFirstVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Number
getFirstVisibleRow self = runFn1 getFirstVisibleRowImpl self

foreign import getFirstFullyVisibleRowImpl
  "function getFirstFullyVisibleRowImpl(self) {\
  \  return function() {\
  \    return self.getFirstFullyVisibleRow();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Number)

getFirstFullyVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Number
getFirstFullyVisibleRow self = runFn1 getFirstFullyVisibleRowImpl self

foreign import getLastFullyVisibleRowImpl
  "function getLastFullyVisibleRowImpl(self) {\
  \  return function() {\
  \    return self.getLastFullyVisibleRow();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Number)

getLastFullyVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Number
getLastFullyVisibleRow self = runFn1 getLastFullyVisibleRowImpl self

foreign import getLastVisibleRowImpl
  "function getLastVisibleRowImpl(self) {\
  \  return function() {\
  \    return self.getLastVisibleRow();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Number)

getLastVisibleRow :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Number
getLastVisibleRow self = runFn1 getLastVisibleRowImpl self

foreign import setPaddingImpl
  "function setPaddingImpl(padding, self) {\
  \  return function() {\
  \    return self.setPadding(padding);\
  \  };\
  \}" :: forall eff. Fn2 Number VirtualRenderer (Eff (ace :: EAce | eff) Unit)

setPadding :: forall eff. Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit
setPadding padding self = runFn2 setPaddingImpl padding self

foreign import getHScrollBarAlwaysVisibleImpl
  "function getHScrollBarAlwaysVisibleImpl(self) {\
  \  return function() {\
  \    return self.getHScrollBarAlwaysVisible();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Boolean)

getHScrollBarAlwaysVisible :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Boolean
getHScrollBarAlwaysVisible self = runFn1 getHScrollBarAlwaysVisibleImpl self

foreign import setHScrollBarAlwaysVisibleImpl
  "function setHScrollBarAlwaysVisibleImpl(alwaysVisible, self) {\
  \  return function() {\
  \    return self.setHScrollBarAlwaysVisible(alwaysVisible);\
  \  };\
  \}" :: forall eff. Fn2 Boolean VirtualRenderer (Eff (ace :: EAce | eff) Unit)

setHScrollBarAlwaysVisible :: forall eff. Boolean -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit
setHScrollBarAlwaysVisible alwaysVisible self = runFn2 setHScrollBarAlwaysVisibleImpl alwaysVisible self

foreign import updateFrontMarkersImpl
  "function updateFrontMarkersImpl(self) {\
  \  return function() {\
  \    return self.updateFrontMarkers();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Unit)

updateFrontMarkers :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit
updateFrontMarkers self = runFn1 updateFrontMarkersImpl self

foreign import updateBackMarkersImpl
  "function updateBackMarkersImpl(self) {\
  \  return function() {\
  \    return self.updateBackMarkers();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Unit)

updateBackMarkers :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit
updateBackMarkers self = runFn1 updateBackMarkersImpl self

foreign import addGutterDecorationImpl
  "function addGutterDecorationImpl(self) {\
  \  return function() {\
  \    return self.addGutterDecoration();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Unit)

addGutterDecoration :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit
addGutterDecoration self = runFn1 addGutterDecorationImpl self

foreign import removeGutterDecorationImpl
  "function removeGutterDecorationImpl(self) {\
  \  return function() {\
  \    return self.removeGutterDecoration();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Unit)

removeGutterDecoration :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit
removeGutterDecoration self = runFn1 removeGutterDecorationImpl self

foreign import updateBreakpointsImpl
  "function updateBreakpointsImpl(self) {\
  \  return function() {\
  \    return self.updateBreakpoints();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Unit)

updateBreakpoints :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit
updateBreakpoints self = runFn1 updateBreakpointsImpl self

foreign import setAnnotationsImpl
  "function setAnnotationsImpl(annotations, self) {\
  \  return function() {\
  \    return self.setAnnotations(annotations);\
  \  };\
  \}" :: forall eff. Fn2 [Annotation] VirtualRenderer (Eff (ace :: EAce | eff) Unit)

setAnnotations :: forall eff. [Annotation] -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit
setAnnotations annotations self = runFn2 setAnnotationsImpl annotations self

foreign import updateCursorImpl
  "function updateCursorImpl(self) {\
  \  return function() {\
  \    return self.updateCursor();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Unit)

updateCursor :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit
updateCursor self = runFn1 updateCursorImpl self

foreign import hideCursorImpl
  "function hideCursorImpl(self) {\
  \  return function() {\
  \    return self.hideCursor();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Unit)

hideCursor :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit
hideCursor self = runFn1 hideCursorImpl self

foreign import showCursorImpl
  "function showCursorImpl(self) {\
  \  return function() {\
  \    return self.showCursor();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Unit)

showCursor :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit
showCursor self = runFn1 showCursorImpl self

foreign import scrollCursorIntoViewImpl
  "function scrollCursorIntoViewImpl(self) {\
  \  return function() {\
  \    return self.scrollCursorIntoView();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Unit)

scrollCursorIntoView :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit
scrollCursorIntoView self = runFn1 scrollCursorIntoViewImpl self

foreign import getScrollTopImpl
  "function getScrollTopImpl(self) {\
  \  return function() {\
  \    return self.getScrollTop();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Number)

getScrollTop :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Number
getScrollTop self = runFn1 getScrollTopImpl self

foreign import getScrollLeftImpl
  "function getScrollLeftImpl(self) {\
  \  return function() {\
  \    return self.getScrollLeft();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Number)

getScrollLeft :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Number
getScrollLeft self = runFn1 getScrollLeftImpl self

foreign import getScrollTopRowImpl
  "function getScrollTopRowImpl(self) {\
  \  return function() {\
  \    return self.getScrollTopRow();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Number)

getScrollTopRow :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Number
getScrollTopRow self = runFn1 getScrollTopRowImpl self

foreign import getScrollBottomRowImpl
  "function getScrollBottomRowImpl(self) {\
  \  return function() {\
  \    return self.getScrollBottomRow();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Number)

getScrollBottomRow :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Number
getScrollBottomRow self = runFn1 getScrollBottomRowImpl self

foreign import scrollToRowImpl
  "function scrollToRowImpl(row, self) {\
  \  return function() {\
  \    return self.scrollToRow(row);\
  \  };\
  \}" :: forall eff. Fn2 Number VirtualRenderer (Eff (ace :: EAce | eff) Unit)

scrollToRow :: forall eff. Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit
scrollToRow row self = runFn2 scrollToRowImpl row self

foreign import scrollToLineImpl
  "function scrollToLineImpl(line, center, animate, callback, self) {\
  \  return function() {\
  \    return self.scrollToLine(line, center, animate, callback);\
  \  };\
  \}" :: forall eff. Fn5 Number Boolean Boolean (Eff (ace :: EAce | eff) Unit) VirtualRenderer (Eff (ace :: EAce | eff) Unit)

scrollToLine :: forall eff. Number -> Boolean -> Boolean -> Eff (ace :: EAce | eff) Unit -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit
scrollToLine line center animate callback self = runFn5 scrollToLineImpl line center animate callback self

foreign import scrollToYImpl
  "function scrollToYImpl(scrollTop, self) {\
  \  return function() {\
  \    return self.scrollToY(scrollTop);\
  \  };\
  \}" :: forall eff. Fn2 Number VirtualRenderer (Eff (ace :: EAce | eff) Number)

scrollToY :: forall eff. Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Number
scrollToY scrollTop self = runFn2 scrollToYImpl scrollTop self

foreign import scrollToXImpl
  "function scrollToXImpl(scrollLeft, self) {\
  \  return function() {\
  \    return self.scrollToX(scrollLeft);\
  \  };\
  \}" :: forall eff. Fn2 Number VirtualRenderer (Eff (ace :: EAce | eff) Number)

scrollToX :: forall eff. Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Number
scrollToX scrollLeft self = runFn2 scrollToXImpl scrollLeft self

foreign import scrollByImpl
  "function scrollByImpl(deltaX, deltaY, self) {\
  \  return function() {\
  \    return self.scrollBy(deltaX, deltaY);\
  \  };\
  \}" :: forall eff. Fn3 Number Number VirtualRenderer (Eff (ace :: EAce | eff) Unit)

scrollBy :: forall eff. Number -> Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit
scrollBy deltaX deltaY self = runFn3 scrollByImpl deltaX deltaY self

foreign import isScrollableByImpl
  "function isScrollableByImpl(deltaX, deltaY, self) {\
  \  return function() {\
  \    return self.isScrollableBy(deltaX, deltaY);\
  \  };\
  \}" :: forall eff. Fn3 Number Number VirtualRenderer (Eff (ace :: EAce | eff) Boolean)

isScrollableBy :: forall eff. Number -> Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Boolean
isScrollableBy deltaX deltaY self = runFn3 isScrollableByImpl deltaX deltaY self

foreign import textToScreenCoordinatesImpl
  "function textToScreenCoordinatesImpl(row, column, self) {\
  \  return function() {\
  \    return self.textToScreenCoordinates(row, column);\
  \  };\
  \}" :: forall eff. Fn3 Number Number VirtualRenderer (Eff (ace :: EAce | eff) Position)

textToScreenCoordinates :: forall eff. Number -> Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Position
textToScreenCoordinates row column self = runFn3 textToScreenCoordinatesImpl row column self

foreign import visualizeFocusImpl
  "function visualizeFocusImpl(self) {\
  \  return function() {\
  \    return self.visualizeFocus();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Unit)

visualizeFocus :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit
visualizeFocus self = runFn1 visualizeFocusImpl self

foreign import visualizeBlurImpl
  "function visualizeBlurImpl(self) {\
  \  return function() {\
  \    return self.visualizeBlur();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Unit)

visualizeBlur :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit
visualizeBlur self = runFn1 visualizeBlurImpl self

foreign import showCompositionImpl
  "function showCompositionImpl(position, self) {\
  \  return function() {\
  \    return self.showComposition(position);\
  \  };\
  \}" :: forall eff. Fn2 Number VirtualRenderer (Eff (ace :: EAce | eff) Unit)

showComposition :: forall eff. Number -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit
showComposition position self = runFn2 showCompositionImpl position self

foreign import setCompositionTextImpl
  "function setCompositionTextImpl(text, self) {\
  \  return function() {\
  \    return self.setCompositionText(text);\
  \  };\
  \}" :: forall eff. Fn2 String VirtualRenderer (Eff (ace :: EAce | eff) Unit)

setCompositionText :: forall eff. String -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit
setCompositionText text self = runFn2 setCompositionTextImpl text self

foreign import hideCompositionImpl
  "function hideCompositionImpl(self) {\
  \  return function() {\
  \    return self.hideComposition();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Unit)

hideComposition :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit
hideComposition self = runFn1 hideCompositionImpl self

foreign import setThemeImpl
  "function setThemeImpl(theme, self) {\
  \  return function() {\
  \    return self.setTheme(theme);\
  \  };\
  \}" :: forall eff. Fn2 String VirtualRenderer (Eff (ace :: EAce | eff) Unit)

setTheme :: forall eff. String -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit
setTheme theme self = runFn2 setThemeImpl theme self

foreign import getThemeImpl
  "function getThemeImpl(self) {\
  \  return function() {\
  \    return self.getTheme();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) String)

getTheme :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) String
getTheme self = runFn1 getThemeImpl self

foreign import setStyleImpl
  "function setStyleImpl(style, self) {\
  \  return function() {\
  \    return self.setStyle(style);\
  \  };\
  \}" :: forall eff. Fn2 String VirtualRenderer (Eff (ace :: EAce | eff) Unit)

setStyle :: forall eff. String -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit
setStyle style self = runFn2 setStyleImpl style self

foreign import unsetStyleImpl
  "function unsetStyleImpl(style, self) {\
  \  return function() {\
  \    return self.unsetStyle(style);\
  \  };\
  \}" :: forall eff. Fn2 String VirtualRenderer (Eff (ace :: EAce | eff) Unit)

unsetStyle :: forall eff. String -> VirtualRenderer -> Eff (ace :: EAce | eff) Unit
unsetStyle style self = runFn2 unsetStyleImpl style self

foreign import destroyImpl
  "function destroyImpl(self) {\
  \  return function() {\
  \    return self.destroy();\
  \  };\
  \}" :: forall eff. Fn1 VirtualRenderer (Eff (ace :: EAce | eff) Unit)

destroy :: forall eff. VirtualRenderer -> Eff (ace :: EAce | eff) Unit
destroy self = runFn1 destroyImpl self

foreign import createImpl
  "function createImpl(container, theme) {\
  \  return function() {\
  \    var VirtualRenderer = ace.require('ace/virtual_renderer').VirtualRenderer;\
  \    return new VirtualRenderer(container, theme);\
  \  };\
  \}" :: forall eff. Fn2 HTMLElement (Nullable String) (Eff (ace :: EAce | eff) VirtualRenderer)

create :: forall eff. HTMLElement -> Maybe String -> Eff (ace :: EAce | eff) VirtualRenderer
create container theme = runFn2 createImpl container (toNullable theme)
