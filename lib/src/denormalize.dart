import 'package:gql/ast.dart';
import 'package:meta/meta.dart';

import './shared/typedefs.dart';

Map<String, Object> denormalize({
  @required DocumentNode query,
  @required Map<String, Object> normalizedMap,
  Map<String, Object> variables,
  TypeResolver resolveType,
}) {}
