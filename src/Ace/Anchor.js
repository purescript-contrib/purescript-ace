"use strict";

exports.onChangeImpl = function (self, fn) {
  return function () {
    return self.on("change", function (e) {
      fn(e)();
    });
  };
};

exports.getPosition = function (self) {
  return function () {
    return self.getPosition();
  };
};

exports.getDocument = function (self) {
  return function () {
    return self.getDocument();
  };
};

exports.setPositionImpl = function (row, column, noClip, self) {
  return function () {
    return self.setPosition(row, column, noClip);
  };
};

exports.detach = function (self) {
  return function () {
    self.detach();
  };
};

exports.createImpl = function (doc, row, column) {
  return function () {
    var Anchor = ace.require("ace/anchor").Anchor;
    return new Anchor(doc, row, column);
  };
};

exports.getInsertRight = function (a) {
  return function () {
    return a.$insertRight;
  };
};

exports.setInsertRight = function (val) {
  return function (a) {
    return function () {
      a.$insertRight = val;
      return {};
    };
  };
};
