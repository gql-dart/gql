// NOTES:
// * this module is not really written for actual server usage atm,
//   so these graphql definitions (like user-sourced definitions)
//   don't have any kind of runtime functionality
//   (such as serialization, parsing, or resolution)
//
// * These defaults were transposed from those in
//   https://github.com/graphql/graphql-js/tree/4150d1f51360a7981181cfec42a135394c7340f1/src/type
//
// * The implementation of GraphQLSchema as a "view" of an AST makes
//   adding default definitions feel awkward and un-integrated

/// This module defines some (but not all) of the schema definitions
/// that are provided by default for all schemas:
/// * the `__typename` field ([typeNameField])
/// * the `@include` and `@skip` directives ([graphQLIncludeDirective], [graphQLSkipDirective])
/// * the `@deprecated` directive ([graphQLDeprecatedDirective])
import "package:meta/meta.dart";
import "package:gql/ast.dart";

import "./definitions.dart";

const _requiredString = NamedType(
  NamedTypeNode(
    name: NameNode(value: "String"),
    isNonNull: true,
  ),
);

const _requiredBool = NamedType(
  NamedTypeNode(
    name: NameNode(value: "Boolean"),
    isNonNull: true,
  ),
);

@immutable
class _BuiltInFieldDefinition extends FieldDefinition {
  const _BuiltInFieldDefinition({
    this.name,
    this.description,
    this.type,
    this.directives,
    this.args,
  }) : super(null);

  @override
  final String? name;

  @override
  final String? description;

  @override
  final GraphQLType? type;

  @override
  final List<Directive>? directives;

  @override
  final List<InputValueDefinition>? args;
}

const typeNameField = _BuiltInFieldDefinition(
  name: "__typename",
  type: _requiredString,
);

@immutable
class _BuiltInStringValue extends StringValue {
  const _BuiltInStringValue(this.value) : super(null);
  @override
  final String value;
}

@immutable
class _BuiltInArgument extends InputValueDefinition {
  const _BuiltInArgument({
    this.description,
    this.name,
    this.type,
    this.defaultValue,
    this.directives,
  }) : super(null);

  @override
  final String? description;
  @override
  final String? name;
  @override
  final GraphQLType? type;
  @override
  final Value? defaultValue;
  @override
  final List<Directive>? directives;
}

@immutable
class _BuiltInDirective extends DirectiveDefinition {
  const _BuiltInDirective({
    this.name,
    this.description,
    this.locations,
    this.args,
    this.repeatable = false,
  }) : super(null);

  @override
  final String? name;
  @override
  final String? description;
  @override
  final List<InputValueDefinition>? args;
  @override
  final List<DirectiveLocation>? locations;

  @override
  final bool repeatable;
}

/// Used to conditionally include fields or fragments.
final graphQLIncludeDirective = _BuiltInDirective(
  name: "include",
  description:
      "Directs the executor to include this field or fragment only when the `if` argument is true.",
  locations: DirectiveLocation.values,
  args: const [
    _BuiltInArgument(
      name: "if",
      description: "Included when true.",
      type: _requiredBool,
    )
  ],
);

/// Used to conditionally skip (exclude) fields or fragments.
final graphQLSkipDirective = _BuiltInDirective(
  name: "skip",
  description:
      "Directs the executor to skip this field or fragment when the `if` argument is true.",
  locations: DirectiveLocation.values,
  args: const [
    _BuiltInArgument(
      name: "if",
      description: "Skipped when true.",
      type: _requiredBool,
    )
  ],
);

/// Constant string used for default reason for a deprecation.
const defaultDeprecationReason = "No longer supported";

/// Used to declare element of a GraphQL schema as deprecated.
final graphQLDeprecatedDirective = _BuiltInDirective(
  name: "deprecated",
  description: "Marks an element of a GraphQL schema as no longer supported.",
  locations: const [
    DirectiveLocation.fieldDefinition,
    DirectiveLocation.enumValue
  ],
  args: const [
    _BuiltInArgument(
      name: "reason",
      defaultValue: _BuiltInStringValue(defaultDeprecationReason),
      description: "Explains why this element was deprecated, "
          "usually also including a suggestion for how to access supported similar data. "
          "Formatted using the Markdown syntax (as specified by [CommonMark](https://commonmark.org/).",
      type: _requiredBool,
    )
  ],
);

/// Enumerates the built in default directives missing from [directives].
Iterable<_BuiltInDirective> missingBuiltinDirectives(
  Iterable<DirectiveDefinition> directives,
) sync* {
  bool includes(String name) =>
      directives.where((directive) => directive.name == name).isNotEmpty;

  if (!includes("skip")) {
    yield graphQLSkipDirective;
  }

  if (!includes("include")) {
    yield graphQLIncludeDirective;
  }

  if (!includes("deprecated")) {
    yield graphQLDeprecatedDirective;
  }
}
