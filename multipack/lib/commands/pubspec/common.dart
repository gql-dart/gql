import "dart:io";

import "package:multipack/commands/common.dart";
import "package:pubspec/pubspec.dart";

class Package {
  final Directory directory;
  final String name;
  final PubSpec pubspec;
  final bool isFlutter;

  const Package({
    this.directory,
    this.name,
    this.pubspec,
    this.isFlutter,
  });
}

Stream<Package> findPackages(Directory root) =>
    findPackageDirectories(root).asyncMap(
      (dir) async {
        final pubspec = await PubSpec.load(dir);

        return Package(
          directory: dir,
          name: pubspec.name,
          isFlutter: pubspec.allDependencies.containsKey("flutter"),
          pubspec: pubspec,
        );
      },
    );
