import "dart:async";

import "package:multipack/commands/common.dart";
import "package:multipack/package.dart";
import "package:pub_semver/pub_semver.dart";
import "package:pubspec/pubspec.dart";

class SyncVersionsCommand extends MultipackCommand {
  SyncVersionsCommand(
    List<Package> packages,
  ) : super(
          "sync-versions",
          "Synchronizes dependency versions",
          packages,
        );

  Map<String, DependencyReference> updateDependencies(
    Map<String, DependencyReference> deps,
  ) =>
      Map.fromEntries(
        deps.entries.map(
          (entry) {
            final localDep = packages.firstWhere(
              (package) => package.name == entry.key,
              orElse: () => null,
            );

            if (localDep == null || entry.value is! HostedReference) {
              return entry;
            }

            return MapEntry(
              entry.key,
              HostedReference(
                VersionConstraint.parse("^${localDep.pubspec.version}"),
              ),
            );
          },
        ),
      );

  @override
  FutureOr<int> runOnPackage(Package package) async {
    try {
      final pubspec = package.pubspec;
      await pubspec
          .copy(
            dependencies: pubspec.dependencies == null
                ? null
                : updateDependencies(pubspec.dependencies),
            devDependencies: pubspec.devDependencies == null
                ? null
                : updateDependencies(pubspec.devDependencies),
          )
          .save(package.directory);

      return 0;
    } catch (e) {
      return 1;
    }
  }
}
