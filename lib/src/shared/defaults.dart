import './typedefs.dart';

const defaultReferenceKey = '\$ref';

final DataIdResolver defaultDataIdResolver = (Map<String, Object> object) {
  assert(object['__typename'] != null);
  final id = object['id'] ?? object['_id'];
  return id == null ? null : '${object['__typename']}:$id';
};
