/// A nullable value that may or may not be present.
/// This is used to represent three possible states:
/// - The value is absent. It will not be serialized.
/// - The value is present and null. It will be serialized as null.
/// - The value is present and non-null. It will be serialized as the value.
sealed class Value<T extends Object> {
  const Value._();

  /// The value is absent. It will not be serialized.
  const factory Value.absent() = AbsentValue;

  /// If the value is non-null, it will be serialized as the value.
  /// The value is absent. It will not be serialized.
  const factory Value.valueOrAbsent(T? value) = ValueOrAbsent;

  /// The value is present. It may still be be null.
  /// If the value is null, it will be serialized as null.
  /// If the value is non-null, it will be serialized as the value.
  const factory Value.present(T? value) = PresentValue<T>;

  /// Returns the value if present (no matter if null or non-null), otherwise throws a [StateError].
  T? get requireValue => switch (this) {
        PresentValue(:final value) => value,
        AbsentValue() => throw StateError("Value is absent"),
        ValueOrAbsent(:final value) =>
          value ?? (throw StateError("Value is absent")),
      };

  /// return the value if present and non-null, otherwise null.
  /// this is useful for cases where you don't care between the value being absent or null.
  T? get valueOrNull => switch (this) {
        PresentValue(:final value) => value,
        AbsentValue() => null,
        ValueOrAbsent(:final value) => value,
      };

  bool get isPresent => switch (this) {
        PresentValue() => true,
        AbsentValue() => false,
        ValueOrAbsent(:final value) => value == null ? false : true,
      };
}

class AbsentValue extends Value<Never> {
  const AbsentValue() : super._();
}

class ValueOrAbsent<T extends Object> extends Value<T> {
  final T? value;

  const ValueOrAbsent(this.value) : super._();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ValueOrAbsent<T> &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => '$runtimeType(value: $value)';
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
