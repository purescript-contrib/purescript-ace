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

exports.setImpl = effize("set");

exports.findImpl = function (just, nothing, sess, search) {
  return function () {
    var result = search.find(sess);
    return result == null ? nothing : just(result);
  };
};

exports.findAllImpl = effize("findAll");
exports.replaceImpl = effize("replace");

exports.create = function () {
  var Search = ace.require("ace/search").Search;
  return new Search();
};
