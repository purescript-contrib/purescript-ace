"use strict";

exports.getId = function (m) {
  return function () {
    return m.id;
  };
};

exports.getClazz = function (m) {
  return function () {
    return m.clazz;
  };
};

exports.getInFront = function (m) {
  return function () {
    return m.inFront;
  };
};

exports.getType = function (m) {
  return function () {
    return m.type;
  };
};

exports.getRangeImpl = function (Nothing) {
  return function (Just) {
    return function (m) {
      return function () {
        var res = m.range;
        return typeof res === "undefined" ? Nothing : Just(res);
      };
    };
  };
};
