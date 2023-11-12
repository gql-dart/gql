import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:test/test.dart';

void main() {
  test("requireValue on absent throws", () {
    final absent = const AbsentValue();

    expect(() => absent.requireValue, throwsA(isA<StateError>()));
  });

  test("requireValue on present returns value", () {
    final present = Value.present(42);

    expect(present.requireValue, equals(42));
  });

  test("requireValue on null returns null", () {
    final nullValue = Value<String>.present(null);

    expect(nullValue.requireValue, isNull);
  });

  test("valueOrNull on absent returns null", () {
    final absent = const AbsentValue();

    expect(absent.valueOrNull, isNull);
  });

  test("valueOrNull on present returns value", () {
    final present = Value.present(42);

    expect(present.valueOrNull, equals(42));
  });
}
