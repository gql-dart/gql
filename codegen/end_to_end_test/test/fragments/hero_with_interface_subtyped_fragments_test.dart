import 'package:end_to_end_test/fragments/__generated__/hero_with_interface_subtyped_fragments.data.gql.dart';
import 'package:test/test.dart';

void main() {
  group('hero with interface subtyped fragments', () {
    // Create shared test data
    late GHeroWithInterfaceSubTypedFragmentsData heroData;
    late GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman humanHero;

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
      heroData = GHeroWithInterfaceSubTypedFragmentsData.fromJson(queryJson)!;
      humanHero = heroData.hero!
          as GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman;
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
      final homePlanet = heroData.hero!.maybeWhen(
        human: (human) => human.homePlanet,
        orElse: () => 'Not a human',
      );

      expect(homePlanet, equals('Tatooine'));
    });

    test('maybeWhen handles null cases correctly', () {
      // Test with missing handler
      final function = heroData.hero!.maybeWhen(
        droid: (droid) => droid.primaryFunction,
        orElse: () => 'Not a droid',
      );

      expect(function, equals('Not a droid'));
    });

    test('fragment interfaces are correctly implemented', () {
      // Verify base interfaces
      expect(heroData.hero, isA<GheroFieldsFragment>());

      // Verify type-specific interfaces
      expect(humanHero, isA<GheroFieldsFragment__asHuman>());
      expect(humanHero, isA<GhumanFieldsFragment>());

      // Verify interface implementations are correct
      final heroAsFragment = humanHero as GheroFieldsFragment;
      expect(heroAsFragment.id, equals('human-1'));
      expect(heroAsFragment.name, equals('Luke Skywalker'));
    });

    test('nested fragment fields are accessible through type hierarchy', () {
      // Access fields from nested fragments
      final friend = humanHero.friends!.first!;

      // Using the base interface
      expect(friend, isA<GheroFieldsFragment__asHuman_friends>());

      // Test type discrimination for the first friend (which is a Droid)
      final droidFriend = friend.when(
        droid: (droid) => droid,
        human: (human) => null,
        orElse: () => null,
      );

      expect(droidFriend, isNotNull);
      expect(droidFriend!.primaryFunction, equals('Astromech'));

      // Test type discrimination for the second friend (which is a Human)
      final humanFriend = humanHero.friends![1]!.when(
        droid: (droid) => null,
        human: (human) => human,
        orElse: () => null,
      );

      expect(humanFriend, isNotNull);
      expect(humanFriend!.homePlanet, equals('Alderaan'));
    });

    test('fragment data classes are correctly deserialized', () {
      // Test that fragment data classes can be created directly
      final fragmentData = GheroFieldsFragmentData.fromJson({
        '__typename': 'Human',
        'id': 'human-1',
        'name': 'Luke Skywalker',
        'homePlanet': 'Tatooine',
      });

      expect(fragmentData, isNotNull);
      expect(fragmentData, isA<GheroFieldsFragmentData__asHuman>());
      expect((fragmentData as GheroFieldsFragmentData__asHuman).homePlanet,
          equals('Tatooine'));
    });

    test('complex fragment hierarchies are preserved during serialization', () {
      // Serialize and deserialize to test preservation of types and hierarchies
      final json = heroData.toJson();
      final deserialized =
          GHeroWithInterfaceSubTypedFragmentsData.fromJson(json);

      expect(deserialized, isNotNull);
      expect(deserialized!.hero,
          isA<GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman>());

      // Test that nested structures are preserved
      final deserializedHuman = deserialized.hero!
          as GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman;
      expect(deserializedHuman.friends!.length, equals(2));
      expect(deserializedHuman.friends!.first,
          isA<GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman_friends>());

      // Test that type information is preserved in nested structures
      final firstFriend = deserializedHuman.friends!.first!;
      expect(
        firstFriend.when(
          droid: (droid) => true,
          human: (human) => false,
          orElse: () => false,
        ),
        isTrue,
      );
    });

    test('fragment interfaces provide access to their fields', () {
      // Test that fragment interface can be used directly
      final fragment = humanHero as GhumanFieldsFragment;
      expect(fragment.homePlanet, equals('Tatooine'));

      // Test that nested fragment interfaces work
      if (fragment.friends != null && fragment.friends!.isNotEmpty) {
        final friendFragment =
            fragment.friends!.first as GhumanFieldsFragment_friends;
        expect(friendFragment.G__typename, isNotEmpty);
      }
    });
  });
}
