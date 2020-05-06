import "dart:async";
import "dart:io";
import "dart:math";

import "package:args/args.dart";
import "package:args/command_runner.dart";
import "package:multipack/package.dart";

abstract class MultipackCommand extends Command<void> {
  @override
  final String name;

  @override
  final String description;

  final List<Package> packages;

  List<String> get packageNames => packages
      .map(
        (package) => package.name,
      )
      .toList();

  List<String> get targetNames {
    final whitelist = (globalResults["only"] as Iterable<String>).toList();
    final blacklist = (globalResults["skip"] as Iterable<String>).toList();

    return whitelist
        .where(
          (package) => !blacklist.contains(package),
        )
        .toList();
  }

  List<Package> get targets => packages
      .where(
        (package) => targetNames.contains(package.name),
      )
      .toList();

  int get nameWidth => targetNames
      .map(
        (name) => name.length,
      )
      .reduce(max);

  MultipackCommand(this.name, this.description, this.packages);

  @override
  Future<void> run() async {
    final exitCodes = <int>[];
    for (final target in targets) {
      exitCodes.add(await runOnPackage(target));
    }

    final hasFailed = exitCodes.any((code) => code != 0);

    if (hasFailed) {
      exit(1);
    }
  }

  FutureOr<int> runOnPackage(Package package);
}

abstract class PassthroughCommand extends MultipackCommand {
  @override
  ArgParser argParser = ArgParser.allowAnything();

  PassthroughCommand(
    String name,
    String description,
    List<Package> packages,
  ) : super(
          name,
          description,
          packages,
        );
}
