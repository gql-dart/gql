// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:gql_example_cli_github/schema.schema.gql.dart' as _i1;

class $ReadRepositories {
  const $ReadRepositories(this.data);

  final Map<String, dynamic> data;

  $ReadRepositories$viewer get viewer => data['viewer'] == null
      ? null
      : $ReadRepositories$viewer((data['viewer'] as Map<String, dynamic>));
}

class $ReadRepositories$viewer {
  const $ReadRepositories$viewer(this.data);

  final Map<String, dynamic> data;

  $ReadRepositories$viewer$repositories get repositories =>
      data['repositories'] == null
          ? null
          : $ReadRepositories$viewer$repositories(
              (data['repositories'] as Map<String, dynamic>));
}

class $ReadRepositories$viewer$repositories {
  const $ReadRepositories$viewer$repositories(this.data);

  final Map<String, dynamic> data;

  List<$ReadRepositories$viewer$repositories$nodes> get nodes =>
      data['nodes'] == null
          ? null
          : (data['nodes'] as List)
              .map((dynamic e) => $ReadRepositories$viewer$repositories$nodes(
                  (e as Map<String, dynamic>)))
              .toList();
}

class $ReadRepositories$viewer$repositories$nodes {
  const $ReadRepositories$viewer$repositories$nodes(this.data);

  final Map<String, dynamic> data;

  String get id => (data['id'] as String);
  String get name => (data['name'] as String);
  bool get viewerHasStarred => (data['viewerHasStarred'] as bool);
  _i1.DateTime get createdAt => _i1.DateTime((data['createdAt'] as String));
}
