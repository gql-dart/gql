import "package:meta/meta.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "package:gql_code_builder/src/common.dart";
import "package:gql_code_builder/src/operation/data.dart";
import "package:gql_code_builder/source.dart";

/// Builds the following classes for inline fragments:
///   1. An abstract root class that will be implemented by each instantiable
///      class. This includes a `built_value` serializer that instantiates
///      the appropriate concrete class based on the `__typename` field.
///   2. A "base" instantiable class that includes the common fields.
///   3. An instantiable class for each inline fragment that includes the
///      common fields and the fragment fields.
List<Class> buildInlineFragmentClasses({
  @required String name,
  @required List<Method> fieldGetters,
  @required List<SelectionNode> selections,
  @required SourceNode schemaSource,
  @required String type,
  @required Map<String, Reference> typeOverrides,
  @required Map<String, SourceSelections> fragmentMap,
  @required Map<String, SourceSelections> superclassSelections,
  @required List<InlineFragmentNode> inlineFragments,
  @required bool built,
}) =>
    [
      Class(
        (b) {
          b = b
            ..abstract = true
            ..name = builtClassName(name)
            ..implements.addAll(
              superclassSelections.keys.map<Reference>(
                (superName) => refer(
                  builtClassName(superName),
                  (superclassSelections[superName].url ?? "") + "#data",
                ),
              ),
            )
            ..methods.addAll(fieldGetters);
          if (built) {
            b = b
              ..methods.addAll(
                _inlineFragmentRootSerializationMethods(
                  name: builtClassName(name),
                  inlineFragments: inlineFragments,
                ),
              );
          }
          return b;
        },
      ),
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
      ),
      ...inlineFragments.expand(
        (inlineFragment) => buildSelectionSetDataClasses(
          name: "${name}__as${inlineFragment.typeCondition.on.name.value}",
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
          type: inlineFragment.typeCondition.on.name.value,
          typeOverrides: typeOverrides,
          superclassSelections: {
            name: SourceSelections(url: null, selections: selections)
          },
          built: built,
        ),
      ),
    ];

List<Method> _inlineFragmentRootSerializationMethods({
  String name,
  List<InlineFragmentNode> inlineFragments,
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
            literalList(
              inlineFragments.map(
                (inlineFragment) => refer(
                  "${name}__as${inlineFragment.typeCondition.on.name.value}",
                ),
              ),
            ),
          ]).code,
      ),
      buildToJsonGetter(name),
      buildFromJsonGetter(name),
    ];
