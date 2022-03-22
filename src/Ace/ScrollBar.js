import ace from "ace-builds";

function  effize(method) {
  return function () {
    var me = arguments[arguments.length - 1];
    var args = Array.prototype.slice.call(arguments, 0, -1);
    return function () {
      return me[method].apply(me, args);
    };
  };
}

export function onScrollImpl(self, fn) {
  return function () {
    return self.on("scroll", function () {
      fn();
    });
  };
}

export const getWidth = effize("getWidth");
export const setHeightImpl = effize("setHeight");
export const setInnerHeightImpl = effize("setInnerHeight");
export const setScrollTopImpl = effize("setScrollTop");

export function createImpl(parent, vr) {
  return function () {
    var ScrollBar = ace.require("ace/scrollbar").ScrollBar;
    return new ScrollBar(parent, vr);
  };
}
