import "dart:async";

import "package:build/build.dart";
import "package:path/path.dart" as p;
import "package:glob/glob.dart";
import "package:code_builder/code_builder.dart";
import "package:dart_style/dart_style.dart";
import "package:source_gen/source_gen.dart";
import "package:gql_code_builder/serializer.dart";
import "package:analyzer/dart/element/element.dart";

import "./allocators/prefixing_allocator.dart";

class SerializerBuilder implements Builder {
  final AssetId schemaId;

  SerializerBuilder(
    this.schemaId,
  );

  static final _emitter = DartEmitter(
      PrefixingAllocator([
        "package:built_value/built_value.dart",
        "package:built_value/serializer.dart",
      ]),
      true);
  static final _formatter = DartFormatter();
  static final _generatedFiles = Glob("lib/**.gql.dart");

  // create a path for the serializers output in same directory as schema
  List<String> get pathSegments => schemaId.pathSegments
    ..removeLast()
    ..add("serializers.gql.dart");

  @override
  Map<String, List<String>> get buildExtensions => {
        // buildExtensions already include the 'lib' path segment, so we must remove it here
        r"$lib$": [p.joinAll(pathSegments.skip(1))],
      };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final List<ClassElement> classes = [];
    await for (final input in buildStep.findAssets(_generatedFiles)) {
      final library = await buildStep.resolver.libraryFor(input);
      LibraryReader(library)
          .classes
          .where(
            (libClass) => libClass.interfaces.any(
              (interface) =>
                  // TODO: also ensure that the interface comes from the BuiltValue lib
                  interface.element.name == "Built" ||
                  interface.element.name == "EnumClass",
            ),
          )
          .forEach(classes.add);
    }

    final output = AssetId(
      buildStep.inputId.package,
      p.joinAll(pathSegments),
    );

    final library = buildSerializerLibrary(
      classes,
      "serializers.gql.g.dart",
    );

    return buildStep.writeAsString(
      output,
      _formatter.format("${library.accept(_emitter)}"),
    );
  }
}
