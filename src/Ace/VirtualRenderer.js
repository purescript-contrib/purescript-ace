"use strict";

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

exports.getCharacterWidth = effGet("characterWidth");
exports.getLineHeight = effGet("lineHeight");
exports.screenToTextCoordinatesImpl = effize("screenToTextCoordinates");
exports.setSessionImpl = effize("setSession");
exports.updateLinesImpl = effize("updateLines");
exports.updateText = effize("updateText");
exports.updateFullImpl = effize("updateFull");
exports.updateFontSize = effize("updateFontSize");
exports.onResizeImpl = effize("onResize");
exports.adjustWrapLimit = effize("adjustWrapLimit");
exports.getAnimatedScroll = effize("getAnimatedScroll");
exports.setAnimatedScrollImpl = effize("setAnimatedScroll");
exports.setShowInvisiblesImpl = effize("setShowInvisibles");
exports.getShowInvisibles = effize("getShowInvisibles");
exports.setShowPrintMarginImpl = effize("setShowPrintMargin");
exports.getShowPrintMargin = effize("getShowPrintMargin");
exports.setPrintMarginColumnImpl = effize("setPrintMarginColumn");
exports.getPrintMarginColumn = effize("getPrintMarginColumn");
exports.getShowGutter = effize("getShowGutter");
exports.setShowGutterImpl = effize("setShowGutter");
exports.getContainerElement = effize("getContainerElement");
exports.getMouseEventTarget = effize("getMouseEventTarget");
exports.getTextAreaContainer = effize("getTextAreaContainer");
exports.getFirstVisibleRow = effize("getFirstVisibleRow");
exports.getFirstFullyVisibleRow = effize("getFirstFullyVisibleRow");
exports.getLastFullyVisibleRow = effize("getLastFullyVisibleRow");
exports.getLastVisibleRow = effize("getLastVisibleRow");
exports.setPaddingImpl = effize("setPadding");
exports.getHScrollBarAlwaysVisible = effize("getHScrollBarAlwaysVisible");
exports.setHScrollBarAlwaysVisibleImpl = effize("setHScrollBarAlwaysVisible");
exports.updateFrontMarkers = effize("updateFrontMarkers");
exports.updateBackMarkers = effize("updateBackMarkers");
exports.addGutterDecoration = effize("addGutterDecoration");
exports.removeGutterDecoration = effize("removeGutterDecoration");
exports.updateBreakpoints = effize("updateBreakpoints");
exports.setAnnotationsImpl = effize("setAnnotations");
exports.updateCursor = effize("updateCursor");
exports.hideCursor = effize("hideCursor");
exports.showCursor = effize("showCursor");
exports.scrollCursorIntoView = effize("scrollCursorIntoView");
exports.getScrollTop = effize("getScrollTop");
exports.getScrollLeft = effize("getScrollLeft");
exports.getScrollTopRow = effize("getScrollTopRow");
exports.getScrollBottomRow = effize("getScrollBottomRow");
exports.scrollToRowImpl = effize("scrollToRowImpl");
exports.scrollToLineImpl = effize("scrollToLine");
exports.scrollToYImpl = effize("scrollToY");
exports.scrollToXImpl = effize("scrollToX");
exports.scrollByImpl = effize("scrollBy");
exports.isScrollableByImpl = effize("isScrollableBy");
exports.textToScreenCoordinatesImpl = effize("textToScreenCoordinates");
exports.visualizeFocus = effize("visualizeFocus");
exports.visualizeBlur = effize("visualizeBlur");
exports.showCompositionImpl = effize("showComposition");
exports.setCompositionTextImpl = effize("setCompositionText");
exports.hideComposition = effize("hideComposition");
exports.setThemeImpl = effize("setTheme");
exports.getTheme = effize("getTheme");
exports.setStyleImpl = effize("setStyle");
exports.unsetStyleImpl = effize("unsetStyle");
exports.destroy = effize("destroy");

exports.createImpl = function (container, theme) {
  return function () {
    var VirtualRenderer = ace.require("ace/virtual_renderer").VirtualRenderer;
    return new VirtualRenderer(container, theme);
  };
};
