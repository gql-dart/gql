class $NestedFragment {
  const $NestedFragment(this.data);

  final Map<String, dynamic> data;

  String get id => (data['id'] as String);
  String get name => (data['name'] as String);
}
