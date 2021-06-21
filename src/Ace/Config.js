"use strict";

exports.setImpl = function (key, value) {
  return function () {
    ace.config.set(key, value);
    return ace;
  };
};
