"use strict";

exports.onChangeImpl = function (self, fn) {
  return function () {
    return self.on("change", function (e) {
      fn(e)();
    });
  };
};

exports.setValueImpl = function (text, self) {
  return function () {
    return self.setValue(text);
  };
};

exports.getValue = function (self) {
  return function () {
    return self.getValue();
  };
};

exports.createAnchorImpl = function (row, column, self) {
  return function () {
    return self.createAnchor(row, column);
  };
};

exports.getNewLineCharacter = function (self) {
  return function () {
    return self.getNewLineCharacter();
  };
};

exports.setNewLineModeImpl = function (newLineMode, self) {
  return function () {
    return self.setNewLineMode(newLineMode);
  };
};

exports.getNewLineMode = function (self) {
  return function () {
    return self.getNewLineMode();
  };
};

exports.isNewLineImpl = function (text, self) {
  return function () {
    return self.isNewLine(text);
  };
};

exports.getLineImpl = function (row, self) {
  return function () {
    return self.getLine(row);
  };
};

exports.getLinesImpl = function (firstRow, lastRow, self) {
  return function () {
    return self.getLines(firstRow, lastRow);
  };
};

exports.getAllLines = function (self) {
  return function () {
    return self.getAllLines();
  };
};

exports.getLength = function (self) {
  return function () {
    return self.getLength();
  };
};

exports.getTextRangeImpl = function (range, self) {
  return function () {
    return self.getTextRange(range);
  };
};

exports.insertImpl = function (position, text, self) {
  return function () {
    self.insert(position, text);
  };
};

exports.insertLinesImpl = function (row, lines, self) {
  return function () {
    return self.insertLines(row, lines);
  };
};

exports.insertNewLineImpl = function (position, self) {
  return function () {
    return self.insertNewLine(position);
  };
};

exports.insertInLineImpl = function (position, text, self) {
  return function () {
    return self.insertInLine(position, text);
  };
};

exports.removeImpl = function (range, self) {
  return function () {
    return self.remove(range);
  };
};

exports.removeInLineImpl = function (row, startColumn, endColumn, self) {
  return function () {
    return self.removeInLine(row, startColumn, endColumn);
  };
};

exports.removeLinesImpl = function (firstRow, lastRow, self) {
  return function () {
    return self.removeLines(firstRow, lastRow);
  };
};

exports.removeNewLineImpl = function (row, self) {
  return function () {
    return self.removeNewLine(row);
  };
};

exports.replaceImpl = function (range, text, self) {
  return function () {
    return self.replace(range, text);
  };
};

exports.indexToPositionImpl = function (index, startRow, self) {
  return function () {
    return self.indexToPosition(index, startRow);
  };
};

exports.positionToIndexImpl = function (pos, startRow, self) {
  return function () {
    return self.positionToIndex(pos, startRow);
  };
};

exports.create = function (text) {
  return function () {
    var Document = ace.require("ace/document").Document;
    return new Document(text);
  };
};

exports.createFromLines = function (text) {
  return function () {
    var Document = ace.require("ace/document").Document;
    return new Document(text);
  };
};
