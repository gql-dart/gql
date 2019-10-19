import "dart:io";

import "package:args/command_runner.dart";
import "package:multipack/commands/pubspec/common.dart";
import "package:pubspec/pubspec.dart";

class CleanCommand extends Command<void> {
  @override
  final String name = "clean";

  @override
  final String description = "cleans dependency overrides";

  @override
  void run() => findPackages(
        Directory.current,
      ).forEach(
        (package) {
          print("cleaning ${package.name}...");

          package.pubspec.copy(
            dependencyOverrides: <String, DependencyReference>{},
          ).save(
            package.directory,
          );
        },
      );
}
