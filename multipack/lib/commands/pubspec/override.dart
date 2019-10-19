import "dart:io";

import "package:args/command_runner.dart";
import "package:multipack/commands/pubspec/common.dart";
import "package:pubspec/pubspec.dart";

class OverrideCommand extends Command<void> {
  @override
  final String name = "override";

  @override
  final String description = "overrides dependencies for local packages";

  @override
  void run() async {
    final List<Package> packages = await findPackages(
      Directory.current,
    ).toList();

    packages.forEach(
      (package) {
        print("updating ${package.name}...");

        final dependencyOverrides = Map.fromEntries(
          package.pubspec.allDependencies.entries
              .map(
                (e) => MapEntry(
                  e.key,
                  packages.firstWhere(
                    (pack) => pack.name == e.key,
                    orElse: () => null,
                  ),
                ),
              )
              .where(
                (e) => e.value != null,
              )
              .map(
                (e) => MapEntry(
                  e.key,
                  PathReference(e.value.directory.uri.path),
                ),
              ),
        );

        package.pubspec
            .copy(dependencyOverrides: dependencyOverrides)
            .save(package.directory);
      },
    );
  }
}
