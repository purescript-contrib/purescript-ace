/* global window */
"use strict";

exports.rules = {
  "start": [{ token: "example", regex: "[a-z]*" }]
};

exports.onLoad = function (action) {
  window.addEventListener("load", function () {
    action();
  });
};
