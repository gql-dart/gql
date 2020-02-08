import "dart:io";

import "package:args/command_runner.dart";
import "package:multipack/commands/pubspec/common.dart";
import "package:pubspec/pubspec.dart";
import "package:path/path.dart" as path;

class OverrideCommand extends Command<void> {
  @override
  final String name = "override";

  @override
  final String description = "overrides dependencies for local packages";

  @override
  void run() async {
    final packages = await findPackages(
      Directory.current,
    ).toList();

    packages.forEach(
      (package) {
        print("updating ${package.name}...");

        package.pubspec
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
      },
    );
  }
}
