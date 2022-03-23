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

export const stepBackward = effize("stepBackward");
export const stepForward = effize("stepForward");
export const getCurrentToken = effize("getCurrentToken");
export const getCurrentTokenRow = effize("getCurrentTokenRow");
export const getCurrentTokenColumn = effize("getCurrentTokenColumn");

export function createImpl(session, initialRow, initialColumn) {
  return function () {
    var TokenIterator = ace.require("ace/token_iterator").TokenIterator;
    return new TokenIterator(session, initialRow, initialColumn);
  };
}
