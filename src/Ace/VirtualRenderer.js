// module Ace.VirtualRenderer


function effize(method) {
    return function() {
        var me = arguments[arguments.length - 1],
            args = Array.prototype.slice.call(arguments, 0, -1);
        return function() {
            return me[method].apply(me, args);
        };
    };
}

function effGet(field) {
    return function(self) {
        return function() {
            return self[field];
        };
    };
}

function effSet(field) {
    return function(val, self) {
        return function() {
            self[field] = val;
        };
    };
}


exports.getCharacterWidth = effGet('characterWidth');
exports.getLineHeight = effGet('lineHeight');
exports.screenToTextCoordinatesImpl = effize('screenToTextCoordinates');
exports.setSessionImpl = effize('setSession');
exports.updateLinesImpl = effize('updateLines');
exports.updateTextImpl = effize('updateText');
exports.updateFullImpl = effize('updateFull');
exports.updateFontSizeImpl = effize('updateFontSize');
exports.onResizeImpl = effize('onResize');
exports.adjustWrapLimitImpl = effize('adjustWrapLimit');
exports.setAnimatedScrollImpl = effize('setAnimatedScroll');
exports.getAnimatedScrollImpl = effize('getAnimatedScroll');
exports.setShowInvisiblesImpl = effize('setShowInvisibles');
exports.getShowInvisiblesImpl = effize('getShowInvisibles');
exports.setShowPrintMarginImpl = effize('setShowPrintMargin');
exports.getShowPrintMarginImpl = effize('getShowPrintMargin');
exports.setPrintMarginColumnImpl = effize('setPrintMarginColumn');
exports.getPrintMarginColumnImpl = effize('getPrintMarginColumn');
exports.getShowGutterImpl = effize('getShowGutter');
exports.setShowGutterImpl = effize('setShowGutter');
exports.getContainerElementImpl = effize('getContainerElement');
exports.getMouseEventTargetImpl = effize('getMouseEventTarget');
exports.getTextAreaContainerImpl = effize('getTextAreaContainer');
exports.getFirstVisibleRowImpl = effize('getFirstVisibleRow');
exports.getFirstFullyVisibleRowImpl = effize('getFirstFullyVisibleRow');
exports.getLastFullyVisibleRowImpl = effize('getLastFullyVisibleRow');
exports.getLastVisibleRowImpl = effize('getLastVisibleRow');
exports.setPaddingImpl = effize('setPadding');
exports.getHScrollBarAlwaysVisibleImpl = effize('getHScrollBarAlwaysVisible');
exports.setHScrollBarAlwaysVisibleImpl = effize('setHScrollBarAlwaysVisible');
exports.updateFrontMarkerImpl = effize('updateFrontMarker');
exports.updateBackMarkersImpl = effize('updateBackMarkers');
exports.addGutterDecorationImpl = effize('addGutterDecoration');
exports.removeGutterDecorationImpl = effize('removeGutterDecoration');
exports.updateBreakpointsImpl = effize('updateBreakpoints');
exports.setAnnotationsImpl = effize('setAnnotations');
exports.updateCursorImpl = effize('updateCursor');
exports.hideCursorImpl = effize('hideCursor');
exports.showCursorImpl = effize('showCursor');
exports.scrollCursorIntoViewImpl = effize('scrollCursorIntoView');
exports.getScrollTopImpl = effize('getScrollTop');
exports.getScrollLeftImpl = effize('getScrollLeft');
exports.getScrollTopRowImpl = effize('getScrollTopRow');
exports.getScrollBottomRowImpl = effize('getScrollBottomRow');
exports.scrollToRowImpl = effize('scrollToRowImpl');
exports.scrollToLineImpl = effize('scrollToLine');
exports.scrolLToYImpl = effize('scrollToY');
exports.scrollToXImpl = effize('scrollToX');
exports.scrollByImpl = effize('scrollBy');
exports.isScrollableByImpl = effize('isScrollableBy');
exports.textToScreenCoordinatesImpl = effize('textToScreenCoordinates');
exports.visualizeFocusImpl = effize('visualizeFocus');
exports.visualizeBlurImpl = effize('visualizeBlur');
exports.showCompositionImpl = effize('showComposition');
exports.setCompositionTextImpl = effize('setCompositionText');
exports.hideCompositionImpl = effize('hideComposition');
exports.setThemeImpl = effize('setTheme');
exports.getThemeImpl = effize('getTheme');
exports.setStyleImpl = effize('setStyle');
exports.unsetStyleImpl = effize('unsetStyle');
exports.destroyImpl = effize('destroy');
exports.createImpl = function(container, theme) {
    return function() {
        var VirtualRenderer = ace.require('ace/virtual_renderer').VirtualRenderer;
        return new VirtualRenderer(container, theme);
    };
};

