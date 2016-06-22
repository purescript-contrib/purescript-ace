"use strict";

exports.languageTools = function  () {
  return ace.require("ace/ext/language_tools");
};

exports.textCompleter = function (lt) {
  return function () {
    return lt.textCompleter;
  };
};

exports.keyWordCompleter = function (lt) {
  return function () {
    return lt.keyWordCompleter;
  };
};

exports.snippetCompleter = function (lt) {
  return function () {
    return lt.snippetCompleter;
  };
};

exports.setCompleters = function (completers) {
  return function (lt) {
    return function () {
      return lt.setCompleters(completers);
    };
  };
};

exports.addCompleter = function (completer) {
  return function (lt) {
    return function () {
      return lt.addCompleter(completer);
    };
  };
};
