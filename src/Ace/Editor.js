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

export const getPasteEventText = effGet("text");
export const setPasteEventTextImpl = effSet("text");
export const getRenderer = effGet("renderer");
export const isInMultiSelectMode = effGet("inMultiSelectMode");
export const selectMoreLinesImpl = effize("selectMoreLines");
export const getContainer = effGet("container");
export const setKeyboardHandlerImpl = effize("setKeyboardHandler");
export const getKeyboardHandler = effize("getKeyboardHandler");
export const setSessionImpl = effize("setSession");
export const getSession = effize("getSession");
export const setValueImpl = effize("setValue");
export const getValue = effize("getValue");
export const getSelection = effize("getSelection");
export const resizeImpl = effize("resize");
export const setThemeImpl = effize("setTheme");
export const getTheme = effize("getTheme");
export const setStyleImpl = effize("setStyle");
export const unsetStyle = effize("unsetStyle");
export const setFontSizeImpl = effize("setFontSize");
export const focus = effize("focus");
export const isFocused = effize("isFocused");
export const blur = effize("blur");
export const getCopyText = effize("getCopyText");
export const insertImpl = effize("insert");
export const setOverwriteImpl = effize("setOverwrite");
export const getOverwrite = effize("getOverwrite");
export const toggleOverwrite = effize("toggleOverwrite");
export const setScrollSpeedImpl = effize("setScrollSpeed");
export const getScrollSpeed = effize("getScrollSpeed");
export const setDragDelayImpl = effize("setDragDelay");
export const getDragDelay = effize("getDragDelay");
export const setSelectionStyleImpl = effize("setSelectionStyle");
export const getSelectionStyle = effize("getSelectionStyle");
export const setHighlightActiveLineImpl = effize("setHighlightActiveLine");
export const getHighlightActiveLine = effize("getHighlightActiveLine");
export const setHighlightSelectedWordImpl = effize("setHighlightSelectedWord");
export const getHighlightSelectedWord = effize("getHighlightSelectedWord");
export const setShowInvisiblesImpl = effize("setShowInvisibles");
export const getShowInvisibles = effize("getShowInvisibles");
export const setShowPrintMarginImpl = effize("setShowPrintMargin");
export const getShowPrintMargin = effize("getShowPrintMargin");
export const setPrintMarginColumnImpl = effize("setPrintMarginColumn");
export const getPrintMarginColumn = effize("getPrintMarginColumn");
export const setReadOnlyImpl = effize("setReadOnly");
export const getReadOnly = effize("getReadOnly");
export const setBehavioursEnabledImpl = effize("setBehavioursEnabled");
export const getBehavioursEnabled = effize("getBehavioursEnabled");
export const setWrapBehavioursEnabledImpl = effize("setWrapBehavioursEnabled");
export const getWrapBehavioursEnabled = effize("getWrapBehavioursEnabled");
export const setShowFoldWidgetsImpl = effize("setShowFoldWidgets");
export const getShowFoldWidgets = effize("getShowFoldWidgets");
export const removeImpl = effize("remove");
export const removeWordRight = effize("removeWordRight");
export const removeWordLeft = effize("removeWordLeft");
export const removeToLineStart = effize("removeToLineStart");
export const removeToLineEnd = effize("removeToLineEnd");
export const splitLine = effize("splitLine");
export const transposeLetters = effize("transposeLetters");
export const toLowerCase = effize("toLowerCase");
export const toUpperCase = effize("toUpperCase");
export const indent = effize("indent");
export const blockIndent = effize("blockIndent");
export const blockOutdentImpl = effize("blockOutdent");
export const toggleCommentLines = effize("toggleCommentLines");
export const getNumberAt = effize("getNumberAt");
export const modifyNumberImpl = effize("modifyNumber");
export const removeLines = effize("removeLines");
export const moveLinesDown = effize("moveLinesDown");
export const moveLinesUp = effize("moveLinesUp");
export const copyLinesUp = effize("copyLinesUp");
export const copyLinesDown = effize("copyLinesDown");
export const getFirstVisibleRow = effize("getFirstVisibleRow");
export const getLastVisibleRow = effize("getLastVisibleRow");
export const isRowVisibleImpl = effize("isRowVisible");
export const isRowFullyVisibleImpl = effize("isRowFullyVisible");
export const selectPageDown = effize("selectPageDown");
export const selectPageUp = effize("selectPageUp");
export const gotoPageDown = effize("gotoPageDown");
export const gotoPageUp = effize("gotoPageUp");
export const scrollPageDown = effize("scrollPageDown");
export const scrollPageUp = effize("scrollPageUp");
export const scrollToRow = effize("scrollToRow");
export const scrollToLineImpl = effize("scrollToLine");
export const centerSelection = effize("centerSelection");
export const getCursorPosition = effize("getCursorPosition");
export const getCursorPositionScreen = effize("getCursorPositionScreen");
export const getSelectionRange = effize("getSelectionRange");
export const selectAll = effize("selectAll");
export const clearSelection = effize("clearSelection");
export const moveCursorToImpl = effize("moveCursorTo");
export const moveCursorToPositionImpl = effize("moveCursorToPosition");
export const jumpToMatching = effize("jumpToMatching");
export const gotoLineImpl = effize("gotoLine");
export const navigateToImpl = effize("navigateTo");
export const navigateUpImpl = effize("navigateUp");
export const navigateDownImpl = effize("navigateDown");
export const navigateLeftImpl = effize("navigateLeft");
export const navigateRightImpl = effize("navigateRight");
export const navigateLineStart = effize("navigateLineStart");
export const navigateLineEnd = effize("navigateLineEnd");
export const navigateFileEnd = effize("navigateFileEnd");
export const navigateFileStart = effize("navigateFileStart");
export const navigateWordRight = effize("navigateWordRight");
export const navigateWordLeft = effize("navigateWordLeft");
export const replaceImpl = effize("replace");
export const replaceAllImpl = effize("replaceAll");
export const getLastSearchOptions = effize("getLastSearchOptions");
export const findImpl = effize("find");
export const findNextImpl = effize("findNext");
export const findPreviousImpl = effize("findPrevious");
export const undo = effize("undo");
export const redo = effize("redo");
export const destroy = effize("destroy");

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
