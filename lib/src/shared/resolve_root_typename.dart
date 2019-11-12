import 'package:gql/ast.dart';
import '../classes/type_policy.dart';

String resolveRootTypename(OperationDefinitionNode operationDefinition,
    Map<String, TypePolicy> typePolicies) {
  switch (operationDefinition.type) {
    case OperationType.query:
      return typePolicies?.entries
          ?.firstWhere((entry) => entry.value.queryType,
              orElse: () => MapEntry('Query', null))
          ?.key;
    case OperationType.mutation:
      return typePolicies?.entries
          ?.firstWhere((entry) => entry.value.mutationType,
              orElse: () => MapEntry('Mutation', null))
          ?.key;
    case OperationType.subscription:
      return typePolicies?.entries
          ?.firstWhere((entry) => entry.value.subscriptionType,
              orElse: () => MapEntry('Subscription', null))
          ?.key;
  }
}
