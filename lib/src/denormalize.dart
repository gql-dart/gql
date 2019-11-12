import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import './shared/field_name_with_arguments.dart';
import './shared/defaults.dart';
import './shared/expand_fragments.dart';

/// Denormalizes data for a given query
///
/// The [referenceKey] is used to reference the ID of a normalized object. It
/// should begin with '$' since a graphl response object key cannot begin with
/// that symbol.
Map<String, Object> denormalize(
    {@required DocumentNode query,
    @required Map<String, Map<String, Object>> normalizedMap,
    Map<String, Object> variables,
    String referenceKey}) {
  // Set defaults if none are defined
  referenceKey ??= defaultReferenceKey;
}
