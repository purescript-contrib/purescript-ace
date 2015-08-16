/* global exports, ace */
"use strict";

// module Ace.UndoManager

function effize(method) {
    return function() {
        var me = arguments[arguments.length - 1],
            args = Array.prototype.slice.call(arguments, 0, -1);
        return function() {
            return me[method].apply(me, args);
        };
    };
}

exports.undoImpl = effize('undo');
exports.redoImpl = effize('redo');
exports.reset = effize('reset');
exports.hasUndo = effize('hasUndo');
exports.hasRedo = effize('hasRedo');

exports.createImpl = function() {
    var UndoManager = ace.require('ace/undomanager').UndoManager;
    return new UndoManager();
};

