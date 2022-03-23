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

export const undoImpl = effize("undo");
export const redoImpl = effize("redo");
export const reset = effize("reset");
export const hasUndo = effize("hasUndo");
export const hasRedo = effize("hasRedo");

export function create() {
  var UndoManager = ace.require("ace/undomanager").UndoManager;
  return new UndoManager();
}
