import "dart:async";

import "package:multipack/commands/common.dart";
import "package:multipack/package.dart";

class ExecCommand extends PassthroughCommand {
  ExecCommand(List<Package> packages)
      : super(
          "exec",
          "execute any command",
          packages,
        );

  @override
  FutureOr<void> runOnPackage(Package package) => package.run(
        argResults.arguments.first,
        argResults.arguments.sublist(1),
        nameWidth: nameWidth,
      );
}
