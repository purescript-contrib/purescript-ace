import ace from "ace-builds";

export function languageTools() {
  return ace.require("ace/ext/language_tools");
}

export function textCompleter(lt) {
  return function () {
    return lt.textCompleter;
  };
}

export function keyWordCompleter(lt) {
  return function () {
    return lt.keyWordCompleter;
  };
}

export function snippetCompleter(lt) {
  return function () {
    return lt.snippetCompleter;
  };
}

export function setCompleters(completers) {
  return function (lt) {
    return function () {
      return lt.setCompleters(completers);
    };
  };
}

export function addCompleter(completer) {
  return function (lt) {
    return function () {
      return lt.addCompleter(completer);
    };
  };
}
