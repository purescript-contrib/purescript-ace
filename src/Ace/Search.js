// module Ace.Search

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


exports.setImpl = effize("set");
exports.findImpl = effize("find");
exports.findAllImpl = effize("findAll");
exports.replaceImpl = effize("replace");
exports.createImpl = function() {
    return function() {
        var Search = ace.require("ace/search").Search;
        return new Search();
    };
};
