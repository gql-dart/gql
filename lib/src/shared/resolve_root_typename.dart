import 'package:gql/ast.dart';
import '../classes/type_policy.dart';

String resolveRootTypename(OperationDefinitionNode operationDefinition,
    Map<String, TypePolicy> typePolicies) {
  switch (operationDefinition.type) {
    case OperationType.query:
      return typePolicies?.entries
              ?.firstWhere((entry) => entry.value.queryType)
              ?.key ??
          'Query';
    case OperationType.mutation:
      return typePolicies?.entries
              ?.firstWhere((entry) => entry.value.mutationType)
              ?.key ??
          'Mutation';
    case OperationType.subscription:
      return typePolicies?.entries
              ?.firstWhere((entry) => entry.value.subscriptionType)
              ?.key ??
          'Subscription';
  }
}
