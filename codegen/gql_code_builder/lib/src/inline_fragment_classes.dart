import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/data.dart";
import "package:gql_code_builder/src/config/when_extension_config.dart";
import "package:gql_code_builder/src/when_extension.dart";

import "../source.dart";
import "./common.dart";
import "./operation/data.dart";

/// Builds the following classes for inline fragments:
///   1. An abstract root class that will be implemented by each instantiable
///      class. This includes a `built_value` serializer that instantiates
///      the appropriate concrete class based on the `__typename` field.
///   2. A "base" instantiable class that includes the common fields.
///   3. An instantiable class for each inline fragment that includes the
///      common fields and the fragment fields.
List<Spec> buildInlineFragmentClasses({
  required String name,
  required List<Method> fieldGetters,
  required List<SelectionNode> selections,
  required SourceNode schemaSource,
  required String type,
  required Map<String, Reference> typeOverrides,
  required Map<String, SourceSelections> fragmentMap,
  required Map<String, SourceSelections> superclassSelections,
  required List<InlineFragmentNode> inlineFragments,
  required bool built,
  required InlineFragmentSpreadWhenExtensionConfig whenExtensionConfig,
  required FragmentRefMap fragmentRefMap,
}) {
  final whenExtension = inlineFragmentWhenExtension(
    baseTypeName: name,
    inlineFragments: inlineFragments,
    config: whenExtensionConfig,
  );

  List<SelectionNode> selectionsForInlineFragment(InlineFragmentNode inlineFragment) {
    final fragSelections = mergeSelections(
      [
        ...selections.whereType<FieldNode>(),
        ...selections.whereType<FragmentSpreadNode>(),
        ...inlineFragment.selectionSet.selections,
      ],
      fragmentMap,
    );

    return fragSelections;
  }

  Reference? existingFragmentWithSameSelections(String typeName, List<SelectionNode> fragmentSelections) {
    final existing = fragmentRefMap[(
      typeName,
      BuiltSet.of(
        fragmentSelections.withoutFragmentSpreads,
      )
    )];
    print("existing: $existing on $typeName with selections: $fragmentSelections");
    return existing;
  }

  List<Spec> buildSelectionSetClassesForInlineFragment(
          InlineFragmentNode inlineFragment, List<SelectionNode> fragmentSelections) =>
      buildSelectionSetDataClasses(
        name: _inlineFragmentName(name, inlineFragment),
        selections: fragmentSelections,
        fragmentMap: fragmentMap,
        schemaSource: schemaSource,
        type: inlineFragment.typeCondition!.on.name.value,
        typeOverrides: typeOverrides,
        superclassSelections: {
          name: SourceSelections(url: null, selections: selections),
        },
        built: built,
        fragmentRefMap: fragmentRefMap,
        whenExtensionConfig: whenExtensionConfig,
      );

  List<Spec> baseClass() {
    final baseSelections = mergeSelections([
      ...selections.whereType<FieldNode>(),
      ...selections.whereType<FragmentSpreadNode>(),
    ], fragmentMap, true);

    final existingFragment = existingFragmentWithSameSelections(type, baseSelections);

    if (existingFragment != null) {
      final existingFragmentName = existingFragment.symbol;
      final targetName = _inlineFragmentBaseName(name);

      print(
          "Found existing fragment $existingFragmentName with same selections as $targetName. Using $existingFragmentName instead.");
      print("adding typedef");
      /* TODO : make the fragmentData class a subtype of this class so we can use it here?
      return [
        TypeDef((b) => b
          ..name = targetName
          ..definition = existingFragment),


      ];
       */
    } else {
      print("&&&&&&& no existing fragment found for $name on $type with selections: $baseSelections");
    }

    return [
      ...buildSelectionSetDataClasses(
        name: _inlineFragmentBaseName(name),
        selections: baseSelections,
        fragmentMap: fragmentMap,
        schemaSource: schemaSource,
        type: type,
        typeOverrides: typeOverrides,
        superclassSelections: {name: SourceSelections(url: null, selections: selections)},
        built: built,
        whenExtensionConfig: whenExtensionConfig,
        fragmentRefMap: fragmentRefMap,
      ),
    ];
  }

  return [
    Class(
      (b) => b
        ..abstract = true
        ..name = builtClassName(name)
        ..implements.addAll(
          superclassSelections.keys.map<Reference>(
            (superName) => refer(
              builtClassName(superName),
              (superclassSelections[superName]?.url ?? "") + "#data",
            ),
          ),
        )
        ..methods.addAll([
          ...fieldGetters,
          if (built)
            ..._inlineFragmentRootSerializationMethods(
              name: builtClassName(name),
              inlineFragments: inlineFragments,
              fragmentRefMap: fragmentRefMap,
            ),
        ]),
    ),
    if (whenExtension != null) whenExtension,

    /// the base class for all specialized inline fragments that has the common fields
    ...baseClass(),

    /// specialized inline fragments, which include the common fields and the fragment fields for that fragment
    /// TODO: Handle inline fragments without a type condition
    /// https://spec.graphql.org/June2018/#sec-Inline-Fragments
    ...inlineFragments
        .where((frag) => frag.typeCondition != null)
        .map(
          (frag) => (
            inlineFragment: frag,
            selections: selectionsForInlineFragment(frag),
          ),
        )
        .expand(
      (fragmentWithSelections) {
        final (:inlineFragment, selections: fragmentSelections) = fragmentWithSelections;

        final typeName = inlineFragment.typeCondition!.on.name.value;

        final existingFragment = existingFragmentWithSameSelections(typeName, fragmentSelections);

        if (existingFragment != null) {
          final existingFragmentName = existingFragment.symbol;
          final targetName = _inlineFragmentName(name, inlineFragment);

          print(
              "Found existing fragment $existingFragmentName with same selections as $targetName. Using $existingFragmentName instead.");
          print("adding typedef");
          /* TODO : make the fragmentData class a subtype of this class so we can use it here?
          return [];

           */
        }

        return buildSelectionSetClassesForInlineFragment(
          inlineFragment,
          fragmentSelections,
        );
      },
    ),
  ];
}

