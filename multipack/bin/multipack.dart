import "dart:io";

import "package:args/command_runner.dart";
import "package:multipack/package.dart";
import "package:multipack/commands.dart";

void main(List<String> arguments) async {
  final dependencyGraph = await getPackageGraph(Directory.current);

  final orderedPackages = dependencyGraph
      .sortedTopologicalOrdering()
      .reversed
      .map((vertex) => vertex.data)
      .toList();

  final packageNames = orderedPackages
      .map(
        (package) => package.name,
      )
      .toList();

  final runner = CommandRunner<void>(
    "multipack",
    "Manage monorepo.",
  );

  runner.argParser.addMultiOption(
    "only",
    abbr: "o",
    help: "Whitelist packages.",
    defaultsTo: packageNames,
    allowed: packageNames,
  );

  runner.addCommand(PubCommand(orderedPackages));
  runner.addCommand(FmtCommand(orderedPackages));
  runner.addCommand(AnalyzeCommand(orderedPackages));
  runner.addCommand(ExecCommand(orderedPackages));
  runner.addCommand(PubspecCommand(orderedPackages));

  await runner.run(arguments);
}
