import "dart:io";

Stream<Directory> findPackageDirectories(Directory root) => root
    .list(recursive: true)
    .where(
      (entity) =>
          entity is File &&
          entity.path.endsWith(Platform.pathSeparator + "pubspec.yaml"),
    )
    .cast<File>()
    .map(
      (pubspec) => pubspec.parent.absolute,
    );
