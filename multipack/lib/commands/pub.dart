import "package:args/command_runner.dart";
import "package:multipack/commands/pub/get.dart";

class PubCommand extends Command<void> {
  @override
  final String name = "pub";

  @override
  final String description = "run pub in every package";

  PubCommand() {
    addSubcommand(GetCommand());
  }
}
