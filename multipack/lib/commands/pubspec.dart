import "package:args/command_runner.dart";
import "package:multipack/commands/pubspec/clean.dart";
import "package:multipack/commands/pubspec/override.dart";

class PubspecCommand extends Command<void> {
  @override
  final String name = "pubspec";

  @override
  final String description = "update contents of pubspec.yaml";

  PubspecCommand() {
    addSubcommand(OverrideCommand());
    addSubcommand(CleanCommand());
  }
}
