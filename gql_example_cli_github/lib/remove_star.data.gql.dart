// GENERATED CODE - DO NOT MODIFY BY HAND

class $RemoveStar {
  const $RemoveStar(this.data);

  final Map<String, dynamic> data;

  $RemoveStar$action get action => data['action'] == null
      ? null
      : $RemoveStar$action((data['action'] as Map<String, dynamic>));
}

class $RemoveStar$action {
  const $RemoveStar$action(this.data);

  final Map<String, dynamic> data;

  $RemoveStar$action$starrable get starrable => data['starrable'] == null
      ? null
      : $RemoveStar$action$starrable(
          (data['starrable'] as Map<String, dynamic>));
}

class $RemoveStar$action$starrable {
  const $RemoveStar$action$starrable(this.data);

  final Map<String, dynamic> data;

  bool get viewerHasStarred => (data['viewerHasStarred'] as bool);
}
