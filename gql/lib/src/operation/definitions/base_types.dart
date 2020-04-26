import "package:meta/meta.dart";
import "package:gql/src/schema/definitions.dart";

import "package:gql/src/operation/definitions/type_resolver.dart";

@immutable
abstract class ExecutableGraphQLEntity extends GraphQLEntity {
  const ExecutableGraphQLEntity();
}

@immutable
abstract class ExecutableWithResolver extends ExecutableGraphQLEntity
    implements ExecutableTypeResolver {
  const ExecutableWithResolver([GetExecutableType getType])
      : getType = getType ?? GetExecutableType.withoutContext,
        super();

  @override
  final GetExecutableType getType;

  @override
  List<Object> get props => [astNode, getType];
}
