"use strict";

import ace from "ace-builds";

function effize(method) {
  return function () {
    var me = arguments[arguments.length - 1];
    var args = Array.prototype.slice.call(arguments, 0, -1);
    return function () {
      return me[method].apply(me, args);
    };
  };
}

function effGet(field) {
  return function (self) {
    return function () {
      return self[field];
    };
  };
}

export var getCharacterWidth = effGet("characterWidth");
export var getLineHeight = effGet("lineHeight");
export var screenToTextCoordinatesImpl = effize("screenToTextCoordinates");
export var setSessionImpl = effize("setSession");
export var updateLinesImpl = effize("updateLines");
export var updateText = effize("updateText");
export var updateFullImpl = effize("updateFull");
export var updateFontSize = effize("updateFontSize");
export var onResizeImpl = effize("onResize");
export var adjustWrapLimit = effize("adjustWrapLimit");
export var getAnimatedScroll = effize("getAnimatedScroll");
export var setAnimatedScrollImpl = effize("setAnimatedScroll");
export var setShowInvisiblesImpl = effize("setShowInvisibles");
export var getShowInvisibles = effize("getShowInvisibles");
export var setShowPrintMarginImpl = effize("setShowPrintMargin");
export var getShowPrintMargin = effize("getShowPrintMargin");
export var setPrintMarginColumnImpl = effize("setPrintMarginColumn");
export var getPrintMarginColumn = effize("getPrintMarginColumn");
export var getShowGutter = effize("getShowGutter");
export var setShowGutterImpl = effize("setShowGutter");
export var getContainerElement = effize("getContainerElement");
export var getMouseEventTarget = effize("getMouseEventTarget");
export var getTextAreaContainer = effize("getTextAreaContainer");
export var getFirstVisibleRow = effize("getFirstVisibleRow");
export var getFirstFullyVisibleRow = effize("getFirstFullyVisibleRow");
export var getLastFullyVisibleRow = effize("getLastFullyVisibleRow");
export var getLastVisibleRow = effize("getLastVisibleRow");
export var setPaddingImpl = effize("setPadding");
export var getHScrollBarAlwaysVisible = effize("getHScrollBarAlwaysVisible");
export var setHScrollBarAlwaysVisibleImpl = effize("setHScrollBarAlwaysVisible");
export var updateFrontMarkers = effize("updateFrontMarkers");
export var updateBackMarkers = effize("updateBackMarkers");
export var addGutterDecoration = effize("addGutterDecoration");
export var removeGutterDecoration = effize("removeGutterDecoration");
export var updateBreakpoints = effize("updateBreakpoints");
export var setAnnotationsImpl = effize("setAnnotations");
export var updateCursor = effize("updateCursor");
export var hideCursor = effize("hideCursor");
export var showCursor = effize("showCursor");
export var scrollCursorIntoView = effize("scrollCursorIntoView");
export var getScrollTop = effize("getScrollTop");
export var getScrollLeft = effize("getScrollLeft");
export var getScrollTopRow = effize("getScrollTopRow");
export var getScrollBottomRow = effize("getScrollBottomRow");
export var scrollToRowImpl = effize("scrollToRowImpl");
export var scrollToLineImpl = effize("scrollToLine");
export var scrollToYImpl = effize("scrollToY");
export var scrollToXImpl = effize("scrollToX");
export var scrollByImpl = effize("scrollBy");
export var isScrollableByImpl = effize("isScrollableBy");
export var textToScreenCoordinatesImpl = effize("textToScreenCoordinates");
export var visualizeFocus = effize("visualizeFocus");
export var visualizeBlur = effize("visualizeBlur");
export var showCompositionImpl = effize("showComposition");
export var setCompositionTextImpl = effize("setCompositionText");
export var hideComposition = effize("hideComposition");
export var setThemeImpl = effize("setTheme");
export var getTheme = effize("getTheme");
export var setStyleImpl = effize("setStyle");
export var unsetStyleImpl = effize("unsetStyle");
export var destroy = effize("destroy");

export function createImpl(container, theme) {
  return function () {
    var VirtualRenderer = ace.require("ace/virtual_renderer").VirtualRenderer;
    return new VirtualRenderer(container, theme);
  };
}
