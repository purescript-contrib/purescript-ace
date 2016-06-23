"use strict";

exports.onUpdateImpl = function (self, fn) {
  return function () {
    return self.on("update", function (e) {
      fn(e)();
    });
  };
};

exports.setTokenizerImpl = function (tokenizer, self) {
  return function () {
    return self.setTokenizer(tokenizer);
  };
};

exports.setDocumentImpl = function (doc, self) {
  return function () {
    return self.setDocument(doc);
  };
};

exports.fireUpdateEventImpl = function (firstRow, lastRow, self) {
  return function () {
    return self.fireUpdateEvent(firstRow, lastRow);
  };
};

exports.startImpl = function (startRow, self) {
  return function () {
    return self.start(startRow);
  };
};

exports.stop = function (self) {
  return function () {
    return self.stop();
  };
};

exports.getTokensImpl = function (row, self) {
  return function () {
    return self.getTokens(row);
  };
};

exports.getStateImpl = function (row, self) {
  return function () {
    return self.getState(row);
  };
};

exports.createImpl = function (tokenizer, editor) {
  return function () {
    var BackgroundTokenizer = ace.require("ace/background_tokenizer").BackgroundTokenizer;
    return new BackgroundTokenizer(tokenizer, editor);
  };
};
