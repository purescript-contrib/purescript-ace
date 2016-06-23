"use strict";

function  effize(method) {
  return function () {
    var me = arguments[arguments.length - 1];
    var args = Array.prototype.slice.call(arguments, 0, -1);
    return function () {
      return me[method].apply(me, args);
    };
  };
}

exports.onScrollImpl = function (self, fn) {
  return function () {
    return self.on("scroll", function () {
      fn();
    });
  };
};

exports.getWidth = effize("getWidth");
exports.setHeightImpl = effize("setHeight");
exports.setInnerHeightImpl = effize("setInnerHeight");
exports.setScrollTopImpl = effize("setScrollTop");

exports.createImpl = function (parent, vr) {
  return function () {
    var ScrollBar = ace.require("ace/scrollbar").ScrollBar;
    return new ScrollBar(parent, vr);
  };
};
