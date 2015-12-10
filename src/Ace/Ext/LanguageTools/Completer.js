/* global exports */
// module Ace.Ext.LanguageTools.Completer
"use strict";

exports.mkCompleterImpl = function(getCompletionCb, isJust, fromJust) {
    return function() {
        return {
            getCompletions: function(editor, session, pos, prefix, callback) {
                return getCompletionCb(editor)(session)(pos)(prefix)(function(mb){
                    return function() {
                        if (!isJust(mb)) {
                            return callback("Error in getCompletion", null);

                        }
                        var result = [],
                            extracted = fromJust(mb),
                            i = 0,
                            item;
                        for (i; i < extracted.length; i++) {
                            item = extracted[i];
                            if (isJust(item.caption)) {
                                item.caption = fromJust(item.caption);
                            }
                            else {
                                item.caption = undefined;
                            }
                            result.push(item);
                        }
                        return callback(null, result);

                    };
                })();
            }
        };
    };
};
