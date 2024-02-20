import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:test/test.dart';

void main() {
  group(
    'requireValue',
    () {
      test('on $AbsentValue throws', () {
        final absent = const AbsentValue();

        expect(() => absent.requireValue, throwsA(isA<StateError>()));
      });

      test('on $PresentValue with valuereturns value', () {
        final present = Value.present(42);

        expect(present.requireValue, equals(42));
      });

      test('on $PresentValue with null returns null', () {
        final nullValue = Value<String>.present(null);

        expect(nullValue.requireValue, isNull);
      });

      test('on $ValueOrAbsent with value returns value', () {
        final present = Value.valueOrAbsent(42);

        expect(present.requireValue, equals(42));
      });

      test('on $ValueOrAbsent with null throws', () {
        final nullValue = Value<String>.valueOrAbsent(null);

        expect(() => nullValue.requireValue, throwsA(isA<StateError>()));
      });
    },
  );

  group(
    'valueOrNull ',
    () {
      test('on $AbsentValue returns null', () {
        final absent = const AbsentValue();

        expect(absent.valueOrNull, isNull);
      });

      test('on $PresentValue with value returns value', () {
        final present = Value.present(42);

        expect(present.valueOrNull, equals(42));
      });

      test('on $ValueOrAbsent with value returns value', () {
        final present = Value.valueOrAbsent(42);

        expect(present.valueOrNull, equals(42));
      });

      test('on $ValueOrAbsent with null returns null', () {
        final present = Value<String>.valueOrAbsent(null);

        expect(present.valueOrNull, isNull);
      });
    },
  );

  group(
    'isPresent ',
    () {
      test('on $AbsentValue returns false', () {
        final absent = const AbsentValue();

        expect(absent.isPresent, false);
      });

      test('on $PresentValue with value returns true', () {
        final present = Value.present(42);

        expect(present.isPresent, true);
      });

      test('on $ValueOrAbsent with value returns true', () {
        final present = Value.valueOrAbsent(42);

        expect(present.isPresent, true);
      });

      test('on $ValueOrAbsent with null returns false', () {
        final present = Value<String>.valueOrAbsent(null);

        expect(present.isPresent, false);
      });
    },
  );

  group(
    'toString ',
    () {
      test('on $PresentValue', () {
        final present = Value.present(42);

        expect(present.toString(), 'PresentValue<int>(value: 42)');
      });

      test('on $ValueOrAbsent', () {
        final present = Value.valueOrAbsent(42);

        expect(present.toString(), 'ValueOrAbsent<int>(value: 42)');
      });

      test('on $ValueOrAbsent', () {
        final present = Value<String>.valueOrAbsent(null);

        expect(present.toString(), 'ValueOrAbsent<String>(value: null)');
      });
    },
  );
}
