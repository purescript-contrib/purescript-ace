/* global window */
"use strict";

exports.rules = {
  "start": [{ token: "example", regex: "[a-z]*" }]
};

exports.onLoad = function (action) {
  return function () {
    window.addEventListener("load", function () {
      action();
    });
  };
};
