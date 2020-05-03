import "package:args/command_runner.dart";

import "package:multipack/commands/pubspec/clean.dart";
import "package:multipack/commands/pubspec/override.dart";
import "package:multipack/commands/pubspec/hard_override.dart";
import "package:multipack/commands/pubspec/sync_versions.dart";
import "package:multipack/package.dart";

class PubspecCommand extends Command<void> {
  @override
  final String name = "pubspec";

  @override
  final String description = "Update pubspec.yaml";

  PubspecCommand(List<Package> packages) : super() {
    addSubcommand(OverrideCommand(packages));
    addSubcommand(SyncVersionsCommand(packages));
    addSubcommand(HardOverrideCommand(packages));
    addSubcommand(CleanCommand(packages));
  }
}
