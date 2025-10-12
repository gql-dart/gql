import "package:collection/collection.dart";
import "package:gql/ast.dart";
import "package:gql/document.dart";
import "package:gql/src/validation/validating_visitor.dart";

class DuplicateArgumentDefinitionNameError extends ValidationError {
  const DuplicateArgumentDefinitionNameError(
      {required String parentName, required String argumentName, Node? node})
      : super(
          message:
              'Argument "${parentName}(${argumentName}:)" can only be defined once.',
          node: node,
        );
}

/// Unique argument definition names
///
/// A GraphQL Object or Interface type is only valid if all its fields have uniquely named arguments.
/// A GraphQL Directive is only valid if all its arguments are uniquely named.
class UniqueArgumentDefinitionNames extends ValidatingVisitor {
  @override
  List<ValidationError>? visitDirectiveDefinitionNode(
    DirectiveDefinitionNode node,
  ) =>
      _checkArgumentUniqueness(
        parentName: "@${node.name.value}",
        argumentNodes: node.args,
      );

  @override
  List<ValidationError>? visitInterfaceTypeDefinitionNode(
    InterfaceTypeDefinitionNode node,
  ) =>
      _checkArgumentUniquenessPerField(name: node.name, fields: node.fields);

  @override
  List<ValidationError>? visitInterfaceTypeExtensionNode(
    InterfaceTypeExtensionNode node,
  ) =>
      _checkArgumentUniquenessPerField(name: node.name, fields: node.fields);

  @override
  List<ValidationError>? visitObjectTypeDefinitionNode(
    ObjectTypeDefinitionNode node,
  ) =>
      _checkArgumentUniquenessPerField(name: node.name, fields: node.fields);

  @override
  List<ValidationError>? visitObjectTypeExtensionNode(
    ObjectTypeExtensionNode node,
  ) =>
      _checkArgumentUniquenessPerField(name: node.name, fields: node.fields);

  List<ValidationError> _checkArgumentUniquenessPerField({
    required NameNode name,
    required List<FieldDefinitionNode> fields,
  }) =>
      fields
          .expand(
            (e) => _checkArgumentUniqueness(
                parentName: "${name.value}.${e.name.value}",
                argumentNodes: e.args),
          )
          .toList();

  List<ValidationError> _checkArgumentUniqueness({
    required String parentName,
    required List<InputValueDefinitionNode> argumentNodes,
  }) =>
      argumentNodes
          .groupListsBy((it) => it.name.value)
          .entries
          .map(
            (e) => e.value.length > 1
                ? DuplicateArgumentDefinitionNameError(
                    parentName: parentName,
                    argumentName: e.key,
                  )
                : null,
          )
          .nonNulls
          .toList();
}
