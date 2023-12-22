import 'package:end_to_end_test/fragments/__generated__/hero_with_interface_subtyped_fragments.data.gql.dart';
import 'package:test/test.dart';

void main() {
  final human = GheroFieldsFragmentData__asHuman((d) => d
    ..id = "obiwan"
    ..name = "Obiwan"
    ..homePlanet = "Stewjon"
    ..friends.addAll([
      GheroFieldsFragmentData__asHuman_friends__asDroid((b) => b
        ..G__typename = "Droid"
        ..id = "r2d2"
        ..name = "R2-D2"
        ..primaryFunction = "Astromech"),
      GheroFieldsFragmentData__asHuman_friends__asHuman((b) => b
        ..G__typename = "Human"
        ..id = "luke"
        ..name = "Luke"
        ..homePlanet = "Tattoine"),
    ]));

  final droid = GheroFieldsFragmentData__asDroid((d) => d
    ..id = "r2d2"
    ..name = "R2-D2"
    ..primaryFunction = "Astromech");

  group("when()", () {
    test("can call when on humans", () {
      bool wasCalled = false;
      human.when(
          human: (h) {
            wasCalled = true;
          },
          droid: (_) => fail("should not be called"),
          orElse: () => fail("should not be called"));

      expect(wasCalled, isTrue);
    });

    test("can call when on droids", () {
      bool wasCalled = false;
      droid.when(
          human: (_) => fail("should not be called"),
          droid: (d) {
            wasCalled = true;
          },
          orElse: () => fail("should not be called"));

      expect(wasCalled, isTrue);
    });

    test("when returns result", () {
      final primaryFunction = droid.when(
          human: (_) => fail("should not be called"),
          droid: (d) => d.primaryFunction,
          orElse: () => fail("should not be called"));

      expect(primaryFunction, "Astromech");
    });

    test("unexpected typeName calls orElse", () {
      final animal = human.rebuild((b) => b..G__typename = "Animal");

      bool wasCalled = false;

      animal.when(
          human: (_) {},
          droid: (_) {},
          orElse: () {
            wasCalled = true;
          });

      expect(wasCalled, isTrue);
    });

    test("works on subtypes", () {
      final droidFriend = human.friends!.first!;

      bool droidWasCalled = false;
      droidFriend.when(
          droid: (d) {
            droidWasCalled = true;
          },
          human: (_) => fail("should not be called"),
          orElse: () => fail("should not be called"));

      final humanFriend = human.friends!.last!;

      bool humanWasCalled = false;
      humanFriend.when(
          human: (h) {
            humanWasCalled = true;
          },
          droid: (_) => fail("should not be called"),
          orElse: () => fail("should not be called"));

      expect(droidWasCalled, isTrue);
      expect(humanWasCalled, isTrue);
    });
  });

  group("maybeWhen()", () {
    test("can call maybeWhen on humans", () {
      bool wasCalled = false;
      human.maybeWhen(
          human: (h) {
            wasCalled = true;
          },
          orElse: () => fail("should not be called"));

      expect(wasCalled, isTrue);
    });

    test("can call maybeWhen on droids", () {
      bool wasCalled = false;
      droid.maybeWhen(
          droid: (d) {
            wasCalled = true;
          },
          orElse: () => fail("should not be called"));

      expect(wasCalled, isTrue);
    });

    test("calls orElse when not matching", () {
      bool wasCalled = false;
      droid.maybeWhen(orElse: () {
        wasCalled = true;
      });

      expect(wasCalled, isTrue);
    });

    test("unexpected typeName calls orElse", () {
      final animal = human.rebuild((b) => b..G__typename = "Animal");

      bool wasCalled = false;

      animal.maybeWhen(orElse: () {
        wasCalled = true;
      });

      expect(wasCalled, isTrue);
    });
  });
}
