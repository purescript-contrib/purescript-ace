"use strict";

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

export var undoImpl = effize("undo");
export var redoImpl = effize("redo");
export var reset = effize("reset");
export var hasUndo = effize("hasUndo");
export var hasRedo = effize("hasRedo");

export function create() {
  var UndoManager = ace.require("ace/undomanager").UndoManager;
  return new UndoManager();
}
