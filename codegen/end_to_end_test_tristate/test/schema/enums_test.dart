import 'package:built_value/serializer.dart';
import 'package:end_to_end_test_tristate/graphql/__generated__/serializers.gql.dart';
import "package:test/test.dart";

import 'package:end_to_end_test_tristate/graphql/__generated__/schema.schema.gql.dart';

void main() {
  group("Enums", () {
    test('produce the correct string', () {
      expect(GEpisode.EMPIRE.toString(), equals("EMPIRE"));
    });

    test('are correct type', () {
      expect(GEpisode.EMPIRE, TypeMatcher<GEpisode>());
    });

    test('fallback of LengthUnit to METER works', () {
      expect(
          serializers.deserialize("UNKNOWN_UNIT",
              specifiedType: FullType(GLengthUnit)),
          equals(GLengthUnit.METER));
    });
  });
}
