// ignore_for_file: prefer_constructors_over_static_methods
import "package:meta/meta.dart";
import "package:gql/ast.dart";
import "package:gql/src/schema/definitions/definitions.dart";

part "selections.dart";
part "type_resolver.dart";

@immutable
abstract class ExecutableGraphQLEntity extends GraphQLEntity {
  const ExecutableGraphQLEntity();
}

@immutable
class ExecutableWithResolver extends ExecutableGraphQLEntity
    implements ExecutableTypeResolver {
  const ExecutableWithResolver([GetExecutableType getType])
      : getType = getType ?? GetExecutableType.withoutContext,
        super();

  @override
  final GetExecutableType getType;

  @override
  Node get astNode => throw UnimplementedError();
}

@immutable
abstract class ExecutableDefinition extends ExecutableWithResolver {
  const ExecutableDefinition([GetExecutableType getType]) : super(getType);

  @override
  ExecutableDefinitionNode get astNode;

  String get name => astNode.name?.value;

  static ExecutableDefinition fromNode(ExecutableDefinitionNode astNode,
      [GetExecutableType getType]) {
    if (astNode is OperationDefinitionNode) {
      return OperationDefinition.fromNode(astNode, getType);
    }
    if (astNode is FragmentDefinitionNode) {
      return FragmentDefinition.fromNode(astNode, getType);
    }

    throw ArgumentError("$astNode is unsupported");
  }
}

/// An [Operation](https://spec.graphql.org/June2018/#sec-Language.Operations) consists of
/// an optional operation name and a [SelectionSet] into one of the root [OperationTypeDefinition]s.
///
/// There are three types of [operations]((https://spec.graphql.org/June2018/#sec-Language.Operations)):
/// * `query` – a read‐only fetch.
/// * `mutation` – a write followed by a fetch.
/// * `subscription` – a long‐lived request that fetches data in response to source events.
@immutable
class OperationDefinition extends ExecutableDefinition {
  const OperationDefinition(
    this.astNode, [
    GetExecutableType getType,
  ]) : super(getType);

  @override
  final OperationDefinitionNode astNode;

  OperationType get type => astNode.type;

  ObjectTypeDefinition get schemaType =>
      getType.fromSchema(type.name) as ObjectTypeDefinition;

  List<VariableDefinition> get variables =>
      astNode.variableDefinitions.map(VariableDefinition.fromNode).toList();

  SelectionSet get selectionSet => SelectionSet(
        astNode.selectionSet,
        getType.fromSchema(type.name) as ObjectTypeDefinition,
        getType,
      );

  static OperationDefinition fromNode(
    OperationDefinitionNode astNode, [
    GetExecutableType getType,
  ]) =>
      OperationDefinition(astNode, getType);
}

/// [Fragments](https://spec.graphql.org/June2018/#sec-Language.Fragments)
/// are the primary unit of composition in GraphQL.
///
/// Fragments allow for the reuse of common repeated [Selection]s of fields,
/// reducing duplicated text in the document.
///
/// [InlineFragment]s can be used directly within a [Selection] to
/// condition upon a [TypeCondition]
/// when querying against an [InterfaceTypeDefinition] or [UnionTypeDefinition].
@immutable
class FragmentDefinition extends ExecutableDefinition {
  const FragmentDefinition(this.astNode, [GetExecutableType getType])
      : super(getType);

  @override
  final FragmentDefinitionNode astNode;

  TypeCondition get _typeCondition =>
      TypeCondition.fromNode(astNode.typeCondition);

  TypeDefinition get onType => getType.fromSchema(_typeCondition.on.name);

  List<Directive> get directives =>
      astNode.directives.map(Directive.fromNode).toList();

  SelectionSet get selectionSet =>
      SelectionSet(astNode.selectionSet, onType, getType);

  static FragmentDefinition fromNode(
    FragmentDefinitionNode astNode, [
    GetExecutableType getType,
  ]) =>
      FragmentDefinition(astNode, getType);
}

/// [FragmentDefinition]s must specify the type they apply to through
/// [type condition](https://spec.graphql.org/June2018/#sec-Type-Conditions)s
///
/// Fragments cannot be specified on any input value
/// ([ScalarTypeDefinition], [EnumTypeDefinition], or [InputObjectTypeDefinition]).
///
/// Fragments can be specified on [ObjectTypeDefinition]s, [InterfaceTypeDefinition]s, and [UnionTypeDefinition]s.
///
/// [Selection]s within fragments only return values when the concrete type of
/// the object it is operating on matches the type of the fragment.
@immutable
class TypeCondition extends ExecutableGraphQLEntity {
  const TypeCondition(this.astNode);

  @override
  final TypeConditionNode astNode;

  NamedType get on => NamedType.fromNode(astNode.on);

  static TypeCondition fromNode(TypeConditionNode astNode) =>
      TypeCondition(astNode);
}

/// [Variables](https://spec.graphql.org/June2018/#sec-Language.Variables)
/// can be used to parameterize [OperationDefinition]s,
/// maximizing query reuse, and avoiding costly string building in clients at runtime.
///
/// If not defined as constant (for example, in [DefaultValue]),
/// a Variable can be supplied for an [InputValueDefinition].
///
/// Variables must be defined at the top of an operation and are in scope throughout
/// the execution of that operation.
@immutable
class VariableDefinition extends ExecutableWithResolver {
  const VariableDefinition(this.astNode, [GetExecutableType getType])
      : super(getType);

  @override
  final VariableDefinitionNode astNode;

  String get name => astNode.variable.name.value;

  Variable get variable => Variable.fromNode(astNode.variable);

  GraphQLType get schemaType =>
      GraphQLType.fromNode(astNode.type, getType.fromSchema);

  DefaultValue get defaultValue => DefaultValue.fromNode(astNode.defaultValue);

  List<Directive> get directives =>
      astNode.directives.map(Directive.fromNode).toList();

  static VariableDefinition fromNode(VariableDefinitionNode astNode) =>
      VariableDefinition(astNode);
}
