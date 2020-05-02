import "dart:async";

import "package:multipack/commands/common.dart";
import "package:multipack/package.dart";

class PubCommand extends PassthroughCommand {
  PubCommand(List<Package> packages)
      : super(
          "pub",
          "Run pub.",
          packages,
        );

  @override
  FutureOr<int> runOnPackage(Package package) => package.pub(
        argResults.arguments,
        nameWidth: nameWidth,
      );
}
