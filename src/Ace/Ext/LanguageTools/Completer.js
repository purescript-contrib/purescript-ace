export function mkCompleterImpl(getCompletionCb, isJust, fromJust) {
  return function () {
    return {
      getCompletions: function (editor, session, pos, prefix, callback) {
        return getCompletionCb(editor)(session)(pos)(prefix)(function (mb) {
          return function () {
            if (!isJust(mb)) {
              return callback("Error in getCompletion", null);
            }
            var result = [];
            var extracted = fromJust(mb);
            for (var i = 0; i < extracted.length; i++) {
              var current = extracted[i];
              result[i] = {
                value: current.value,
                score: current.score,
                meta: current.meta,
                caption: isJust(current.caption) ? fromJust(current.caption) : undefined
              };
            }
            return callback(null, result);
          };
        })();
      }
    };
  };
}
