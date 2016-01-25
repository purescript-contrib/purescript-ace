"use strict";
/* global exports */
// module Ace.Marker

exports.getId = function(m) {
    return function() {
        return m.id;
    };
};

exports.getClazz = function(m) {
    return function() {
        return m.clazz;
    };
};

exports.getInFront = function(m) {
    return function() {
        return m.inFront;
    };
};

exports.getType = function(m) {
    return function() {
        return m.type;
    };
};

exports.getRangeImpl = function(Nothing) {
    return function(Just) {
        return function(m) {
            return function() {
                var res = m.range;
                if (typeof res === "undefined") {
                    return Nothing;
                }
                else {
                    return Just(res);
                }
            };
        };
    };
};
