export function getId(m) {
  return function () {
    return m.id;
  };
}

export function getClazz(m) {
  return function () {
    return m.clazz;
  };
}

export function getInFront(m) {
  return function () {
    return m.inFront;
  };
}

export function getType(m) {
  return function () {
    return m.type;
  };
}

export function getRangeImpl(Nothing) {
  return function (Just) {
    return function (m) {
      return function () {
        var res = m.range;
        return typeof res === "undefined" ? Nothing : Just(res);
      };
    };
  };
}
