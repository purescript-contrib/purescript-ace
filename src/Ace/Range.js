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

export var getStartRow = effGet("startRow");
export var getStartColumn = effGet("startColumn");
export var getEndRow = effGet("endRow");
export var getEndColumn = effGet("endColumn");
export var getStart = effGet("start");
export var getEnd = effGet("end");
export var isEmpty = effize("isEmpty");
export var isEqualImpl = effize("isEqual");
export var toString = effize("toString");
export var containsImpl = effize("contains");
export var compareRangeImpl = effize("compareRange");
export var comparePointImpl = effize("comparePoint");
export var containsRangeImpl = effize("containsRange");
export var intersectsImpl = effize("intersects");
export var isEndImpl = effize("isEnd");
export var isStartImpl = effize("isStart");
export var setStartImpl = effize("setStart");
export var setEndImpl = effize("setEnd");
export var insideImpl = effize("inside");
export var insideStartImpl = effize("insideStart");
export var insideEndImpl = effize("insideEnd");
export var compareImpl = effize("compare");
export var compareStartImpl = effize("compareStart");
export var compareEndImpl = effize("compareEnd");
export var compareInsideImpl = effize("compareInside");
export var clipRowsImpl = effize("clipRows");
export var extendImpl = effize("extend");
export var isMultiLine = effize("isMultiLine");
export var clone = effize("clone");
export var collapseRows = effize("collapseRows");
export var toScreenRangeImpl = effize("toScreenRange");

export function fromPointsImpl(start, end) {
  return function () {
    var Range = ace.require("ace/range").Range;
    return Range.fromPoints(start, end);
  };
}

export function createImpl(startRow, startColumn, endRow, endColumn) {
  return function () {
    var Range = ace.require("ace/range").Range;
    return new Range(startRow, startColumn, endRow, endColumn);
  };
}
