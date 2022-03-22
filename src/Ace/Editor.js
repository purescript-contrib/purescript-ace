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

function effSet(field) {
  return function (val, self) {
    return function () {
      self[field] = val;
    };
  };
}

export function onImpl(event, fn, self) {
  return function () {
    return self.on(event, function (e) {
      fn(e)();
    });
  };
}

export var getPasteEventText = effGet("text");
export var setPasteEventTextImpl = effSet("text");
export var getRenderer = effGet("renderer");
export var isInMultiSelectMode = effGet("inMultiSelectMode");
export var selectMoreLinesImpl = effize("selectMoreLines");
export var getContainer = effGet("container");
export var setKeyboardHandlerImpl = effize("setKeyboardHandler");
export var getKeyboardHandler = effize("getKeyboardHandler");
export var setSessionImpl = effize("setSession");
export var getSession = effize("getSession");
export var setValueImpl = effize("setValue");
export var getValue = effize("getValue");
export var getSelection = effize("getSelection");
export var resizeImpl = effize("resize");
export var setThemeImpl = effize("setTheme");
export var getTheme = effize("getTheme");
export var setStyleImpl = effize("setStyle");
export var unsetStyle = effize("unsetStyle");
export var setFontSizeImpl = effize("setFontSize");
export var focus = effize("focus");
export var isFocused = effize("isFocused");
export var blur = effize("blur");
export var getCopyText = effize("getCopyText");
export var insertImpl = effize("insert");
export var setOverwriteImpl = effize("setOverwrite");
export var getOverwrite = effize("getOverwrite");
export var toggleOverwrite = effize("toggleOverwrite");
export var setScrollSpeedImpl = effize("setScrollSpeed");
export var getScrollSpeed = effize("getScrollSpeed");
export var setDragDelayImpl = effize("setDragDelay");
export var getDragDelay = effize("getDragDelay");
export var setSelectionStyleImpl = effize("setSelectionStyle");
export var getSelectionStyle = effize("getSelectionStyle");
export var setHighlightActiveLineImpl = effize("setHighlightActiveLine");
export var getHighlightActiveLine = effize("getHighlightActiveLine");
export var setHighlightSelectedWordImpl = effize("setHighlightSelectedWord");
export var getHighlightSelectedWord = effize("getHighlightSelectedWord");
export var setShowInvisiblesImpl = effize("setShowInvisibles");
export var getShowInvisibles = effize("getShowInvisibles");
export var setShowPrintMarginImpl = effize("setShowPrintMargin");
export var getShowPrintMargin = effize("getShowPrintMargin");
export var setPrintMarginColumnImpl = effize("setPrintMarginColumn");
export var getPrintMarginColumn = effize("getPrintMarginColumn");
export var setReadOnlyImpl = effize("setReadOnly");
export var getReadOnly = effize("getReadOnly");
export var setBehavioursEnabledImpl = effize("setBehavioursEnabled");
export var getBehavioursEnabled = effize("getBehavioursEnabled");
export var setWrapBehavioursEnabledImpl = effize("setWrapBehavioursEnabled");
export var getWrapBehavioursEnabled = effize("getWrapBehavioursEnabled");
export var setShowFoldWidgetsImpl = effize("setShowFoldWidgets");
export var getShowFoldWidgets = effize("getShowFoldWidgets");
export var removeImpl = effize("remove");
export var removeWordRight = effize("removeWordRight");
export var removeWordLeft = effize("removeWordLeft");
export var removeToLineStart = effize("removeToLineStart");
export var removeToLineEnd = effize("removeToLineEnd");
export var splitLine = effize("splitLine");
export var transposeLetters = effize("transposeLetters");
export var toLowerCase = effize("toLowerCase");
export var toUpperCase = effize("toUpperCase");
export var indent = effize("indent");
export var blockIndent = effize("blockIndent");
export var blockOutdentImpl = effize("blockOutdent");
export var toggleCommentLines = effize("toggleCommentLines");
export var getNumberAt = effize("getNumberAt");
export var modifyNumberImpl = effize("modifyNumber");
export var removeLines = effize("removeLines");
export var moveLinesDown = effize("moveLinesDown");
export var moveLinesUp = effize("moveLinesUp");
export var copyLinesUp = effize("copyLinesUp");
export var copyLinesDown = effize("copyLinesDown");
export var getFirstVisibleRow = effize("getFirstVisibleRow");
export var getLastVisibleRow = effize("getLastVisibleRow");
export var isRowVisibleImpl = effize("isRowVisible");
export var isRowFullyVisibleImpl = effize("isRowFullyVisible");
export var selectPageDown = effize("selectPageDown");
export var selectPageUp = effize("selectPageUp");
export var gotoPageDown = effize("gotoPageDown");
export var gotoPageUp = effize("gotoPageUp");
export var scrollPageDown = effize("scrollPageDown");
export var scrollPageUp = effize("scrollPageUp");
export var scrollToRow = effize("scrollToRow");
export var scrollToLineImpl = effize("scrollToLine");
export var centerSelection = effize("centerSelection");
export var getCursorPosition = effize("getCursorPosition");
export var getCursorPositionScreen = effize("getCursorPositionScreen");
export var getSelectionRange = effize("getSelectionRange");
export var selectAll = effize("selectAll");
export var clearSelection = effize("clearSelection");
export var moveCursorToImpl = effize("moveCursorTo");
export var moveCursorToPositionImpl = effize("moveCursorToPosition");
export var jumpToMatching = effize("jumpToMatching");
export var gotoLineImpl = effize("gotoLine");
export var navigateToImpl = effize("navigateTo");
export var navigateUpImpl = effize("navigateUp");
export var navigateDownImpl = effize("navigateDown");
export var navigateLeftImpl = effize("navigateLeft");
export var navigateRightImpl = effize("navigateRight");
export var navigateLineStart = effize("navigateLineStart");
export var navigateLineEnd = effize("navigateLineEnd");
export var navigateFileEnd = effize("navigateFileEnd");
export var navigateFileStart = effize("navigateFileStart");
export var navigateWordRight = effize("navigateWordRight");
export var navigateWordLeft = effize("navigateWordLeft");
export var replaceImpl = effize("replace");
export var replaceAllImpl = effize("replaceAll");
export var getLastSearchOptions = effize("getLastSearchOptions");
export var findImpl = effize("find");
export var findNextImpl = effize("findNext");
export var findPreviousImpl = effize("findPrevious");
export var undo = effize("undo");
export var redo = effize("redo");
export var destroy = effize("destroy");

export function setOption(s) {
  return function (a) {
    return function (editor) {
      return function () {
        editor.setOption(s, a);
      };
    };
  };
}

export function createImpl(renderer, session) {
  return function () {
    var Editor = ace.require("ace/editor");
    return new Editor(renderer, session);
  };
}

export function getKeyBinding(editor) {
  return function () {
    return editor.keyBinding;
  };
}
