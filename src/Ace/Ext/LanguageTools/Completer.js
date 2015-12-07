/* global exports */
// module Ace.Ext.LanguageTools.Completer
"use strict";

exports.mkCompleterImpl = function(getCompletionCb, isJust, fromJust) {
    return function() {
        return {
            getCompletions: function(editor, session, pos, prefix, callback) {
                return getCompletionCb(editor)(session)(pos)(prefix)(function(mb){
                    return function() {
                        if (isJust(mb)) {
                            return callback(null, fromJust(mb));
                        }
                        else {
                            return callback("Error in getCompletion", null);
                        }
                    };
                })();
            }
        };
    };
};
