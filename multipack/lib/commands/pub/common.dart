import "dart:io";

import "package:multipack/commands/common.dart";

Future<void> pub(List<String> args) async => await findPackageDirectories(
      Directory.current,
    ).forEach(
      (dir) async {
        print("running in ${dir.path}...");

        final result = await Process.run(
          "pub",
          args,
          workingDirectory: dir.path,
        );

        print("done in ${dir.path}");

        stdout.write(result.stdout);
      },
    );
