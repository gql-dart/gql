import "dart:io";

import "package:args/command_runner.dart";
import "package:multipack/commands/pubspec/common.dart";
import "package:pubspec/pubspec.dart";
import "package:path/path.dart" as path;

class HardOverrideCommand extends Command<void> {
  @override
  final String name = "hard_override";

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

        final map = (String key, DependencyReference ref) {
          if (ref is! HostedReference) return MapEntry(key, ref);

          final localPackage = packages.firstWhere(
            (package) => package.name == key,
            orElse: () => null,
          );

          if (localPackage == null) return MapEntry(key, ref);

          return MapEntry(
            key,
            PathReference(
              path.relative(
                localPackage.directory.path,
                from: package.directory.path,
              ),
            ),
          );
        };

        package.pubspec
            .copy(
              dependencies: package.pubspec.dependencies.map(map),
              devDependencies: package.pubspec.devDependencies.map(map),
            )
            .save(package.directory);
      },
    );
  }
}
