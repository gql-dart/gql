import "package:test/test.dart";

import 'package:end_to_end_test/fragments/__generated__/hero_with_interface_subtyped_fragments.data.gql.dart';

void main() {
  group("Fragments with InlineFragments for different sub-Types", () {
    test('can deserialize correctly from sub-Typed data', () {
      final jsonHuman = {
        "__typename": "Human",
        "id": "luke",
        "name": "Luke",
        "homePlanet": "Tattoine",
        "friends": [
          {
            "__typename": "Droid",
            "id": "r2d2",
            "name": "R2-D2",
            "primaryFunction": "Astromech"
          },
          {
            "__typename": "Human",
            "id": "han",
            "name": "Han Solo",
            "homePlanet": "Nerf",
          },
        ],
      };

      final gqlHuman = GheroFieldsFragmentData__asHuman.fromJson(jsonHuman);

      expect(gqlHuman?.id, equals("luke"));
      expect(gqlHuman?.name, equals("Luke"));
      expect(gqlHuman?.homePlanet, equals("Tattoine"));

      final gqlHuman_droidFriends = gqlHuman?.friends
          ?.whereType<GheroFieldsFragmentData__asHuman_friends__asDroid>();

      expect(gqlHuman_droidFriends?.first.G__typename, equals("Droid"));
      expect(gqlHuman_droidFriends?.first.id, equals("r2d2"));
      expect(gqlHuman_droidFriends?.first.name, equals("R2-D2"));
      expect(gqlHuman_droidFriends?.first.primaryFunction, equals("Astromech"));

      final gqlHuman_humanFriends = gqlHuman?.friends
          ?.whereType<GheroFieldsFragmentData__asHuman_friends__asHuman>();

      expect(gqlHuman_humanFriends?.first.id, equals("han"));
      expect(gqlHuman_humanFriends?.first.name, equals("Han Solo"));
      expect(gqlHuman_humanFriends?.first.homePlanet, equals("Nerf"));
    });

    test('can be serialized and deserialized', () {
      final obiwan = GheroFieldsFragmentData__asHuman(
        (d) => d
          ..G__typename = "Human"
          ..id = "obiwan"
          ..name = "Obiwan"
          ..homePlanet = "Stewjon"
          ..friends.addAll([
            GheroFieldsFragmentData__asHuman_friends__asDroid(
              (b) => b
                ..G__typename = "Droid"
                ..id = "r2d2"
                ..name = "R2-D2"
                ..primaryFunction = "Astromech",
            ),
            GheroFieldsFragmentData__asHuman_friends__asHuman((b) => b
              ..G__typename = "Human"
              ..id = "luke"
              ..name = "Luke"
              ..homePlanet = "Tattoine"),
          ]),
      );

      final json = {
        "__typename": "Human",
        "id": "obiwan",
        "name": "Obiwan",
        "homePlanet": "Stewjon",
        "friends": [
          {
            "__typename": "Droid",
            "id": "r2d2",
            "name": "R2-D2",
            "primaryFunction": "Astromech"
          },
          {
            "__typename": "Human",
            "id": "luke",
            "name": "Luke",
            "homePlanet": "Tattoine",
          },
        ],
      };

      expect(obiwan.toJson(), equals(json));
    });
  });
}
