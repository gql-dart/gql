import "dart:async";
import "dart:io";

import "package:multipack/commands/common.dart";
import "package:multipack/package.dart";
import "package:pub_semver/pub_semver.dart";

class BumpAlphaCommand extends MultipackCommand {
  BumpAlphaCommand(
    List<Package> packages,
  ) : super(
          "bump-alpha",
          "Bumps versions for alpha release.",
          packages,
        );

  @override
  FutureOr<int> runOnPackage(Package package) async {
    try {
      final pubspec = package.pubspec;

      final next = pubspec.version.nextBreaking;

      final alpha = Version(
        next.major,
        next.minor,
        next.patch,
        pre: "alpha",
        build: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      await pubspec
          .copy(
            version: alpha,
          )
          .save(package.directory);

      final changelogFile = File.fromUri(
        package.directory.uri.resolve("CHANGELOG.md"),
      );
      final changelog = await changelogFile.readAsString();
      await changelogFile.writeAsString(
        "## ${alpha.toString()}\n\n$changelog",
        flush: true,
      );

      return 0;
    } catch (e) {
      return 1;
    }
  }
}
