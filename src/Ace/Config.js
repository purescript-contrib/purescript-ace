// module Ace.Config

exports.setImpl = function(key, value) {
    return function() {
        ace.config.set(key, value);
        return ace;
    };
};
