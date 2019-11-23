class ArgumentBuilder {
  final Map<String, dynamic> _json = const <String, dynamic>{};

  const ArgumentBuilder();

  void set(
    String key,
    dynamic value,
  ) =>
      value is ArgumentBuilder ? _json[key] = value._json : _json[key] = value;

  Map<String, dynamic> toJson() => _json;
}
