import './typedefs.dart';

final DataIdResolver defaultDataIdResolver = (Map<String, Object> object) {
  assert(object['__typename'] != null);
  final id = object['id'] ?? object['_id'];
  return id == null ? null : '${object['__typename']}:$id';
};

final TypeResolver defaultTypeResolver = (Map<String, Object> object) {
  assert(object['__typename'] != null);
  return object['__typename'];
};
