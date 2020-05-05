import "dart:async";

import "package:multipack/commands/common.dart";
import "package:multipack/package.dart";
import "package:pub_semver/pub_semver.dart";

class BumpAlphaCommand extends MultipackCommand {
  BumpAlphaCommand(
    List<Package> packages,
  ) : super(
          "bump-alpha",
          "Bumps versions for alpha release.",
          packages,
        );

  @override
  FutureOr<int> runOnPackage(Package package) async {
    try {
      final pubspec = package.pubspec;

      final next = pubspec.version.nextBreaking;

      await pubspec
          .copy(
            version: Version(
              next.major,
              next.minor,
              next.patch,
              pre: "alpha",
              build: DateTime.now().millisecondsSinceEpoch.toString(),
            ),
          )
          .save(package.directory);

      return 0;
    } catch (e) {
      return 1;
    }
  }
}
