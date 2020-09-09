"use strict";

var ace = require("ace-builds");

exports.ace = ace;

exports.editImpl = function (el, self) {
  return function () {
    return self.edit(el);
  };
};

exports.editNodeImpl = function (el, self) {
  return function () {
    return self.edit(el);
  };
};

exports.createEditSessionForDocumentImpl = function (text, mode, self) {
  return function () {
    return self.createEditSession(text, mode);
  };
};

exports.createEditSessionImpl = function (text, mode, self) {
  return function () {
    return self.createEditSession(text, mode);
  };
};
