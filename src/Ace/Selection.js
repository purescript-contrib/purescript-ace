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

export function onImpl(ev, fn, self) {
  return function () {
    return self.on(ev, function () {
      fn();
    });
  };
}

export var moveCursorWordLeft = effize("moveCursorWordLeft");
export var moveCursorWordRight = effize("moveCursorWordRight");
export var fromOrientedRangeImpl = effize("fromOrientedRange");
export var setSelectionRangeImpl = effize("setSelectionRange");
export var getAllRanges = effize("getAllRanges");
export var addRangeImpl = effize("addRange");
export var isEmpty = effize("isEmpty");
export var isMultiLine = effize("isMultiLine");
export var getCursor = effize("getCursor");
export var setSelectionAnchorImpl = effize("setSelectionAnchor");
export var getSelectionAnchor = effize("getSelectionAnchor");
export var getSelectionLead = effize("getSelectionLead");
export var shiftSelectionImpl = effize("shiftSelection");
export var isBackwards = effize("isBackwards");
export var getRange = effize("getRange");
export var clearSelection = effize("clearSelection");
export var selectAll = effize("selectAll");
export var setRangeImpl = effize("setRange");
export var selectToImpl = effize("selectTo");
export var selectToPositionImpl = effize("selectToPosition");
export var selectUp = effize("selectUp");
export var selectDown = effize("selectDown");
export var selectRight = effize("selectRight");
export var selectLeft = effize("selectLeft");
export var selectLineStart = effize("selectLineStart");
export var selectLineEnd = effize("selectLineEnd");
export var selectFileEnd = effize("selectFileEnd");
export var selectFileStart = effize("selectFileStart");
export var selectWordRight = effize("selectWordRight");
export var selectWordLeft = effize("selectWordLeft");
export var getWordRange = effize("getWordRange");
export var selectWord = effize("selectWord");
export var selectAWord = effize("selectAWord");
export var selectLine = effize("selectLine");
export var moveCursorUp = effize("moveCursorUp");
export var moveCursorDown = effize("moveCursorDown");
export var moveCursorLeft = effize("moveCursorLeft");
export var moveCursorRight = effize("moveCursorRight");
export var moveCursorLineStart = effize("moveCursorLineStart");
export var moveCursorLineEnd = effize("moveCursorLineEnd");
export var moveCursorFileEnd = effize("moveCursorFileEnd");
export var moveCursorFileStart = effize("moveCursorFileStart");
export var moveCursorLongWordRight = effize("moveCursorLongWordRight");
export var moveCursorLongWordLeft = effize("moveCursorLongWordLeft");
export var moveCursorByImpl = effize("moveCursorBy");
export var moveCursorToImpl = effize("moveCursorTo");
export var moveCursorToPositionImpl = effize("moveCursorToPosition");
export var moveCursorToScreenImpl = effize("moveCursorToScreen");

export function create(session) {
  return function () {
    var Selection = ace.require("ace/selection").Selection;
    return new Selection(session);
  };
}
