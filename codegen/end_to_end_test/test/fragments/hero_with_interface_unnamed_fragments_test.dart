import 'package:end_to_end_test/fragments/__generated__/hero_with_interface_unnamed_fragments.data.gql.dart';
import 'package:test/test.dart';

void main() {
  group('hero with interface subtyped fragments', () {
    // Create shared test data
    late GHeroWithInterfaceUnnamedFragmentsData heroData;
    late GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman humanHero;

    setUp(() {
      // Create raw JSON data for our hero that includes all fields
      final Map<String, dynamic> queryJson = {
        '__typename': 'Query',
        'hero': {
          '__typename': 'Human',
          'id': 'human-1',
          'name': 'Luke Skywalker',
          'homePlanet': 'Tatooine',
          'friends': [
            {
              '__typename': 'Droid',
              'id': 'droid-1',
              'name': 'R2-D2',
              'primaryFunction': 'Astromech'
            },
            {
              '__typename': 'Human',
              'id': 'human-2',
              'name': 'Leia Organa',
              'homePlanet': 'Alderaan'
            }
          ]
        }
      };

      // Deserialize the entire query response
      heroData = GHeroWithInterfaceUnnamedFragmentsData.fromJson(queryJson)!;
      humanHero = heroData.hero!
          as GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman;
    });

    test('when extension correctly retrieves hero name', () {
      final heroName = heroData.hero!.when(
        human: (human) => human.name,
        droid: (droid) => droid.name,
        orElse: () => 'Unknown',
      );
      expect(heroName, equals('Luke Skywalker'));
    });

    test('when extension correctly retrieves friends information', () {
      final friendNames = humanHero.friends!
          .map((friend) => friend!.when(
                droid: (droid) => '${droid.name} (${droid.primaryFunction})',
                human: (human) => '${human.name} (${human.homePlanet})',
                orElse: () => 'Unknown friend',
              ))
          .toList();

      expect(
          friendNames,
          equals([
            'R2-D2 (Astromech)',
            'Leia Organa (Alderaan)',
          ]));
    });

    test('maybeWhen extension works correctly', () {
      // Test with a match
      final planetName = heroData.hero!.maybeWhen(
        human: (human) => human.homePlanet,
        orElse: () => 'Unknown planet',
      );
      expect(planetName, equals('Tatooine'));

      // Test without a match (assuming we have a Droid here, which we don't in this test data)
      final function = heroData.hero!.maybeWhen(
        droid: (droid) => droid.primaryFunction,
        orElse: () => 'Not a droid',
      );
      expect(function, equals('Not a droid'));
    });

    test('no duplicate classes are generated for common fragment structures',
        () {
      // This would need reflection or a way to inspect the generated code
      // But we can at least verify that the correct aliases are being used
      // by checking instance types
      expect(
        heroData.hero is GHeroWithInterfaceUnnamedFragmentsData_hero,
        isTrue,
      );

      // Verify friends use the same structure regardless of parent type
      if (heroData.hero
          is GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman) {
        final humanHero = heroData.hero
            as GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman;
        if (humanHero.friends != null && humanHero.friends!.isNotEmpty) {
          for (final friend in humanHero.friends!) {
            expect(
              friend
                  is GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman_friends,
              isTrue,
            );
          }
        }
      }
    });

    test('base fields are accessible on all concrete types', () {
      // Access base fields through the interface
      expect(heroData.hero!.id, equals('human-1'));
      expect(heroData.hero!.name, equals('Luke Skywalker'));

      // Access base fields through a concrete type
      final humanHero = heroData.hero!
          as GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman;
      expect(humanHero.id, equals('human-1'));
      expect(humanHero.name, equals('Luke Skywalker'));
    });

    test('serialization preserves type information', () {
      // Serialize to JSON
      final json = heroData.toJson();

      // Deserialize back
      final deserialized =
          GHeroWithInterfaceUnnamedFragmentsData.fromJson(json);

      // Verify type information is preserved
      expect(
        deserialized!.hero
            is GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman,
        isTrue,
      );

      // Verify fields are preserved
      final deserializedHumanHero = deserialized.hero!
          as GHeroWithInterfaceUnnamedFragmentsData_hero__asHuman;
      expect(deserializedHumanHero.homePlanet, equals('Tatooine'));
    });
  });
}
