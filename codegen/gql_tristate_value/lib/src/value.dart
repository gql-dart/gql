/// A nullable value that may or may not be present.
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
  const factory Value.present(T? value) = PresentValue<T>;

  /// If the value is non-null, it will be serialized as the value.
  /// If the value is null. It will not be serialized.
  factory Value.absentWhenNull(T? value) {
    if (value == null) {
      return const AbsentValue();
    }
    return Value.present(value);
  }

  /// Returns the value if present (no matter if null or non-null), otherwise throws a [StateError].
  T? get requireValue => switch (this) {
        PresentValue(:final value) => value,
        AbsentValue() => throw StateError("Value is absent"),
      };

  /// return the value if present and non-null, otherwise null.
  /// this is useful for cases where you don't care between the value being absent or null.
  T? get valueOrNull => switch (this) {
        PresentValue(:final value) => value,
        AbsentValue() => null,
      };

  bool get isPresent => switch (this) {
        PresentValue() => true,
        AbsentValue() => false,
      };
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

  @override
  String toString() => '$runtimeType(value: $value)';
}
