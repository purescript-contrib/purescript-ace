import ace from "ace-builds";

export function onChangeImpl(self, fn) {
  return function () {
    return self.on("change", function (e) {
      fn(e)();
    });
  };
}

export function setValueImpl(text, self) {
  return function () {
    return self.setValue(text);
  };
}

export function getValue(self) {
  return function () {
    return self.getValue();
  };
}

export function createAnchorImpl(row, column, self) {
  return function () {
    return self.createAnchor(row, column);
  };
}

export function getNewLineCharacter(self) {
  return function () {
    return self.getNewLineCharacter();
  };
}

export function setNewLineModeImpl(newLineMode, self) {
  return function () {
    return self.setNewLineMode(newLineMode);
  };
}

export function getNewLineMode(self) {
  return function () {
    return self.getNewLineMode();
  };
}

export function isNewLineImpl(text, self) {
  return function () {
    return self.isNewLine(text);
  };
}

export function getLineImpl(row, self) {
  return function () {
    return self.getLine(row);
  };
}

export function getLinesImpl(firstRow, lastRow, self) {
  return function () {
    return self.getLines(firstRow, lastRow);
  };
}

export function getAllLines(self) {
  return function () {
    return self.getAllLines();
  };
}

export function getLength(self) {
  return function () {
    return self.getLength();
  };
}

export function getTextRangeImpl(range, self) {
  return function () {
    return self.getTextRange(range);
  };
}

export function insertImpl(position, text, self) {
  return function () {
    self.insert(position, text);
  };
}

export function insertLinesImpl(row, lines, self) {
  return function () {
    return self.insertLines(row, lines);
  };
}

export function insertNewLineImpl(position, self) {
  return function () {
    return self.insertNewLine(position);
  };
}

export function insertInLineImpl(position, text, self) {
  return function () {
    return self.insertInLine(position, text);
  };
}

export function removeImpl(range, self) {
  return function () {
    return self.remove(range);
  };
}

export function removeInLineImpl(row, startColumn, endColumn, self) {
  return function () {
    return self.removeInLine(row, startColumn, endColumn);
  };
}

export function removeLinesImpl(firstRow, lastRow, self) {
  return function () {
    return self.removeLines(firstRow, lastRow);
  };
}

export function removeNewLineImpl(row, self) {
  return function () {
    return self.removeNewLine(row);
  };
}

export function replaceImpl(range, text, self) {
  return function () {
    return self.replace(range, text);
  };
}

export function indexToPositionImpl(index, startRow, self) {
  return function () {
    return self.indexToPosition(index, startRow);
  };
}

export function positionToIndexImpl(pos, startRow, self) {
  return function () {
    return self.positionToIndex(pos, startRow);
  };
}

export function create(text) {
  return function () {
    var Document = ace.require("ace/document").Document;
    return new Document(text);
  };
}

export function createFromLines(text) {
  return function () {
    var Document = ace.require("ace/document").Document;
    return new Document(text);
  };
}
