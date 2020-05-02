import "dart:io";

import "package:directed_graph/directed_graph.dart";
import "package:pubspec/pubspec.dart";
import "package:ansicolor/ansicolor.dart";

final mpPen = AnsiPen()
  ..xterm(89, bg: true)
  ..white(bold: true);
final multipack = mpPen.write(" multipack ");

final packPen = AnsiPen()
  ..xterm(241, bg: true)
  ..white(bold: true);

final successPen = AnsiPen()
  ..xterm(22, bg: true)
  ..white(bold: true);

final failurePen = AnsiPen()
  ..xterm(124, bg: true)
  ..white(bold: true);

class Package {
  final Directory directory;
  final String name;
  final PubSpec pubspec;
  final bool isFlutter;

  const Package({
    this.directory,
    this.name,
    this.pubspec,
    this.isFlutter,
  });

  Future<int> run(
    String executable,
    List<String> arguments, {
    int nameWidth,
  }) async {
    final packName = packPen.write(
      " ${name.padRight(nameWidth)} ",
    );

    final cmd = [executable, ...arguments].join(" ");

    print("${multipack}${packName} ${cmd}");

    final process = await Process.start(
      executable,
      arguments,
      workingDirectory: directory.path,
    );

    process.stdout.listen((data) => stdout.add(data));
    process.stderr.listen((data) => stderr.add(data));

    final exitCode = await process.exitCode;

    final status = exitCode == 0
        ? successPen.write(" success ".padRight(nameWidth + 2))
        : failurePen.write(" failure ${exitCode} ".padRight(nameWidth + 2));

    print("${multipack}${status}");

    print("");

    return exitCode;
  }

  Future<int> pub(
    List<String> args, {
    int nameWidth,
  }) {
    final executable = isFlutter ? "flutter" : "pub";
    final arguments = isFlutter ? ["pub", ...args] : args;

    return run(
      executable,
      arguments,
      nameWidth: nameWidth,
    );
  }

  Future<int> fmt(
    List<String> args, {
    int nameWidth,
  }) {
    final executable = isFlutter ? "flutter" : "dartfmt";
    final arguments = isFlutter ? ["format", ...args] : args;

    return run(
      executable,
      arguments,
      nameWidth: nameWidth,
    );
  }

  Future<int> analyze(
    List<String> args, {
    int nameWidth,
  }) {
    const executable = "dartanalyzer";
    final arguments = args;

    return run(
      executable,
      arguments,
      nameWidth: nameWidth,
    );
  }

  @override
  String toString() => name;
}

Stream<Package> findPackages(Directory root) =>
    findPackageDirectories(root).asyncMap(
      (dir) async {
        final pubspec = await PubSpec.load(dir);

        return Package(
          directory: dir,
          name: pubspec.name,
          isFlutter: pubspec.allDependencies.containsKey("flutter"),
          pubspec: pubspec,
        );
      },
    );

Stream<Directory> findPackageDirectories(Directory root) => root
    .list(recursive: true)
    .where(
      (entity) =>
          entity is File &&
          entity.path.endsWith(Platform.pathSeparator + "pubspec.yaml"),
    )
    .cast<File>()
    .map(
      (pubspec) => pubspec.parent.absolute,
    );

Future<DirectedGraph<Package>> getPackageGraph(Directory root) async {
  final vertices = await findPackages(root)
      .map((package) => Vertex<Package>(package))
      .toList();

  return DirectedGraph<Package>(
    {
      for (var vertex in vertices)
        vertex: vertex.data.pubspec.allDependencies.keys
            .map(
              (dep) => vertices.firstWhere(
                (v) => v.data.name == dep,
                orElse: () => null,
              ),
            )
            .where((v) => v != null)
            .toList(),
    },
    comparator: (
      Vertex<Package> vertex1,
      Vertex<Package> vertex2,
    ) =>
        vertex1.data.name.compareTo(vertex2.data.name),
  );
}
