import "dart:async";

import "package:multipack/commands/common.dart";
import "package:multipack/package.dart";

class AnalyzeCommand extends PassthroughCommand {
  AnalyzeCommand(List<Package> packages)
      : super(
          "analyze",
          "Run analyzer.",
          packages,
        );

  @override
  FutureOr<int> runOnPackage(Package package) => package.analyze(
        argResults.arguments,
        nameWidth: nameWidth,
      );
}
