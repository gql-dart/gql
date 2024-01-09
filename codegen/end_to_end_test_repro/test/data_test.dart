


import 'package:end_to_end_test_repro/graphql/__generated__/query.data.gql.dart';

void main() {


  final data = GReproQueryData();

  final child = data.repro!.child!;

  child.when(childReproA: (item) => item.name, orElse: () {});

}