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

export const getStartRow = effGet("startRow");
export const getStartColumn = effGet("startColumn");
export const getEndRow = effGet("endRow");
export const getEndColumn = effGet("endColumn");
export const getStart = effGet("start");
export const getEnd = effGet("end");
export const isEmpty = effize("isEmpty");
export const isEqualImpl = effize("isEqual");
export const toString = effize("toString");
export const containsImpl = effize("contains");
export const compareRangeImpl = effize("compareRange");
export const comparePointImpl = effize("comparePoint");
export const containsRangeImpl = effize("containsRange");
export const intersectsImpl = effize("intersects");
export const isEndImpl = effize("isEnd");
export const isStartImpl = effize("isStart");
export const setStartImpl = effize("setStart");
export const setEndImpl = effize("setEnd");
export const insideImpl = effize("inside");
export const insideStartImpl = effize("insideStart");
export const insideEndImpl = effize("insideEnd");
export const compareImpl = effize("compare");
export const compareStartImpl = effize("compareStart");
export const compareEndImpl = effize("compareEnd");
export const compareInsideImpl = effize("compareInside");
export const clipRowsImpl = effize("clipRows");
export const extendImpl = effize("extend");
export const isMultiLine = effize("isMultiLine");
export const clone = effize("clone");
export const collapseRows = effize("collapseRows");
export const toScreenRangeImpl = effize("toScreenRange");

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
