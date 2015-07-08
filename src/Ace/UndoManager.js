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
exports.resetImpl = effize('reset');
exports.hasUndoImpl = effize('hasUndo');
exports.hasRedoImpl = effize('hasRedo');
exports.createImpl = function() {
    return function() {
        var UndoManager = ace.require('ace/undomanager').UndoManager;
        return new UndoManager();
    };
};

