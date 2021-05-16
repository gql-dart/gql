import "package:meta/meta.dart";
import "package:collection/collection.dart";
import "package:gql/src/schema/definitions.dart";

import "package:gql/src/operation/definitions/type_resolver.dart";

@immutable
abstract class ExecutableGraphQLEntity extends GraphQLEntity {
  const ExecutableGraphQLEntity();
}

@immutable
abstract class ExecutableWithResolver extends ExecutableGraphQLEntity
    implements ExecutableTypeResolver {
  const ExecutableWithResolver([GetExecutableType? getType])
      : getType = getType ?? GetExecutableType.withoutContext,
        super();

  @override
  final GetExecutableType getType;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    if (o.runtimeType == runtimeType) {
      final _o = o as ExecutableWithResolver;
      return astNode == _o.astNode && getType == _o.getType;
    }

    return false;
  }

  @override
  int get hashCode => const ListEquality<Object?>(
        DeepCollectionEquality(),
      ).hash([astNode, getType]);
}
