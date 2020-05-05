/**
 * Originally from https://github.com/zino-app/graphql-flutter
 * Adapted to `gql` by @iscriptology
 */

import "dart:async";

dynamic Function() overridePrint(Function(List<String> log) testFn) => () {
      final log = <String>[];
      final spec = ZoneSpecification(print: (_, __, ___, String msg) {
        log.add(msg);
      });
      return Zone.current.fork(specification: spec).run<dynamic>(() => testFn(log));
    };
