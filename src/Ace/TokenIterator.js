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

export var stepBackward = effize("stepBackward");
export var stepForward = effize("stepForward");
export var getCurrentToken = effize("getCurrentToken");
export var getCurrentTokenRow = effize("getCurrentTokenRow");
export var getCurrentTokenColumn = effize("getCurrentTokenColumn");

export function createImpl(session, initialRow, initialColumn) {
  return function () {
    var TokenIterator = ace.require("ace/token_iterator").TokenIterator;
    return new TokenIterator(session, initialRow, initialColumn);
  };
}
