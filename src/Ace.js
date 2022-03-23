import ace from "ace-builds";
export {ace};

export function editImpl(el, self) {
  return function () {
    return self.edit(el);
  };
}

export function editNodeImpl(el, self) {
  return function () {
    return self.edit(el);
  };
}

export function createEditSessionForDocumentImpl(text, mode, self) {
  return function () {
    return self.createEditSession(text, mode);
  };
}

export function createEditSessionImpl(text, mode, self) {
  return function () {
    return self.createEditSession(text, mode);
  };
}
