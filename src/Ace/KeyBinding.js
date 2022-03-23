export function addKeyboardHandlerImpl(commandToString) {
  return function (isJust) {
    return function (fromJust) {
      return function (curriedEffHandler) {
        return function (kb) {
          return function () {
            kb.addKeyboardHandler(
              function (data, hash, keyCode, keyString, evt) {
                var res = curriedEffHandler(data)(hash)(keyCode)(keyString)(evt)();
                if (isJust(res)) {
                  var extracted = fromJust(res);
                  return {
                    passEvent: extracted.passEvent,
                    command: commandToString(extracted.command)
                  };
                } else {
                  return false;
                }
              });
            return {};
          };
        };
      };
    };
  };
}
