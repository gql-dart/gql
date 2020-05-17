import "dart:async";

import "package:build/build.dart";
import "package:path/path.dart" as p;
import "package:glob/glob.dart";
import "package:code_builder/code_builder.dart";
import "package:dart_style/dart_style.dart";
import "package:source_gen/source_gen.dart";
import "package:gql_code_builder/serializer.dart";
import "package:analyzer/dart/element/element.dart";

import "./allocators/pick_allocator.dart";

class SerializerBuilder implements Builder {
  final AssetId schemaId;

  SerializerBuilder(
    this.schemaId,
  );

  static final _emitter = DartEmitter(
    PickAllocator(
      doNotPick: ["package:built_value/serializer.dart"],
      include: ["package:built_collection/built_collection.dart"],
    ),
    true,
  );
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
    final Set<ClassElement> classes = {};
    await for (final input in buildStep.findAssets(_generatedFiles)) {
      final Set<String> builtTypes = {"Built", "EnumClass"};
      final builtClasses =
          LibraryReader(await buildStep.resolver.libraryFor(input))
              .classes
              .where(
                (libClass) => libClass.allSupertypes.any(
                  (interface) =>
                      interface.element.source.uri.toString() ==
                          "package:built_value/built_value.dart" &&
                      builtTypes.contains(interface.element.name),
                ),
              );

      builtClasses.forEach(classes.add);
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
