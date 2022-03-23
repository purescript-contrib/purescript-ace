import ace from "ace-builds";

export function setImpl(key, value) {
  return function () {
    ace.config.set(key, value);
    return ace;
  };
}
