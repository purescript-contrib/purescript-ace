import ace from "ace-builds";

export function onUpdateImpl(self, fn) {
  return function () {
    return self.on("update", function (e) {
      fn(e)();
    });
  };
}

export function setTokenizerImpl(tokenizer, self) {
  return function () {
    return self.setTokenizer(tokenizer);
  };
}

export function setDocumentImpl(doc, self) {
  return function () {
    return self.setDocument(doc);
  };
}

export function fireUpdateEventImpl(firstRow, lastRow, self) {
  return function () {
    return self.fireUpdateEvent(firstRow, lastRow);
  };
}

export function startImpl(startRow, self) {
  return function () {
    return self.start(startRow);
  };
}

export function stop(self) {
  return function () {
    return self.stop();
  };
}

export function getTokensImpl(row, self) {
  return function () {
    return self.getTokens(row);
  };
}

export function getStateImpl(row, self) {
  return function () {
    return self.getState(row);
  };
}

export function createImpl(tokenizer, editor) {
  return function () {
    var BackgroundTokenizer = ace.require("ace/background_tokenizer").BackgroundTokenizer;
    return new BackgroundTokenizer(tokenizer, editor);
  };
}
