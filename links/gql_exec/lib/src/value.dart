class Value<T extends Object> {
  final T? _value;

  T? get value => _value;

  /// Create a (present) value by wrapping the [value] provided.
  const Value(T? value) : _value = value;

  const Value.ofNull() : _value = null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Value<T> && runtimeType == other.runtimeType && _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}
