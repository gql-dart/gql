import "package:gql_exec/gql_exec.dart";

/// Sets [extra] on the Dio request of one operation.
///
/// Dio merges [extra] over `BaseOptions.extra` and exposes the result as
/// `RequestOptions.extra`, so interceptors can read per-operation flags.
///
/// ```dart
/// final request = Request(
///   operation: Operation(document: document),
///   context: Context().withEntry(
///     const DioLinkExtraContextEntry({"retry": false}),
///   ),
/// );
/// ```
///
/// When `DioLink.serializableErrors` is `true`, the `RequestOptions` of thrown
/// errors keep `extra`, so its values must also be serializable.
class DioLinkExtraContextEntry extends ContextEntry {
  final Map<String, dynamic> extra;

  const DioLinkExtraContextEntry(this.extra);

  @override
  List<Object?> get fieldsForEquality => [extra];
}
