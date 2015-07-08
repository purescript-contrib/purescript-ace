// module Ace.Editor

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



exports.onImpl = function(event, fn, self) {
    return function() {
        return self.on(event, function(e) {
            fn(e)();
        });
    };
};
exports.getPasteEvent = effGet("text");
exports.setPasteEvent = effSet("text");
exports.getRenderer = effGet("renderer");
exports.isInMultiSelectMode = effGet("inMultiSelectMode");
exports.selectMoreLinesImpl = effize("selectMoreLines");
exports.getContainer = effGet("container");
exports.setKeyboardHandlerImpl = effize("setKeyboardHandler");
exports.getKeyboardHandlerImpl = effize("getKeyboardHandler");
exports.setSessionImpl = effize("setSession");
exports.getSessionImpl = effize("getSession");
exports.setValueImpl = effize("setValue");
exports.getValueImpl = effize("getValue");
exports.getSelectionImpl = effize("getSelection");
exports.resizeImpl = effize("resize");
exports.setThemeImpl = effize("setTheme");
exports.getThemeImpl = effize("getTheme");
exports.setStyleImpl = effize("setStyle");
exports.unsetStyleImpl = effize("unsetStyle");
exports.setFontSizeImpl = effize("setFontSize");
exports.focusImpl = effize("focus");
exports.isFocusedImpl = effize("isFocused");
exports.blurImpl = effize("blur");
exports.getCopyTextImpl = effize("getCopyText");
exports.insertImpl = effize("insert");
exports.setOverwriteImpl = effize("setOverwrite");
exports.getOverwriteImpl = effize("getOverwrite");
exports.toggleOverwriteImpl = effize("toggleOverwrite");
exports.setScrollSpeedImpl = effize("setScrollSpeed");
exports.getScrollSpeedImpl = effize("getScrollSpeed");
exports.setDragDelayImpl = effize("setDragDelay");
exports.getDragDelayImpl = effize("getDragDelay");
exports.setSelectionStyleImpl = effize("setSelectionStyle");
exports.getSelectionStyleImpl = effize("getSelectionStyle");
exports.setHighlightActiveLineImpl = effize("setHighlightActiveLine");
exports.getHighlightActiveLineImpl = effize("getHighlightActiveLine");
exports.setHighlightSelectedWordImpl = effize("setHighlightSelectedWord");
exports.getHighlightSelectedWordImpl = effize("getHighlightSelectedWord");
exports.setShowInvisiblesImpl = effize("setShowInvisibles");
exports.getShowInvisiblesImpl = effize("getShowInvisibles");
exports.setShowPrintMarginImpl = effize("setShowPrintMargin");
exports.getShowPrintMarginImpl = effize("getShowPrintMargin");
exports.setPrintMarginColumnImpl = effize("setPrintMarginColumn");
exports.getPrintMarginColumnImpl = effize("getPrintMarginColumn");
exports.setReadOnlyImpl = effize("setReadOnly");
exports.getReadOnlyImpl = effize("getReadOnly");
exports.setBehavioursEnabledImpl = effize("setBehavioursEnabled");
exports.getBehavioursEnabledImpl = effize("getBehavioursEnabled");
exports.setWrapBehavioursEnabledImpl = effize("setWrapBehavioursEnabled");
exports.getWrapBehavioursEnabledImpl = effize("getWrapBehavioursEnabled");
exports.setShowFoldWidgetsImpl = effize("setShowFoldWidgets");
exports.getShowFoldWidgetsImpl = effize("getShowFoldWidgets");
exports.removeImpl = effize("remove");
exports.removeWordRightImpl = effize("removeWordRight");
exports.removeWordLeftImpl = effize("removeWordLeft");
exports.removeToLineStartImpl = effize("removeToLineStart");
exports.removeToLineEndImpl = effize("removeToLineEnd");
exports.splitLineImpl = effize("splitLine");
exports.transposeLettersImpl = effize("transposeLetters");
exports.toLowerCaseImpl = effize("toLowerCase");
exports.toUpperCaseImpl = effize("toUpperCase");
exports.indentImpl = effize("indent");
exports.blockIndentImpl = effize("blockIndent");
exports.blockOutdentImpl = effize("blockOutdent");
exports.toggleCommentLinesImpl = effize("toggleCommentLines");
exports.getNumberAtImpl = effize("getNumberAt");
exports.modifyNumberImpl = effize("modifyNumber");
exports.removeLinesImpl = effize("removeLines");
exports.moveLinesDownImpl = effize("moveLinesDown");
exports.moveLinesUpImpl = effize("moveLinesUp");
exports.copyLinesUpImpl = effize("copyLinesUp");
exports.copyLinesDownImpl = effize("copyLinesDown");
exports.getFirstVisibleRowImpl = effize("getFirstVisibleRow");
exports.getLastVisibleRowImpl = effize("getLastVisibleRow");
exports.isRowVisibleImpl = effize("isRowVisible");
exports.isRowFullyVisibleImpl = effize("isRowFullyVisible");
exports.selectPageDownImpl = effize('selectPageDown');
exports.selectPageUpImpl = effize("selectPageUp");
exports.gotoPageDownImpl = effize("gotoPageDown");
exports.gotoPageUpImpl = effize("gotoPageUp");
exports.scrollPageDownImpl = effize("scrollPageDown");
exports.scrollPageUpImpl = effize("scrollPageUp");
exports.scrollToRowImpl = effize("scrollToRow");
exports.scrollToLineImpl = effize("scrollToLine");
exports.centerSelectionImpl = effize("centerSelection");
exports.getCursorPositionImpl = effize("getCursorPosition");
exports.getCursorPositionScreenImpl = effize("getCursorPositionScreen");
exports.getSelectionRangeImpl = effize("getSelectionRange");
exports.selectAllImpl = effize("selectAll");
exports.clearSelectionImpl = effize("clearSelection");
exports.moveCursorToImpl = effize("moveCursorTo");
exports.moveCursorToPositionImpl = effize("moveCursorToPosition");
exports.jumpToMatchingImpl = effize("jumpToMatching");
exports.gotoLineImpl = effize("gotoLine");
exports.navigateToImpl = effize("navigateTo");
exports.navigateUpImpl = effize("navigateUp");
exports.navigateDownImpl = effize("navigateDown");
exports.navigateLeftImpl = effize("navigateLeft");
exports.navigateRightImpl = effize("navigateRight");
exports.navigateLineStartImpl = effize("navigateLineStart");
exports.navigateLineEndImpl = effize('navigateLineEnd');
exports.navigateFileEndImpl = effize('navigateFileEnd');
exports.navigateFileStartImpl = effize('navigateFileStart');
exports.navigateWordRightImpl = effize('navigateWordRight');
exports.navigateWordLeftImpl = effize('navigateWordLeft');
exports.replaceImpl = effize('replace');
exports.replaceAllImpl = effize('replaceAll');
exports.getLastSearchOptionsImpl = effize('getLastSearchOptions');
exports.findImpl = effize('find');
exports.findNextImpl = effize('findNext');
exports.findPreviousImpl = effize('findPrevious');
exports.undoImpl = effize('undo');
exports.redoImpl = effize('redo');
exports.destroyImpl = effize('destroy');
exports.createImpl = function(renderer, session) {
    return function() {
        return new Editor(renderer, session);
    };
}

