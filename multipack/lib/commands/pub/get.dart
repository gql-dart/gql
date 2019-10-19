import "package:args/command_runner.dart";
import "package:multipack/commands/pub/common.dart";

class GetCommand extends Command<void> {
  @override
  final String name = "get";

  @override
  final String description = "runs pub get in every package";

  @override
  void run() async => pub(["get"]);
}
