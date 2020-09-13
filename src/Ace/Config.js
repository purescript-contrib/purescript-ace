"use strict";

var ace = require("ace-builds");

exports.setImpl = function (key, value) {
  return function () {
    ace.config.set(key, value);
    return ace;
  };
};
