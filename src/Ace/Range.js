// module Ace.Range


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


exports.getStartRow = effGet("startRow");
exports.getStartColumn = effGet("startColumn");
exports.getEndRow = effGet("endRow");
exports.getEndColumn = effGet("endColumn");
exports.getStart = effGet("start");
exports.getEnd = effGet("end");
exports.isEmptyImpl = effize("isEmpty");
exports.isEqualImpl = effize("isEqual");
exports.toStringImpl = effize("toString");
exports.containsImpl = effize('contains');
exports.compareRangeImpl = effize('compareRange');
exports.comparePointImpl = effize('comparePoint');
exports.containsRangeImpl = effize('containsRange');
exports.intersectsImpl = effize('intersects');
exports.isEndImpl = effize('isEnd');
exports.isStartImpl = effize('isStart');
exports.setStartImpl = effize('setStart');
exports.setEndImpl = effize('setEnd');
exports.insideImpl = effize('inside');
exports.insideStartImpl = effize('insideStart');
exports.insideEndImpl = effize('insideEnd');
exports.compareImpl = effize('compare');
exports.compareStartImpl = effize('compareStart');
exports.compareEndImpl = effize('compareEnd');
exports.compareInsideImpl = effize('compareInside');
exports.clipRowsImpl = effize('clipRows');
exports.extendImpl = effize('extend');
exports.isMultiLineImpl = effize('isMultiLine');
exports.cloneImpl = effize('clone');
exports.collapseRowsImpl = effize('collapseRows');
exports.toScreenRangeImpl = effize('toScreenRange');
exports.fromPointsImpl = function(start, end) {
    return function() {
        var Range = ace.require('ace/range').Range;
        return Range.fromPoints(start, end);
    };
};
exports.createImpl = function(startRow, startColumn, endRow, endColumn) {
    return function() {
        var Range = ace.require('ace/range').Range;
        return new Range(startRow, startColumn, endRow, endColumn);
    };
};

