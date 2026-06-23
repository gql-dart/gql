import "package:gql/ast.dart";
import "package:gql/document.dart" show ValidationError;
import "package:gql/src/validation/validating_visitor.dart";

class PossibleTypeExtensionError extends ValidationError {
  PossibleTypeExtensionError.nodeNotDefined(
    TypeExtensionNode node,
  ) : super(
          message:
              'Cannot extend type "${node.name.value}" because it is not defined.',
          node: node,
        );

  PossibleTypeExtensionError.incorrectType(
    TypeExtensionNode node, {
    required String kind,
  }) : super(
          message: 'Cannot extend non-${kind} type "${node.name.value}".',
          node: node,
        );
}

/// Possible type extension
///
/// A type extension is only valid if the type is defined and has the same kind.
class PossibleTypeExtensions extends ValidatingVisitor {
  final _definedTypes = <String, TypeDefinitionNode>{};

  List<ValidationError>? _recordType(TypeDefinitionNode node) {
    _definedTypes[node.name.value] = node;
    return null;
  }

  List<ValidationError>? _validateType<T extends TypeDefinitionNode>(
    TypeExtensionNode node, {
    required String kind,
  }) {
    final typeDefinition = _definedTypes[node.name.value];
    if (typeDefinition == null) {
      return [PossibleTypeExtensionError.nodeNotDefined(node)];
    }
    if (typeDefinition is! T) {
      return [PossibleTypeExtensionError.incorrectType(node, kind: kind)];
    }
    return null;
  }

  // Enum
  @override
  List<ValidationError>? visitEnumTypeDefinitionNode(
          EnumTypeDefinitionNode node) =>
      _recordType(node);

  @override
  List<ValidationError>? visitEnumTypeExtensionNode(
          EnumTypeExtensionNode node) =>
      _validateType<EnumTypeDefinitionNode>(node, kind: "enum");

  // Input Object
  @override
  List<ValidationError>? visitInputObjectTypeDefinitionNode(
          InputObjectTypeDefinitionNode node) =>
      _recordType(node);

  @override
  List<ValidationError>? visitInputObjectTypeExtensionNode(
          InputObjectTypeExtensionNode node) =>
      _validateType<InputObjectTypeDefinitionNode>(node, kind: "input");

  // Union
  @override
  List<ValidationError>? visitUnionTypeDefinitionNode(
          UnionTypeDefinitionNode node) =>
      _recordType(node);

  @override
  List<ValidationError>? visitUnionTypeExtensionNode(
          UnionTypeExtensionNode node) =>
      _validateType<UnionTypeDefinitionNode>(node, kind: "union");

  // Interface
  @override
  List<ValidationError>? visitInterfaceTypeDefinitionNode(
          InterfaceTypeDefinitionNode node) =>
      _recordType(node);

  @override
  List<ValidationError>? visitInterfaceTypeExtensionNode(
          InterfaceTypeExtensionNode node) =>
      _validateType<InterfaceTypeDefinitionNode>(node, kind: "interface");

  // Object
  @override
  List<ValidationError>? visitObjectTypeDefinitionNode(
          ObjectTypeDefinitionNode node) =>
      _recordType(node);

  @override
  List<ValidationError>? visitObjectTypeExtensionNode(
          ObjectTypeExtensionNode node) =>
      _validateType<ObjectTypeDefinitionNode>(node, kind: "object");

  // Scalar
  @override
  List<ValidationError>? visitScalarTypeDefinitionNode(
          ScalarTypeDefinitionNode node) =>
      _recordType(node);

  @override
  List<ValidationError>? visitScalarTypeExtensionNode(
          ScalarTypeExtensionNode node) =>
      _validateType<ScalarTypeDefinitionNode>(node, kind: "scalar");
}
