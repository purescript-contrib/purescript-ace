// module Ace.Selection


function effize(method) {
    return function() {
        var me = arguments[arguments.length - 1],
            args = Array.prototype.slice.call(arguments, 0, -1);
        return function() {
            return me[method].apply(me, args);
        };
    };
}


exports.onImpl = function(ev, fn, self) {
    return function() {
        return self.on(ev, function() {
            fn();
        });
    };
};
exports.moveCursorWordLeftImpl = effize('moveCursorWordLeft');
exports.moveCursorWordRightImpl = effize('moveCursorWordRight');
exports.fromOrientedRangeImpl = effize('fromOrientedRange');
exports.setSelectionRangeImpl = effize('setSelectionRange');
exports.getAllRangesImpl = effize('getAllRanges');
exports.addRangeImpl = effize('addRange');
exports.isEmptyImpl = effize('isEmpty');
exports.isMultiLineImpl = effize('isMultiLine');
exports.getCursorImpl = effize('getCursor');
exports.setSelectionAnchorImpl = effize('setSelectionAnchor');
exports.getSelectionAnchorImpl = effize('getSelectionAnchor');
exports.getSelectionLeadImpl = effize('getSelectionLead');
exports.shiftSelectionImpl = effize('shiftSelection');
exports.isBackwardsImpl = effize('isBackwards');
exports.getRangeImpl = effize('getRange');
exports.clearSelectionImpl = effize("clearSelection");
exports.selectAllImpl = effize('selectAll');
exports.setRangeImpl = effize('setRange');
exports.selectToImpl = effize('selectTo');
exports.selectToPositionImpl = effize('selectToPosition');
exports.selectUpImpl = effize('selectUp');
exports.selectDownImpl = effize('selectDown');
exports.selectRightImpl = effize('selectRight');
exports.selectLeftImpl = effize('selectLeft');
exports.selectLineStartImpl = effize('selectLineStart');
exports.selectLineEndImpl = effize('selectLineEnd');
exports.selectFileEndImpl = effize('selectFileEnd');
exports.selectFileStartImpl = effize('selectFileStart');
exports.selectWordRightImpl = effize('selectWordRight');
exports.selectWordLeftImpl = effize('selectWordLeft');
exports.getWordRangeImpl = effize('getWordRange');
exports.selectWordImpl = effize('selectWord');
exports.selectAWordImpl = effize('selectAWord');
exports.selectLineImpl = effize('selectLine');
exports.moveCursorUpImpl = effize('moveCursorUp');
exports.moveCursorDownImpl = effize('moveCursorDown');
exports.moveCursorLeftImpl = effize('moveCursorLeft');
exports.moveCursorRightImpl = effize('moveCursorRight');
exports.moveCursorLineStartImpl = effize('moveCursorLineStart');
exports.moveCursorLineEndImpl = effize('moveCursorLineEnd');
exports.moveCursorFileEndImpl = effize('moveCursorFileEnd');
exports.moveCursorFileStartImpl = effize('moveCursorFileStart');
exports.moveCursorLongWordRightImpl = effize('moveCursorLongWordRight');
exports.moveCursorLongWordLeftImpl = effize('moveCursorLongWordLeft');
exports.moveCursorByImpl = effize('moveCursorBy');
exports.moveCursorToImpl = effize('moveCursorTo');
exports.moveCursorToPositionImpl = effize('moveCursorToPosition');
exports.moveCursorToScreenImpl = effize('moveCursorToScreen');
exports.createImpl = function(session) {
    return function() {
        var Selection = ace.require('ace/selection').Selection;
        return new Selection(session);
    };
}

