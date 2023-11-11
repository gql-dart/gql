/// A value that may or may not be present.
/// This is used to represent three possible states:
/// - The value is absent. It will not be serialized.
/// - The value is present and null. It will be serialized as null.
/// - The value is present and non-null. It will be serialized as the value.
sealed class Value<T extends Object> {
  const Value._();

  /// The value is absent. It will not be serialized.
  const factory Value.absent() = AbsentValue;

  /// The value is present. It may still be be null.
  /// If the value is null, it will be serialized as null.
  /// If the value is non-null, it will be serialized as the value.
  const factory Value.present(T value) = PresentValue<T>;
}

class AbsentValue extends Value<Never> {
  const AbsentValue() : super._();
}

class PresentValue<T extends Object> extends Value<T> {
  final T? value;

  const PresentValue(this.value) : super._();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PresentValue<T> &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
