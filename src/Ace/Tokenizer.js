import ace from "ace-builds";

export function getLineTokens(self) {
  return function () {
    return self.getLineTokens();
  };
}

export function createImpl(rules, flag) {
  return function () {
    var Tokenizer = ace.require("ace/tokenizer").Tokenizer;
    return new Tokenizer(rules, flag);
  };
}
