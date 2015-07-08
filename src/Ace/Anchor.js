// module Ace.Anchor

exports.onChangeImpl = function(self, fn) {
    return function() {
        return self.on('change', function(e) {
            fn(e)();
        });
    };
};

exports.getPositionImpl = function(self) {
    return function() {
        return self.getPosition();
    };
};

exports.getDocumentImpl = function(self) {
    return function() {
        return self.getDocument();
    };
};

exports.setPositionImpl = function(row, column, noClip, self) {
    return function() {
        return self.setPosition(row, column, noClip);
    };
};

exports.detachImpl = function(self) {
    return function() {
        self.detach();
    };
};

exports.createImpl = function(doc, row, column) {
    return function() {
        var Anchor = ace.require('ace/anchor').Anchor;
        return new Anchor(doc, row, column);
    };
};

