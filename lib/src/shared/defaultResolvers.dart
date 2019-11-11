import './typedefs.dart';

final DataIdResolver defaultDataIdResolver = (Map<String, Object> object) {
  assert(object['id'] != null);
  assert(object['__typename'] != null);
  return '${object['__typename']}:${object['id']}';
};

final TypeResolver defaultTypeResolver = (Map<String, Object> object) {
  assert(object['__typename'] != null);
  return object['__typename'];
};
