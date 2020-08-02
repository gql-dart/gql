import "package:test/test.dart";

import 'package:end_to_end_test/graphql/schema.schema.gql.dart';

void main() {
  group("Enums", () {
    test('produce the correct string', () {
      expect(GEpisode.EMPIRE.toString(), equals("EMPIRE"));
    });

    test('are correct type', () {
      expect(GEpisode.EMPIRE, TypeMatcher<GEpisode>());
    });
  });
}
