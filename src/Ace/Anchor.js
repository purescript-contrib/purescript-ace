import ace from "ace-builds";

export function onChangeImpl(self, fn) {
  return function () {
    return self.on("change", function (e) {
      fn(e)();
    });
  };
}

export function getPosition(self) {
  return function () {
    return self.getPosition();
  };
}

export function getDocument(self) {
  return function () {
    return self.getDocument();
  };
}

export function setPositionImpl(row, column, noClip, self) {
  return function () {
    return self.setPosition(row, column, noClip);
  };
}

export function detach(self) {
  return function () {
    self.detach();
  };
}

export function createImpl(doc, row, column) {
  return function () {
    var Anchor = ace.require("ace/anchor").Anchor;
    return new Anchor(doc, row, column);
  };
}

export function getInsertRight(a) {
  return function () {
    return a.$insertRight;
  };
}

export function setInsertRight(val) {
  return function (a) {
    return function () {
      a.$insertRight = val;
      return {};
    };
  };
}
