// module Ace.ScrollBar

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



exports.onScrollImpl = function(self, fn) {
    return function() {
        return self.on('scroll', function() {
            fn();
        });
    };
};
exports.getWidthImpl = effize('getWidth');
exports.setHeightImpl = effize('setHeight');
exports.setInnerHeightImpl = effize('setInnerHeight');
exports.setScrollTopImpl = effize('setScrollTop');
exports.createImpl = function(parent, vr) {
    return function() {
        var ScrollBar = ace.require('ace/scrollbar').ScrollBar;
        return new ScrollBar(parent, vr);
    };
};

