export const rules = {
  "start": [{ token: "example", regex: "[a-z]*" }]
};

export const onLoad = function (action) {
  return function () {
    window.addEventListener("load", function () {
      action();
    });
  };
};
