// GENERATED CODE - DO NOT MODIFY BY HAND

class $AddStar {
  const $AddStar(this.data);

  final Map<String, dynamic> data;

  $AddStar$action get action => data['action'] == null
      ? null
      : $AddStar$action((data['action'] as Map<String, dynamic>));
}

class $AddStar$action {
  const $AddStar$action(this.data);

  final Map<String, dynamic> data;

  $AddStar$action$starrable get starrable => data['starrable'] == null
      ? null
      : $AddStar$action$starrable((data['starrable'] as Map<String, dynamic>));
}

class $AddStar$action$starrable {
  const $AddStar$action$starrable(this.data);

  final Map<String, dynamic> data;

  bool get viewerHasStarred => (data['viewerHasStarred'] as bool);
}
