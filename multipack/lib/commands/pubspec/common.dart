import "dart:io";

import "package:multipack/commands/common.dart";
import "package:pubspec/pubspec.dart";

class Package {
  final Directory directory;
  final String name;
  final PubSpec pubspec;

  const Package({
    this.directory,
    this.name,
    this.pubspec,
  });
}

Stream<Package> findPackages(Directory root) =>
    findPackageDirectories(root).asyncMap(
      (dir) async {
        final pubspec = await PubSpec.load(dir);

        return Package(
          directory: dir,
          name: pubspec.name,
          pubspec: pubspec,
        );
      },
    );
