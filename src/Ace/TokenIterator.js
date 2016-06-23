"use strict";

function effize(method) {
  return function () {
    var me = arguments[arguments.length - 1];
    var args = Array.prototype.slice.call(arguments, 0, -1);
    return function () {
      return me[method].apply(me, args);
    };
  };
}

exports.stepBackward = effize("stepBackward");
exports.stepForward = effize("stepForward");
exports.getCurrentToken = effize("getCurrentToken");
exports.getCurrentTokenRow = effize("getCurrentTokenRow");
exports.getCurrentTokenColumn = effize("getCurrentTokenColumn");

exports.createImpl = function (session, initialRow, initialColumn) {
  return function () {
    var TokenIterator = ace.require("ace/token_iterator").TokenIterator;
    return new TokenIterator(session, initialRow, initialColumn);
  };
};
