import "dart:async";

import "package:multipack/commands/common.dart";
import "package:multipack/package.dart";

class FmtCommand extends PassthroughCommand {
  FmtCommand(List<Package> packages)
      : super(
          "fmt",
          "Run formatter.",
          packages,
        );

  @override
  FutureOr<void> runOnPackage(Package package) => package.fmt(
        argResults.arguments,
        nameWidth: nameWidth,
      );
}
