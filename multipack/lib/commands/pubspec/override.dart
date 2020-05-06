import "dart:async";

import "package:multipack/commands/common.dart";
import "package:multipack/package.dart";
import "package:pubspec/pubspec.dart";
import "package:path/path.dart" as path;

class OverrideCommand extends MultipackCommand {
  OverrideCommand(
    List<Package> packages,
  ) : super(
          "override",
          "overrides dependencies for local packages",
          packages,
        );

  @override
  FutureOr<int> runOnPackage(Package package) async {
    try {
      await package.pubspec
          .copy(
            dependencyOverrides: Map.fromEntries(
              packages
                  .where(
                    (dependency) =>
                        dependency.name != package.name &&
                        (package.isFlutter || !dependency.isFlutter),
                  )
                  .map(
                    (dependency) => MapEntry(
                      dependency.name,
                      PathReference(
                        path.relative(
                          dependency.directory.path,
                          from: package.directory.path,
                        ),
                      ),
                    ),
                  ),
            ),
          )
          .save(package.directory);

      return 0;
    } catch (e) {
      return 1;
    }
  }
}
