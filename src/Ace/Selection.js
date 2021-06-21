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

exports.onImpl = function (ev, fn, self) {
  return function () {
    return self.on(ev, function () {
      fn();
    });
  };
};

exports.moveCursorWordLeft = effize("moveCursorWordLeft");
exports.moveCursorWordRight = effize("moveCursorWordRight");
exports.fromOrientedRangeImpl = effize("fromOrientedRange");
exports.setSelectionRangeImpl = effize("setSelectionRange");
exports.getAllRanges = effize("getAllRanges");
exports.addRangeImpl = effize("addRange");
exports.isEmpty = effize("isEmpty");
exports.isMultiLine = effize("isMultiLine");
exports.getCursor = effize("getCursor");
exports.setSelectionAnchorImpl = effize("setSelectionAnchor");
exports.getSelectionAnchor = effize("getSelectionAnchor");
exports.getSelectionLead = effize("getSelectionLead");
exports.shiftSelectionImpl = effize("shiftSelection");
exports.isBackwards = effize("isBackwards");
exports.getRange = effize("getRange");
exports.clearSelection = effize("clearSelection");
exports.selectAll = effize("selectAll");
exports.setRangeImpl = effize("setRange");
exports.selectToImpl = effize("selectTo");
exports.selectToPositionImpl = effize("selectToPosition");
exports.selectUp = effize("selectUp");
exports.selectDown = effize("selectDown");
exports.selectRight = effize("selectRight");
exports.selectLeft = effize("selectLeft");
exports.selectLineStart = effize("selectLineStart");
exports.selectLineEnd = effize("selectLineEnd");
exports.selectFileEnd = effize("selectFileEnd");
exports.selectFileStart = effize("selectFileStart");
exports.selectWordRight = effize("selectWordRight");
exports.selectWordLeft = effize("selectWordLeft");
exports.getWordRange = effize("getWordRange");
exports.selectWord = effize("selectWord");
exports.selectAWord = effize("selectAWord");
exports.selectLine = effize("selectLine");
exports.moveCursorUp = effize("moveCursorUp");
exports.moveCursorDown = effize("moveCursorDown");
exports.moveCursorLeft = effize("moveCursorLeft");
exports.moveCursorRight = effize("moveCursorRight");
exports.moveCursorLineStart = effize("moveCursorLineStart");
exports.moveCursorLineEnd = effize("moveCursorLineEnd");
exports.moveCursorFileEnd = effize("moveCursorFileEnd");
exports.moveCursorFileStart = effize("moveCursorFileStart");
exports.moveCursorLongWordRight = effize("moveCursorLongWordRight");
exports.moveCursorLongWordLeft = effize("moveCursorLongWordLeft");
exports.moveCursorByImpl = effize("moveCursorBy");
exports.moveCursorToImpl = effize("moveCursorTo");
exports.moveCursorToPositionImpl = effize("moveCursorToPosition");
exports.moveCursorToScreenImpl = effize("moveCursorToScreen");

exports.create = function (session) {
  return function () {
    var Selection = ace.require("ace/selection").Selection;
    return new Selection(session);
  };
};
