// module Ace.TokenIterator


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

exports.stepBackwardImpl = effize('stepBackward');
exports.stepForwardImpl = effize('stepForward');
exports.getCurrentTokenImpl = effize('getCurrentToken');
exports.getCurrentTokenRowImpl = effize('getCurrentTokenRow');
exports.getCurrentTokenColumnImpl = effize('getCurrentTokenColumn');
exports.createImpl = function(session, initialRow, initialColumn) {
    return function() {
        var TokenIterator = ace.require('ace/token_iterator').TokenIterator;
        return new TokenIterator(session, initialRow, initialColumn);
    };
};

