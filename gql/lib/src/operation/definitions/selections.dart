import "package:gql/ast.dart";
import "package:gql/src/operation/definitions/base_types.dart";
import "package:gql/src/operation/definitions/definitions.dart";
import "package:gql/src/operation/definitions/type_resolver.dart";
import "package:gql/src/schema/definitions.dart";
import "package:meta/meta.dart";

/// [Selection Sets](https://spec.graphql.org/June2018/#sec-Selection-Sets)
/// specify the [Field]s to select from their cooresponding schema type,
/// either directly, or indirectly through [FragmentSpread]s and [InlineFragment]s.
///
/// [OperationDefinition]s only consist of an optional operation name
/// and a [SelectionSet] into one of the root [OperationTypeDefinition]s.
///
/// An operation selects the set of information it needs,
/// and will receive exactly that information and nothing more,
/// avoiding over‐fetching and under‐fetching data.
@immutable
class SelectionSet extends ExecutableWithResolver {
  const SelectionSet(
    this.astNode, [
    this.schemaType,
    GetExecutableType? getType,
  ]) : super(getType);

  final TypeDefinition? schemaType;

  @override
  final SelectionSetNode? astNode;

  List<Selection> get selections => astNode!.selections
      .map((selection) => Selection.fromNode(selection, schemaType, getType))
      .toList();

  List<Field> get fields => selections.whereType<Field>().toList();

  List<FragmentSpread> get fragmentSpreads =>
      selections.whereType<FragmentSpread>().toList();

  List<InlineFragment> get inlineFragments =>
      selections.whereType<InlineFragment>().toList();
}

/// [SelectionSet]s consist of [selections](https://spec.graphql.org/June2018/#Selection)
/// ([Field]s, [FragmentSpread]s, or [InlineFragment]s)s
@immutable
abstract class Selection extends ExecutableWithResolver {
  const Selection([GetExecutableType? getType]) : super(getType);

  GraphQLEntity? get schemaType;

  @override
  SelectionNode get astNode;

  String get alias;

  static Selection fromNode(
    SelectionNode astNode, [
    /// The [schemaType] of the containing element
    TypeDefinition? schemaType,
    GetExecutableType? getType,
  ]) {
    if (astNode is FieldNode) {
      // fields can only be selected on Interface and Object types
      final fieldType = (schemaType != null)
          ? (schemaType as TypeDefinitionWithFieldSet)
              .getField(astNode.name.value)
          : null;
      return Field(astNode, fieldType, getType);
    }

    if (astNode is FragmentSpreadNode) {
      // Fragments can be specified on object types, interfaces, and unions.
      // TODO need another mechanism for saturating fragment spreads.
      // Probably adding a fragmentSpread argument to the getType when within the executable context.
      return FragmentSpread(astNode, schemaType, getType);
    }
    if (astNode is InlineFragmentNode) {
      // inline fragments must always specify a type condition
      final onType = getType!.fromSchema!(astNode.typeCondition!.on.name.value);
      return InlineFragment(astNode, onType, getType);
    }

    throw ArgumentError("$astNode is unsupported");
  }
}

/// A [SelectionSet] is primarily composed of [fields](https://spec.graphql.org/June2018/#sec-Language.Fields).
///
/// A field describes one discrete piece of information available to request within a selection set.
///
/// Some fields describe complex data or relationships to other data.
/// In order to further explore this data, a field may itself contain a selection set,
/// allowing for deeply nested requests.
///
/// All GraphQL operations must specify their selections down to fields
/// which return scalar values to ensure an unambiguously shaped response.
@immutable
class Field extends Selection {
  const Field(
    this.astNode, [
    this.schemaType,
    GetExecutableType? getType,
  ]) : super(getType);

  @override
  final FieldNode astNode;

  @override
  final FieldDefinition? schemaType;

  @override
  String get alias => astNode.alias?.value ?? name;

  String get name => astNode.name.value;

  GraphQLType? get type => schemaType!.type;

  List<Argument> get arguments =>
      astNode.arguments.map((a) => Argument(a)).toList();

  List<Directive> get directives =>
      astNode.directives.map((d) => Directive(d)).toList();

  SelectionSet? get selectionSet => astNode.selectionSet != null
      ? SelectionSet(
          astNode.selectionSet,
          getType.fromSchema!(type!.baseTypeName),
          getType,
        )
      : null;
}

/// [FragmentDefinition]s are consumed by using the
/// [spread](https://spec.graphql.org/June2018/#FragmentSpread) operator (`...`).
///
/// All fields selected by the fragment will be added to the query field selection
/// at the same level as the fragment invocation.
///
/// This happens through multiple levels of fragment spreads.
@immutable
class FragmentSpread extends Selection {
  const FragmentSpread(this.astNode,
      [this.schemaType, GetExecutableType? getType])
      : super(getType);

  @override
  final FragmentSpreadNode astNode;

  @override
  final TypeDefinition? schemaType;

  String get name => astNode.name.value;

  @override
  String get alias => name;

  FragmentDefinition get fragment {
    final frag = getType.fromFragments(name);
    if (frag == null) {
      throw StateError(
        "Could not resolve fragment $name referenced by fragment spread ${this}",
      );
    }
    return frag;
  }

  List<Directive> get directives =>
      astNode.directives.map((d) => Directive(d)).toList();
}

/// [Inline Fragments](https://spec.graphql.org/June2018/#sec-Inline-Fragments)
/// are [FragmentDefinition]s defined inline within a [SelectionSet].
///
/// This is done to conditionally include fields based on their runtime type via [TypeCondition]s.
@immutable
class InlineFragment extends Selection {
  const InlineFragment(
    this.astNode, [
    this.schemaType,
    GetExecutableType? getType,
  ]) : super(getType);

  @override
  final InlineFragmentNode astNode;

  TypeCondition get typeCondition => TypeCondition(astNode.typeCondition);

  TypeDefinitionWithFieldSet? get onType =>
      getType.fromSchema!(onTypeName) as TypeDefinitionWithFieldSet?;

  String get onTypeName => typeCondition.on.name;

  @override
  String get alias => "on$onTypeName";

  @override
  final TypeDefinition? schemaType;

  List<Directive> get directives =>
      astNode.directives.map((d) => Directive(d)).toList();

  SelectionSet get selectionSet =>
      SelectionSet(astNode.selectionSet, onType, getType);
}
