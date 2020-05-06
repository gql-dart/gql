import "dart:async";

import "package:multipack/commands/common.dart";
import "package:multipack/package.dart";
import "package:pubspec/pubspec.dart";

class CleanCommand extends MultipackCommand {
  CleanCommand(
    List<Package> packages,
  ) : super(
          "clean",
          "cleans dependency overrides",
          packages,
        );

  @override
  FutureOr<int> runOnPackage(Package package) async {
    try {
      await package.pubspec.copy(
        dependencyOverrides: <String, DependencyReference>{},
      ).save(
        package.directory,
      );

      return 0;
    } catch (e) {
      return 1;
    }
  }
}
