import "package:meta/meta.dart";

import "../classes/type_policy.dart";

typedef DataIdResolver = String Function(Map<String, Object> object);

/// Returns a unique ID to use to reference this normalized object.
///
/// First checks if a [TypePolicy] exists for the given type. Next,
/// calls the [dataIdForType] function if one is specified. Finally,
/// falls back to the 'id' or '_id' field, respectively.
///
/// Returns [null] if this type should not be normalized.
String resolveDataId(
    {@required Map<String, Object> data,
    Map<String, TypePolicy> typePolicies,
    DataIdResolver dataIdFromObject}) {
  final typename = data["__typename"] as String;
  if (typename == null) return null;

  final typePolicy = (typePolicies ?? const {})[typename];
  if (typePolicy?.keyFields != null) {
    if (typePolicy.keyFields.isEmpty) return null;
    return <dynamic>[
      typename,
      ...typePolicy.keyFields.map(
        (field) => data[field],
      ),
    ].join(":");
  }

  if (dataIdFromObject != null) return dataIdFromObject(data);

  final id = (data["id"] ?? data["_id"]) as String;
  return id == null ? null : "$typename:$id";
}
