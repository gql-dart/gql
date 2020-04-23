part of 'definitions.dart';

@immutable
class SelectionSet extends ExecutableWithResolver {
  const SelectionSet(
    this.astNode, [
    this.schemaType,
    GetExecutableType getType,
  ]) : super(getType);

  final TypeDefinition schemaType;

  @override
  final SelectionSetNode astNode;

  List<Selection> get selections => astNode.selections
      .map((selection) => Selection.fromNode(selection, schemaType, getType))
      .toList();

  List<Field> get fields => selections.whereType<Field>().toList();

  List<FragmentSpread> get fragmentSpreads =>
      selections.whereType<FragmentSpread>().toList();

  List<InlineFragment> get inlineFragments =>
      selections.whereType<InlineFragment>().toList();

  static SelectionSet fromNode(
    SelectionSetNode astNode, [
    TypeDefinitionWithFieldSet schemaType,
    GetExecutableType getType,
  ]) =>
      SelectionSet(astNode, schemaType, getType);
}

@immutable
abstract class Selection extends ExecutableWithResolver {
  const Selection([GetExecutableType getType]) : super(getType);

  GraphQLEntity get schemaType;

  @override
  SelectionNode get astNode;

  String get alias;

  static Selection fromNode(
    SelectionNode astNode, [

    /// The [schemaType] of the containing element
    TypeDefinition schemaType,
    GetExecutableType getType,
  ]) {
    if (astNode is FieldNode) {
      // fields can only be seleted on Interface and Object types
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
      // inline fragments must always specify a type condition,
      final onType = getType.fromSchema(astNode.typeCondition.on.name.value);
      return InlineFragment(astNode, onType, getType);
    }

    throw ArgumentError('$astNode is unsupported');
  }
}

@immutable
class Field extends Selection {
  const Field(
    this.astNode, [
    this.schemaType,
    GetExecutableType getType,
  ]) : super(getType);

  @override
  final FieldNode astNode;

  @override
  final FieldDefinition schemaType;

  @override
  String get alias => astNode.alias?.value ?? name;

  String get name => astNode.name.value;

  GraphQLType get type => schemaType.type;

  List<Argument> get arguments =>
      astNode.arguments.map(Argument.fromNode).toList();

  List<Directive> get directives =>
      astNode.directives.map(Directive.fromNode).toList();

  SelectionSet get selectionSet => astNode.selectionSet != null
      ? SelectionSet(
          astNode.selectionSet,
          getType.fromSchema(type.baseTypeName),
          getType,
        )
      : null;

  static Field fromNode(FieldNode astNode) => Field(astNode);
}

@immutable
class FragmentSpread extends Selection {
  const FragmentSpread(this.astNode,
      [this.schemaType, GetExecutableType getType])
      : super(getType);

  @override
  final FragmentSpreadNode astNode;

  @override
  final TypeDefinition schemaType;

  String get name => astNode.name.value;

  @override
  String get alias => name;

  FragmentDefinition get fragment {
    final frag = getType.fromFragments(name);
    if (frag == null) {
      throw StateError(
        'Could not resolve fragment $name referenced by fragment spread ${this}',
      );
    }
    return frag;
  }

  List<Directive> get directives =>
      astNode.directives.map(Directive.fromNode).toList();

  static FragmentSpread fromNode(FragmentSpreadNode astNode) =>
      FragmentSpread(astNode);
}

@immutable
class InlineFragment extends Selection {
  const InlineFragment(
    this.astNode, [
    this.schemaType,
    GetExecutableType getType,
  ]) : super(getType);

  @override
  final InlineFragmentNode astNode;

  TypeCondition get typeCondition =>
      TypeCondition.fromNode(astNode.typeCondition);

  TypeDefinitionWithFieldSet get onType =>
      getType.fromSchema(onTypeName) as TypeDefinitionWithFieldSet;

  String get onTypeName => typeCondition.on.name;

  @override
  String get alias => 'on$onTypeName';

  @override
  final TypeDefinition schemaType;

  List<Directive> get directives =>
      astNode.directives.map(Directive.fromNode).toList();

  SelectionSet get selectionSet =>
      SelectionSet.fromNode(astNode.selectionSet, onType, getType);

  static InlineFragment fromNode(InlineFragmentNode astNode) =>
      InlineFragment(astNode);
}
