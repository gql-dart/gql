import 'package:meta/meta.dart';
import 'package:gql/ast.dart';
import 'package:major_graphql_generator/src/schema/definitions/definitions.dart';

part 'selections.dart';
part 'type_resolver.dart';

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

    throw ArgumentError('$astNode is unsupported');
  }
}

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

@immutable
class TypeCondition extends ExecutableGraphQLEntity {
  const TypeCondition(this.astNode);

  @override
  final TypeConditionNode astNode;

  NamedType get on => NamedType.fromNode(astNode.on);

  static TypeCondition fromNode(TypeConditionNode astNode) =>
      TypeCondition(astNode);
}

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
