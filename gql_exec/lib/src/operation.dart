import "package:collection/collection.dart";
import "package:gql/ast.dart";
import "package:meta/meta.dart";

/// An operation in a [document], optionally defined by [operationName]
@immutable
class Operation {
  /// Document containing at least one [OperationDefinitionNode]
  final DocumentNode document;

  /// Name of the executable definition
  ///
  /// Must be specified if [document] contains more than one [OperationDefinitionNode]
  final String operationName;

  const Operation({
    @required this.document,
    this.operationName,
  }) : assert(document != null);

  List<Object> _getChildren() => [
        document,
        operationName,
      ];

  @override
  bool operator ==(Object o) =>
      identical(this, o) ||
      (o is Operation &&
          const ListEquality<Object>(
            DeepCollectionEquality(),
          ).equals(
            o._getChildren(),
            _getChildren(),
          ));

  @override
  int get hashCode => const ListEquality<Object>(
        DeepCollectionEquality(),
      ).hash(
        _getChildren(),
      );
}
