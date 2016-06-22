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

function effSet(field) {
  return function (val, self) {
    return function () {
      self[field] = val;
    };
  };
}

exports.onImpl = function (event, fn, self) {
  return function () {
    return self.on(event, function (e) {
      fn(e)();
    });
  };
};

exports.getPasteEventText = effGet("text");
exports.setPasteEventTextImpl = effSet("text");
exports.getRenderer = effGet("renderer");
exports.isInMultiSelectMode = effGet("inMultiSelectMode");
exports.selectMoreLinesImpl = effize("selectMoreLines");
exports.getContainer = effGet("container");
exports.setKeyboardHandlerImpl = effize("setKeyboardHandler");
exports.getKeyboardHandler = effize("getKeyboardHandler");
exports.setSessionImpl = effize("setSession");
exports.getSession = effize("getSession");
exports.setValueImpl = effize("setValue");
exports.getValue = effize("getValue");
exports.getSelection = effize("getSelection");
exports.resizeImpl = effize("resize");
exports.setThemeImpl = effize("setTheme");
exports.getTheme = effize("getTheme");
exports.setStyleImpl = effize("setStyle");
exports.unsetStyle = effize("unsetStyle");
exports.setFontSizeImpl = effize("setFontSize");
exports.focus = effize("focus");
exports.isFocused = effize("isFocused");
exports.blur = effize("blur");
exports.getCopyText = effize("getCopyText");
exports.insertImpl = effize("insert");
exports.setOverwriteImpl = effize("setOverwrite");
exports.getOverwrite = effize("getOverwrite");
exports.toggleOverwrite = effize("toggleOverwrite");
exports.setScrollSpeedImpl = effize("setScrollSpeed");
exports.getScrollSpeed = effize("getScrollSpeed");
exports.setDragDelayImpl = effize("setDragDelay");
exports.getDragDelay = effize("getDragDelay");
exports.setSelectionStyleImpl = effize("setSelectionStyle");
exports.getSelectionStyle = effize("getSelectionStyle");
exports.setHighlightActiveLineImpl = effize("setHighlightActiveLine");
exports.getHighlightActiveLine = effize("getHighlightActiveLine");
exports.setHighlightSelectedWordImpl = effize("setHighlightSelectedWord");
exports.getHighlightSelectedWord = effize("getHighlightSelectedWord");
exports.setShowInvisiblesImpl = effize("setShowInvisibles");
exports.getShowInvisibles = effize("getShowInvisibles");
exports.setShowPrintMarginImpl = effize("setShowPrintMargin");
exports.getShowPrintMargin = effize("getShowPrintMargin");
exports.setPrintMarginColumnImpl = effize("setPrintMarginColumn");
exports.getPrintMarginColumn = effize("getPrintMarginColumn");
exports.setReadOnlyImpl = effize("setReadOnly");
exports.getReadOnly = effize("getReadOnly");
exports.setBehavioursEnabledImpl = effize("setBehavioursEnabled");
exports.getBehavioursEnabled = effize("getBehavioursEnabled");
exports.setWrapBehavioursEnabledImpl = effize("setWrapBehavioursEnabled");
exports.getWrapBehavioursEnabled = effize("getWrapBehavioursEnabled");
exports.setShowFoldWidgetsImpl = effize("setShowFoldWidgets");
exports.getShowFoldWidgets = effize("getShowFoldWidgets");
exports.removeImpl = effize("remove");
exports.removeWordRight = effize("removeWordRight");
exports.removeWordLeft = effize("removeWordLeft");
exports.removeToLineStart = effize("removeToLineStart");
exports.removeToLineEnd = effize("removeToLineEnd");
exports.splitLine = effize("splitLine");
exports.transposeLetters = effize("transposeLetters");
exports.toLowerCase = effize("toLowerCase");
exports.toUpperCase = effize("toUpperCase");
exports.indent = effize("indent");
exports.blockIndent = effize("blockIndent");
exports.blockOutdentImpl = effize("blockOutdent");
exports.toggleCommentLines = effize("toggleCommentLines");
exports.getNumberAt = effize("getNumberAt");
exports.modifyNumberImpl = effize("modifyNumber");
exports.removeLines = effize("removeLines");
exports.moveLinesDown = effize("moveLinesDown");
exports.moveLinesUp = effize("moveLinesUp");
exports.copyLinesUp = effize("copyLinesUp");
exports.copyLinesDown = effize("copyLinesDown");
exports.getFirstVisibleRow = effize("getFirstVisibleRow");
exports.getLastVisibleRow = effize("getLastVisibleRow");
exports.isRowVisibleImpl = effize("isRowVisible");
exports.isRowFullyVisibleImpl = effize("isRowFullyVisible");
exports.selectPageDown = effize("selectPageDown");
exports.selectPageUp = effize("selectPageUp");
exports.gotoPageDown = effize("gotoPageDown");
exports.gotoPageUp = effize("gotoPageUp");
exports.scrollPageDown = effize("scrollPageDown");
exports.scrollPageUp = effize("scrollPageUp");
exports.scrollToRow = effize("scrollToRow");
exports.scrollToLineImpl = effize("scrollToLine");
exports.centerSelection = effize("centerSelection");
exports.getCursorPosition = effize("getCursorPosition");
exports.getCursorPositionScreen = effize("getCursorPositionScreen");
exports.getSelectionRange = effize("getSelectionRange");
exports.selectAll = effize("selectAll");
exports.clearSelection = effize("clearSelection");
exports.moveCursorToImpl = effize("moveCursorTo");
exports.moveCursorToPositionImpl = effize("moveCursorToPosition");
exports.jumpToMatching = effize("jumpToMatching");
exports.gotoLineImpl = effize("gotoLine");
exports.navigateToImpl = effize("navigateTo");
exports.navigateUpImpl = effize("navigateUp");
exports.navigateDownImpl = effize("navigateDown");
exports.navigateLeftImpl = effize("navigateLeft");
exports.navigateRightImpl = effize("navigateRight");
exports.navigateLineStart = effize("navigateLineStart");
exports.navigateLineEnd = effize("navigateLineEnd");
exports.navigateFileEnd = effize("navigateFileEnd");
exports.navigateFileStart = effize("navigateFileStart");
exports.navigateWordRight = effize("navigateWordRight");
exports.navigateWordLeft = effize("navigateWordLeft");
exports.replaceImpl = effize("replace");
exports.replaceAllImpl = effize("replaceAll");
exports.getLastSearchOptions = effize("getLastSearchOptions");
exports.findImpl = effize("find");
exports.findNextImpl = effize("findNext");
exports.findPreviousImpl = effize("findPrevious");
exports.undo = effize("undo");
exports.redo = effize("redo");
exports.destroy = effize("destroy");

exports.setOption = function (s) {
  return function (a) {
    return function (editor) {
      return function () {
        editor.setOption(s, a);
      };
    };
  };
};

exports.createImpl = function (renderer, session) {
  return function () {
    return new Editor(renderer, session);
  };
};

exports.getKeyBinding = function (editor) {
  return function () {
    return editor.keyBinding;
  };
};
