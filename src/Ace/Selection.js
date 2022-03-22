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

export function onImpl(ev, fn, self) {
  return function () {
    return self.on(ev, function () {
      fn();
    });
  };
}

export const moveCursorWordLeft = effize("moveCursorWordLeft");
export const moveCursorWordRight = effize("moveCursorWordRight");
export const fromOrientedRangeImpl = effize("fromOrientedRange");
export const setSelectionRangeImpl = effize("setSelectionRange");
export const getAllRanges = effize("getAllRanges");
export const addRangeImpl = effize("addRange");
export const isEmpty = effize("isEmpty");
export const isMultiLine = effize("isMultiLine");
export const getCursor = effize("getCursor");
export const setSelectionAnchorImpl = effize("setSelectionAnchor");
export const getSelectionAnchor = effize("getSelectionAnchor");
export const getSelectionLead = effize("getSelectionLead");
export const shiftSelectionImpl = effize("shiftSelection");
export const isBackwards = effize("isBackwards");
export const getRange = effize("getRange");
export const clearSelection = effize("clearSelection");
export const selectAll = effize("selectAll");
export const setRangeImpl = effize("setRange");
export const selectToImpl = effize("selectTo");
export const selectToPositionImpl = effize("selectToPosition");
export const selectUp = effize("selectUp");
export const selectDown = effize("selectDown");
export const selectRight = effize("selectRight");
export const selectLeft = effize("selectLeft");
export const selectLineStart = effize("selectLineStart");
export const selectLineEnd = effize("selectLineEnd");
export const selectFileEnd = effize("selectFileEnd");
export const selectFileStart = effize("selectFileStart");
export const selectWordRight = effize("selectWordRight");
export const selectWordLeft = effize("selectWordLeft");
export const getWordRange = effize("getWordRange");
export const selectWord = effize("selectWord");
export const selectAWord = effize("selectAWord");
export const selectLine = effize("selectLine");
export const moveCursorUp = effize("moveCursorUp");
export const moveCursorDown = effize("moveCursorDown");
export const moveCursorLeft = effize("moveCursorLeft");
export const moveCursorRight = effize("moveCursorRight");
export const moveCursorLineStart = effize("moveCursorLineStart");
export const moveCursorLineEnd = effize("moveCursorLineEnd");
export const moveCursorFileEnd = effize("moveCursorFileEnd");
export const moveCursorFileStart = effize("moveCursorFileStart");
export const moveCursorLongWordRight = effize("moveCursorLongWordRight");
export const moveCursorLongWordLeft = effize("moveCursorLongWordLeft");
export const moveCursorByImpl = effize("moveCursorBy");
export const moveCursorToImpl = effize("moveCursorTo");
export const moveCursorToPositionImpl = effize("moveCursorToPosition");
export const moveCursorToScreenImpl = effize("moveCursorToScreen");

export function create(session) {
  return function () {
    var Selection = ace.require("ace/selection").Selection;
    return new Selection(session);
  };
}
