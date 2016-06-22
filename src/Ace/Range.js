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

exports.getStartRow = effGet("startRow");
exports.getStartColumn = effGet("startColumn");
exports.getEndRow = effGet("endRow");
exports.getEndColumn = effGet("endColumn");
exports.getStart = effGet("start");
exports.getEnd = effGet("end");
exports.isEmpty = effize("isEmpty");
exports.isEqualImpl = effize("isEqual");
exports.toString = effize("toString");
exports.containsImpl = effize("contains");
exports.compareRangeImpl = effize("compareRange");
exports.comparePointImpl = effize("comparePoint");
exports.containsRangeImpl = effize("containsRange");
exports.intersectsImpl = effize("intersects");
exports.isEndImpl = effize("isEnd");
exports.isStartImpl = effize("isStart");
exports.setStartImpl = effize("setStart");
exports.setEndImpl = effize("setEnd");
exports.insideImpl = effize("inside");
exports.insideStartImpl = effize("insideStart");
exports.insideEndImpl = effize("insideEnd");
exports.compareImpl = effize("compare");
exports.compareStartImpl = effize("compareStart");
exports.compareEndImpl = effize("compareEnd");
exports.compareInsideImpl = effize("compareInside");
exports.clipRowsImpl = effize("clipRows");
exports.extendImpl = effize("extend");
exports.isMultiLine = effize("isMultiLine");
exports.clone = effize("clone");
exports.collapseRows = effize("collapseRows");
exports.toScreenRangeImpl = effize("toScreenRange");

exports.fromPointsImpl = function (start, end) {
  return function () {
    var Range = ace.require("ace/range").Range;
    return Range.fromPoints(start, end);
  };
};

exports.createImpl = function (startRow, startColumn, endRow, endColumn) {
  return function () {
    var Range = ace.require("ace/range").Range;
    return new Range(startRow, startColumn, endRow, endColumn);
  };
};
