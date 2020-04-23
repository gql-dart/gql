part of 'definitions.dart';

/// Callback to dereference a type name into it's material version
typedef ResolveFragment = FragmentDefinition Function(String name);

@immutable
class GetExecutableType {
  const GetExecutableType(
    this.fromSchema,
    this.fromFragments,
  );

  final ResolveType fromSchema;
  final ResolveFragment fromFragments;

  static const withoutContext = GetExecutableType(
    TypeResolver.withoutContext,
    _fragmentWithoutContext,
  );

  static FragmentDefinition _fragmentWithoutContext(String name) =>
      throw StateError(
          'Cannot resolve fragment $name in a context without a fragment resolver!');
}

abstract class ExecutableTypeResolver {
  GetExecutableType get getType;

  static const withoutContext = GetExecutableType.withoutContext;
}
