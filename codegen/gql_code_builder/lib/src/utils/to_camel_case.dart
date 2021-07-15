String toCamelCase(String name) {
  var result = "";
  var upperCase = false;
  var firstCharacter = true;
  for (final char in name.split("")) {
    if (char == "_") {
      upperCase = true;
    } else {
      result += firstCharacter
          ? char.toLowerCase()
          : (upperCase ? char.toUpperCase() : char);
      upperCase = false;
      firstCharacter = false;
    }
  }
  return result;
}
