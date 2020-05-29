import "package:test/test.dart";

import 'package:end_to_end_test/interfaces/hero_for_episode.data.gql.dart';

void main() {
  group("Interfaces", () {
    test('base type can be instantiated', () {
      GHeroForEpisodeData_hero__base(
        (b) => b
          ..G__typename = "Hero"
          ..name = "Luke",
      );
    });
    test('inline fragment types can be instantiated', () {
      GHeroForEpisodeData_hero__asDroid(
        (b) => b
          ..G__typename = "Droid"
          ..name = "r2",
      );
    });
    test('types without inline fragments get deserialized as base type', () {
      final data = {
        "__typename": "Sith",
        "name": "Darth Maul",
      };
      final deserialized = GHeroForEpisodeData_hero.fromJson(data);
      expect(deserialized, TypeMatcher<GHeroForEpisodeData_hero__base>());
    });
    test('data is deserialized into correct type', () {
      final data = {
        "__typename": "Droid",
        "name": "r2",
      };
      final deserialized = GHeroForEpisodeData_hero.fromJson(data);
      expect(deserialized, TypeMatcher<GHeroForEpisodeData_hero__asDroid>());
    });
    test('data is serialized correctly', () {
      final droid = GHeroForEpisodeData_hero__asDroid(
        (b) => b
          ..G__typename = "Droid"
          ..name = "r2",
      );
      final data = {
        "__typename": "Droid",
        "name": "r2",
      };
      droid.toJson();
      expect(droid.toJson(), equals(data));
    });
  });
}
