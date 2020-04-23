// TODO this module is not really written for actual server usage atm, so these are broken
import 'package:meta/meta.dart';
import 'package:gql/ast.dart';

import './definitions/definitions.dart';

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
  final String name;

  @override
  final String description;

  @override
  final GraphQLType type;

  @override
  final List<Directive> directives;

  @override
  final List<InputValueDefinition> args;
}

const typeNameField = _BuiltInFieldDefinition(
  name: '__typename',
  type: NamedType(
    NamedTypeNode(
      name: NameNode(value: 'String'),
      isNonNull: true,
    ),
  ),
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
  final String description;
  @override
  final String name;
  @override
  final GraphQLType type;
  @override
  final Value defaultValue;
  @override
  final List<Directive> directives;
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
  final String name;
  @override
  final String description;
  @override
  final List<InputValueDefinition> args;
  @override
  final List<DirectiveLocation> locations;

  @override
  final bool repeatable;
}

/// Used to conditionally include fields or fragments.
final graphQLIncludeDirective = _BuiltInDirective(
  name: 'include',
  description:
      'Directs the executor to include this field or fragment only when the `if` argument is true.',
  locations: DirectiveLocation.values,
  args: [
    _BuiltInArgument(
      name: 'if',
      description: 'Included when true.',
      // type: GraphQLNonNull(BooleanValue),
    )
  ],
);

/// Used to conditionally skip (exclude) fields or fragments.
final graphQLSkipDirective = _BuiltInDirective(
  name: 'skip',
  description:
      'Directs the executor to skip this field or fragment when the `if` argument is true.',
  locations: DirectiveLocation.values,
  args: [
    _BuiltInArgument(
      name: 'if',
      description: 'Skipped when true.',
      // type: GraphQLNonNull(BooleanValue),
    )
  ],
);

/// Constant string used for default reason for a deprecation.
final defaultDeprecationReason = 'No longer supported';

/// Used to declare element of a GraphQL schema as deprecated.
final graphQLDeprecatedDirective = _BuiltInDirective(
  name: 'deprecated',
  description: 'Marks an element of a GraphQL schema as no longer supported.',
  locations: [DirectiveLocation.fieldDefinition, DirectiveLocation.enumValue],
  args: [
    _BuiltInArgument(
      name: 'reason',
      defaultValue: _BuiltInStringValue(defaultDeprecationReason),
      description:
          ('Explains why this element was deprecated, usually also including a suggestion for how to access supported similar data. '
              'Formatted using the Markdown syntax (as specified by [CommonMark](https://commonmark.org/).'),
      // type: GraphQLNonNull(BooleanValue),
    )
  ],
);

/// enumerates the built in default directives missing from [directives]
Iterable<_BuiltInDirective> missingBuiltinDirectives(
  Iterable<DirectiveDefinition> directives,
) sync* {
  bool includes(String name) =>
      directives.where((directive) => directive.name == name).isNotEmpty;

  if (!includes('skip')) {
    yield graphQLSkipDirective;
  }

  if (!includes('include')) {
    yield graphQLIncludeDirective;
  }

  if (!includes('deprecated')) {
    yield graphQLDeprecatedDirective;
  }
}
