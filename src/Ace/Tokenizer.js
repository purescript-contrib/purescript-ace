/* global exports, ace */
"use strict";

// module Ace.Tokenizer

exports.getLineTokens = function(self) {
    return function() {
        return self.getLineTokens();
    };
};

exports.createImpl = function(rules, flag) {
    return function() {
        var Tokenizer = ace.require('ace/tokenizer').Tokenizer;
        return new Tokenizer(rules, flag);
    };
};
