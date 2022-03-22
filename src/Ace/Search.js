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

export var setImpl = effize("set");

export function findImpl(just, nothing, sess, search) {
  return function () {
    var result = search.find(sess);
    return result === null ? nothing : just(result);
  };
}

export var findAllImpl = effize("findAll");
export var replaceImpl = effize("replace");

export function create() {
  var Search = ace.require("ace/search").Search;
  return new Search();
}
