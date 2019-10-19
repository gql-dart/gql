import "package:args/command_runner.dart";
import "package:multipack/commands/pub.dart";
import "package:multipack/commands/pubspec.dart";

void main(List<String> arguments) async {
  CommandRunner<void>(
    "multipack",
    "Manages monorepo packages.",
  )
    ..addCommand(PubCommand())
    ..addCommand(PubspecCommand())
    ..run(arguments);
}
