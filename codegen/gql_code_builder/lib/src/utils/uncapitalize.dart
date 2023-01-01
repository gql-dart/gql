// if the given String is capitalized, uncapitalize it
// e.g. "Foo" -> "foo"
// used for generating parameter names
String uncapitalize(String s) {
  if (s.isEmpty) {
    return s;
  }
  return s.substring(0, 1).toLowerCase() + s.substring(1);
}
