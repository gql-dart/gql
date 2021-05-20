import "package:meta/meta.dart";
import "package:gql/ast.dart";
import "package:gql/src/schema/definitions.dart";
import "package:gql/src/schema/definitions/value_types.dart" show Variable;

import "package:gql/src/operation/definitions/type_resolver.dart";
import "package:gql/src/operation/definitions/base_types.dart";
import "package:gql/src/operation/definitions/selections.dart";

@immutable
abstract class ExecutableDefinition extends ExecutableWithResolver {
  const ExecutableDefinition([GetExecutableType? getType]) : super(getType);

  @override
  ExecutableDefinitionNode get astNode;

  String? get name;

  static ExecutableDefinition fromNode(ExecutableDefinitionNode astNode,
      [GetExecutableType? getType]) {
    if (astNode is OperationDefinitionNode) {
      return OperationDefinition(astNode, getType);
    }
    if (astNode is FragmentDefinitionNode) {
      return FragmentDefinition(astNode, getType);
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
    GetExecutableType? getType,
  ]) : super(getType);

  @override
  final OperationDefinitionNode astNode;

  @override
  String? get name => astNode.name?.value;

  OperationType get type => astNode.type;

  ObjectTypeDefinition? get schemaType =>
      getType.fromSchema!(type.name) as ObjectTypeDefinition?;

  List<VariableDefinition> get variables =>
      astNode.variableDefinitions.map((v) => VariableDefinition(v)).toList();

  SelectionSet get selectionSet => SelectionSet(
        astNode.selectionSet,
        getType.fromSchema!(type.name) as ObjectTypeDefinition?,
        getType,
      );
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
  const FragmentDefinition(this.astNode, [GetExecutableType? getType])
      : super(getType);

  @override
  final FragmentDefinitionNode astNode;

  @override
  String? get name => astNode.name.value;

  TypeCondition get _typeCondition => TypeCondition(astNode.typeCondition);

  TypeDefinition? get onType => getType.fromSchema!(_typeCondition.on.name);

  List<Directive> get directives =>
      astNode.directives.map((d) => Directive(d)).toList();

  SelectionSet get selectionSet =>
      SelectionSet(astNode.selectionSet, onType, getType);
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
  final TypeConditionNode? astNode;

  NamedType get on => NamedType(astNode!.on);
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
  const VariableDefinition(this.astNode, [GetExecutableType? getType])
      : super(getType);

  @override
  final VariableDefinitionNode astNode;

  String get name => astNode.variable.name.value;

  Variable get variable => Variable(astNode.variable);

  GraphQLType get schemaType => GraphQLType.fromNode(
        astNode.type,
        getType.fromSchema,
      );

  DefaultValue get defaultValue => DefaultValue(astNode.defaultValue);

  List<Directive> get directives =>
      astNode.directives.map((d) => Directive(d)).toList();
}
