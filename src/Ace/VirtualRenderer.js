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

export const getCharacterWidth = effGet("characterWidth");
export const getLineHeight = effGet("lineHeight");
export const screenToTextCoordinatesImpl = effize("screenToTextCoordinates");
export const setSessionImpl = effize("setSession");
export const updateLinesImpl = effize("updateLines");
export const updateText = effize("updateText");
export const updateFullImpl = effize("updateFull");
export const updateFontSize = effize("updateFontSize");
export const onResizeImpl = effize("onResize");
export const adjustWrapLimit = effize("adjustWrapLimit");
export const getAnimatedScroll = effize("getAnimatedScroll");
export const setAnimatedScrollImpl = effize("setAnimatedScroll");
export const setShowInvisiblesImpl = effize("setShowInvisibles");
export const getShowInvisibles = effize("getShowInvisibles");
export const setShowPrintMarginImpl = effize("setShowPrintMargin");
export const getShowPrintMargin = effize("getShowPrintMargin");
export const setPrintMarginColumnImpl = effize("setPrintMarginColumn");
export const getPrintMarginColumn = effize("getPrintMarginColumn");
export const getShowGutter = effize("getShowGutter");
export const setShowGutterImpl = effize("setShowGutter");
export const getContainerElement = effize("getContainerElement");
export const getMouseEventTarget = effize("getMouseEventTarget");
export const getTextAreaContainer = effize("getTextAreaContainer");
export const getFirstVisibleRow = effize("getFirstVisibleRow");
export const getFirstFullyVisibleRow = effize("getFirstFullyVisibleRow");
export const getLastFullyVisibleRow = effize("getLastFullyVisibleRow");
export const getLastVisibleRow = effize("getLastVisibleRow");
export const setPaddingImpl = effize("setPadding");
export const getHScrollBarAlwaysVisible = effize("getHScrollBarAlwaysVisible");
export const setHScrollBarAlwaysVisibleImpl = effize("setHScrollBarAlwaysVisible");
export const updateFrontMarkers = effize("updateFrontMarkers");
export const updateBackMarkers = effize("updateBackMarkers");
export const addGutterDecoration = effize("addGutterDecoration");
export const removeGutterDecoration = effize("removeGutterDecoration");
export const updateBreakpoints = effize("updateBreakpoints");
export const setAnnotationsImpl = effize("setAnnotations");
export const updateCursor = effize("updateCursor");
export const hideCursor = effize("hideCursor");
export const showCursor = effize("showCursor");
export const scrollCursorIntoView = effize("scrollCursorIntoView");
export const getScrollTop = effize("getScrollTop");
export const getScrollLeft = effize("getScrollLeft");
export const getScrollTopRow = effize("getScrollTopRow");
export const getScrollBottomRow = effize("getScrollBottomRow");
export const scrollToRowImpl = effize("scrollToRowImpl");
export const scrollToLineImpl = effize("scrollToLine");
export const scrollToYImpl = effize("scrollToY");
export const scrollToXImpl = effize("scrollToX");
export const scrollByImpl = effize("scrollBy");
export const isScrollableByImpl = effize("isScrollableBy");
export const textToScreenCoordinatesImpl = effize("textToScreenCoordinates");
export const visualizeFocus = effize("visualizeFocus");
export const visualizeBlur = effize("visualizeBlur");
export const showCompositionImpl = effize("showComposition");
export const setCompositionTextImpl = effize("setCompositionText");
export const hideComposition = effize("hideComposition");
export const setThemeImpl = effize("setTheme");
export const getTheme = effize("getTheme");
export const setStyleImpl = effize("setStyle");
export const unsetStyleImpl = effize("unsetStyle");
export const destroy = effize("destroy");

export function createImpl(container, theme) {
  return function () {
    var VirtualRenderer = ace.require("ace/virtual_renderer").VirtualRenderer;
    return new VirtualRenderer(container, theme);
  };
}
