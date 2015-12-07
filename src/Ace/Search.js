/* global exports, ace */
"use strict";

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

exports.setImpl = effize("set");
exports.findImpl = effize("find");
exports.findAllImpl = effize("findAll");
exports.replaceImpl = effize("replace");

exports.create = function() {
    var Search = ace.require("ace/search").Search;
    return new Search();
};
