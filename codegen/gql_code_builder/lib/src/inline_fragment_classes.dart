import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/src/config/when_extension_config.dart";
import "package:gql_code_builder/src/when_extension.dart";

import "./common.dart";
import "./operation/data.dart";
import "../source.dart";

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
}) {
  final whenExtension = inlineFragmentWhenExtension(
    baseTypeName: name,
    inlineFragments: inlineFragments,
    config: whenExtensionConfig,
  );
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
            ),
        ]),
    ),
    if (whenExtension != null) whenExtension,
    ...buildSelectionSetDataClasses(
      name: "${name}__base",
      selections: mergeSelections(
        [
          ...selections.whereType<FieldNode>(),
          ...selections.whereType<FragmentSpreadNode>(),
        ],
        fragmentMap,
      ),
      fragmentMap: fragmentMap,
      schemaSource: schemaSource,
      type: type,
      typeOverrides: typeOverrides,
      superclassSelections: {
        name: SourceSelections(url: null, selections: selections)
      },
      built: built,
      whenExtensionConfig: whenExtensionConfig,
    ),

    /// TODO: Handle inline fragments without a type condition
    /// https://spec.graphql.org/June2018/#sec-Inline-Fragments
    ...inlineFragments.where((frag) => frag.typeCondition != null).expand(
          (inlineFragment) => buildSelectionSetDataClasses(
              name: "${name}__as${inlineFragment.typeCondition!.on.name.value}",
              selections: mergeSelections(
                [
                  ...selections.whereType<FieldNode>(),
                  ...selections.whereType<FragmentSpreadNode>(),
                  ...inlineFragment.selectionSet.selections,
                ],
                fragmentMap,
              ),
              fragmentMap: fragmentMap,
              schemaSource: schemaSource,
              type: inlineFragment.typeCondition!.on.name.value,
              typeOverrides: typeOverrides,
              superclassSelections: {
                name: SourceSelections(url: null, selections: selections)
              },
              built: built,
              whenExtensionConfig: whenExtensionConfig),
        ),
  ];
}

List<Method> _inlineFragmentRootSerializationMethods({
  required String name,
  required List<InlineFragmentNode> inlineFragments,
}) =>
    [
      buildSerializerGetter(name).rebuild(
        (b) => b
          ..body = TypeReference((b) => b
            ..symbol = "InlineFragmentSerializer"
            ..url =
                "package:gql_code_builder/src/serializers/inline_fragment_serializer.dart"
            ..types.add(refer(name))).call([
            literalString(name),
            refer("${name}__base"),
            literalMap(
              /// TODO: Handle inline fragments without a type condition
              /// https://spec.graphql.org/June2018/#sec-Inline-Fragments
              {
                for (var v in inlineFragments
                    .where((frag) => frag.typeCondition != null))
                  "${v.typeCondition!.on.name.value}": refer(
                    "${name}__as${v.typeCondition!.on.name.value}",
                  )
              },
            ),
          ]).code,
      ),
      buildToJsonGetter(name),
      buildFromJsonGetter(name),
    ];
