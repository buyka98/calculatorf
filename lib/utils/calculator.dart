const Map<String, String?> initialState = {
  "currentValue": "0",
  "operator": null,
  "previousValue": null,
};

String handleNumber(String value, state) {
  if (state["currentValue"] == "0") {
    return value;
  }
  return "${state["currentValue"]}$value";
}

handleEqual(state) {
  String operator = state["operator"];
  double current = double.parse(state["currentValue"]);
  double previous = double.parse(state["previousValue"]);
  var resetState = {"operator": null, "previousValue": null};

  switch (operator) {
    case "+":
      {
        var result = previous + current;
        return {
          "currentValue": result.remainder(1) == 0
              ? result.toInt().toString()
              : result.toString(),
          ...resetState
        };
      }
    case "-":
      {
        var result = previous - current;
        return {
          "currentValue": result.remainder(1) == 0
              ? result.toInt().toString()
              : result.toString(),
          ...resetState
        };
      }
    case "*":
      {
        var result = previous * current;
        return {
          "currentValue": result.remainder(1) == 0
              ? result.toInt().toString()
              : result.toString(),
          ...resetState
        };
      }
    case "/":
      {
        var result = previous / current;
        return {
          "currentValue": result.remainder(1) == 0
              ? result.toInt().toString()
              : result.toStringAsFixed(3),
          ...resetState
        };
      }
    default:
      return state;
  }
}

dynamic calculator(String type, String? value, dynamic state) {
  switch (type) {
    case "number":
      return {
        "currentValue": handleNumber(value!, state),
        "operator": state["operator"],
        "previousValue": state["previousValue"],
      };
    case "clear":
      return initialState;
    case "posneg":
      {
        var result = double.parse(state["currentValue"]) * -1;
        return {
          "currentValue": result.remainder(1) == 0
              ? result.toInt().toString()
              : result.toStringAsFixed(3),
        };
      }
    case "point":
      return {
        "currentValue": "${state["currentValue"]}.",
      };
    case "percentage":
      return {
        "currentValue":
            (double.parse(state["currentValue"]) * 0.01).toStringAsFixed(3),
      };
    case "operator":
      return {
        "operator": value,
        "previousValue": state["currentValue"],
        "currentValue": "0",
      };
    case "equal":
      return handleEqual(state);
    default:
      return state;
  }
}