String _inlineFragmentName(String baseName, InlineFragmentNode inlineFragment) =>
    "${baseName}__as${inlineFragment.typeCondition!.on.name.value}";

String _inlineFragmentBaseName(String baseName) => "${baseName}__base";

List<Method> _inlineFragmentRootSerializationMethods({
  required String name,
  required List<InlineFragmentNode> inlineFragments,
  required FragmentRefMap fragmentRefMap,
}) {
  final toJson = buildToJsonGetter(name);
  final fromJson = buildFromJsonGetter(name);

  final inlineSerializer = _inlineFragmentSerializer(name, inlineFragments, fragmentRefMap);

  return [
    inlineSerializer,
    toJson,
    fromJson,
  ];
}

Method _inlineFragmentSerializer(
  String name,
  List<InlineFragmentNode> inlineFragments,
  FragmentRefMap fragmentRefMap,
) {
  final baseSerializer = buildSerializerGetter(name);

  final inlineSerializer = baseSerializer.rebuild(
    (b) => b
      ..body = TypeReference((b) => b
        ..symbol = "InlineFragmentSerializer"
        ..url = "package:gql_code_builder/src/serializers/inline_fragment_serializer.dart"
        ..types.add(refer(name))).call([
        literalString(name),
        refer(_inlineFragmentBaseName(name)),
        literalMap(
          /// TODO: Handle inline fragments without a type condition
          /// https://spec.graphql.org/June2018/#sec-Inline-Fragments
          {
            for (final v in inlineFragments.where((frag) => frag.typeCondition != null))
              "${v.typeCondition!.on.name.value}": refer(
                _inlineFragmentName(name, v),
              )
          },
        ),
      ]).code,
  );
  return inlineSerializer;
}
