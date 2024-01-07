// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;
import 'package:gql_code_builder/src/serializers/inline_fragment_serializer.dart'
    as _i2;

part 'fragment_activities.data.gql.g.dart';

abstract class GActivityA {
  String get G__typename;
  GActivityA_activityData? get activityData;
  Map<String, dynamic> toJson();
}

abstract class GActivityA_activityData {
  String get G__typename;
  Map<String, dynamic> toJson();
}

abstract class GActivityAData
    implements Built<GActivityAData, GActivityADataBuilder>, GActivityA {
  GActivityAData._();

  factory GActivityAData([void Function(GActivityADataBuilder b) updates]) =
      _$GActivityAData;

  static void _initializeBuilder(GActivityADataBuilder b) =>
      b..G__typename = 'ActivityA';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GActivityAData_activityData? get activityData;
  static Serializer<GActivityAData> get serializer =>
      _$gActivityADataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GActivityAData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GActivityAData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GActivityAData.serializer,
        json,
      );
}

abstract class GActivityAData_activityData
    implements
        Built<GActivityAData_activityData, GActivityAData_activityDataBuilder>,
        GActivityA_activityData {
  GActivityAData_activityData._();

  factory GActivityAData_activityData(
          [void Function(GActivityAData_activityDataBuilder b) updates]) =
      _$GActivityAData_activityData;

  static void _initializeBuilder(GActivityAData_activityDataBuilder b) =>
      b..G__typename = 'ActivityUnion';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GActivityAData_activityData> get serializer =>
      _$gActivityADataActivityDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GActivityAData_activityData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GActivityAData_activityData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GActivityAData_activityData.serializer,
        json,
      );
}

abstract class GActivityB {
  String get G__typename;
  GActivityB_activity? get activity;
  Map<String, dynamic> toJson();
}

abstract class GActivityB_activity {
  String get G__typename;
}

extension GActivityB_activityWhenExtension on GActivityB_activity {
  _T when<_T>({
    required _T Function(GActivityB_activity__asActivityA) activityA,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'ActivityA':
        return activityA((this as GActivityB_activity__asActivityA));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GActivityB_activity__asActivityA)? activityA,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'ActivityA':
        return activityA != null
            ? activityA((this as GActivityB_activity__asActivityA))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GActivityB_activity__base implements GActivityB_activity {
  @override
  String get G__typename;
  @override
  Map<String, dynamic> toJson();
}

abstract class GActivityB_activity__asActivityA
    implements GActivityB_activity, GActivityA {
  @override
  String get G__typename;
  @override
  GActivityB_activity__asActivityA_activityData? get activityData;
  @override
  Map<String, dynamic> toJson();
}

abstract class GActivityB_activity__asActivityA_activityData
    implements GActivityA_activityData {
  @override
  String get G__typename;
  @override
  Map<String, dynamic> toJson();
}

abstract class GActivityBData
    implements Built<GActivityBData, GActivityBDataBuilder>, GActivityB {
  GActivityBData._();

  factory GActivityBData([void Function(GActivityBDataBuilder b) updates]) =
      _$GActivityBData;

  static void _initializeBuilder(GActivityBDataBuilder b) =>
      b..G__typename = 'ActivityB';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GActivityBData_activity? get activity;
  static Serializer<GActivityBData> get serializer =>
      _$gActivityBDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GActivityBData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GActivityBData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GActivityBData.serializer,
        json,
      );
}

abstract class GActivityBData_activity implements GActivityB_activity {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GActivityBData_activity> get serializer =>
      _i2.InlineFragmentSerializer<GActivityBData_activity>(
        'GActivityBData_activity',
        GActivityBData_activity__base,
        {'ActivityA': GActivityBData_activity__asActivityA},
      );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GActivityBData_activity.serializer,
        this,
      ) as Map<String, dynamic>);

  static GActivityBData_activity? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GActivityBData_activity.serializer,
        json,
      );
}

extension GActivityBData_activityWhenExtension on GActivityBData_activity {
  _T when<_T>({
    required _T Function(GActivityBData_activity__asActivityA) activityA,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'ActivityA':
        return activityA((this as GActivityBData_activity__asActivityA));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GActivityBData_activity__asActivityA)? activityA,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'ActivityA':
        return activityA != null
            ? activityA((this as GActivityBData_activity__asActivityA))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GActivityBData_activity__base
    implements
        Built<GActivityBData_activity__base,
            GActivityBData_activity__baseBuilder>,
        GActivityBData_activity {
  GActivityBData_activity__base._();

  factory GActivityBData_activity__base(
          [void Function(GActivityBData_activity__baseBuilder b) updates]) =
      _$GActivityBData_activity__base;

  static void _initializeBuilder(GActivityBData_activity__baseBuilder b) =>
      b..G__typename = 'ActivityUnion';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GActivityBData_activity__base> get serializer =>
      _$gActivityBDataActivityBaseSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GActivityBData_activity__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GActivityBData_activity__base? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GActivityBData_activity__base.serializer,
        json,
      );
}

abstract class GActivityBData_activity__asActivityA
    implements
        Built<GActivityBData_activity__asActivityA,
            GActivityBData_activity__asActivityABuilder>,
        GActivityBData_activity,
        GActivityA {
  GActivityBData_activity__asActivityA._();

  factory GActivityBData_activity__asActivityA(
      [void Function(GActivityBData_activity__asActivityABuilder b)
          updates]) = _$GActivityBData_activity__asActivityA;

  static void _initializeBuilder(
          GActivityBData_activity__asActivityABuilder b) =>
      b..G__typename = 'ActivityA';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GActivityBData_activity__asActivityA_activityData? get activityData;
  static Serializer<GActivityBData_activity__asActivityA> get serializer =>
      _$gActivityBDataActivityAsActivityASerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GActivityBData_activity__asActivityA.serializer,
        this,
      ) as Map<String, dynamic>);

  static GActivityBData_activity__asActivityA? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GActivityBData_activity__asActivityA.serializer,
        json,
      );
}

abstract class GActivityBData_activity__asActivityA_activityData
    implements
        Built<GActivityBData_activity__asActivityA_activityData,
            GActivityBData_activity__asActivityA_activityDataBuilder>,
        GActivityA_activityData {
  GActivityBData_activity__asActivityA_activityData._();

  factory GActivityBData_activity__asActivityA_activityData(
      [void Function(GActivityBData_activity__asActivityA_activityDataBuilder b)
          updates]) = _$GActivityBData_activity__asActivityA_activityData;

  static void _initializeBuilder(
          GActivityBData_activity__asActivityA_activityDataBuilder b) =>
      b..G__typename = 'ActivityUnion';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GActivityBData_activity__asActivityA_activityData>
      get serializer =>
          _$gActivityBDataActivityAsActivityAActivityDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GActivityBData_activity__asActivityA_activityData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GActivityBData_activity__asActivityA_activityData? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GActivityBData_activity__asActivityA_activityData.serializer,
        json,
      );
}

abstract class GItem {
  String get G__typename;
  Map<String, dynamic> toJson();
}

abstract class GItemData implements Built<GItemData, GItemDataBuilder>, GItem {
  GItemData._();

  factory GItemData([void Function(GItemDataBuilder b) updates]) = _$GItemData;

  static void _initializeBuilder(GItemDataBuilder b) => b..G__typename = 'Item';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GItemData> get serializer => _$gItemDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GItemData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GItemData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GItemData.serializer,
        json,
      );
}

abstract class GItemConnection {
  String get G__typename;
  int get count;
  BuiltList<GItemConnection_edges> get edges;
  Map<String, dynamic> toJson();
}

abstract class GItemConnection_edges implements GItemEdge {
  @override
  String get G__typename;
  @override
  Map<String, dynamic> toJson();
}

abstract class GItemConnectionData
    implements
        Built<GItemConnectionData, GItemConnectionDataBuilder>,
        GItemConnection {
  GItemConnectionData._();

  factory GItemConnectionData(
          [void Function(GItemConnectionDataBuilder b) updates]) =
      _$GItemConnectionData;

  static void _initializeBuilder(GItemConnectionDataBuilder b) =>
      b..G__typename = 'ItemConnection';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get count;
  @override
  BuiltList<GItemConnectionData_edges> get edges;
  static Serializer<GItemConnectionData> get serializer =>
      _$gItemConnectionDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GItemConnectionData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GItemConnectionData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GItemConnectionData.serializer,
        json,
      );
}

abstract class GItemConnectionData_edges
    implements
        Built<GItemConnectionData_edges, GItemConnectionData_edgesBuilder>,
        GItemConnection_edges,
        GItemEdge {
  GItemConnectionData_edges._();

  factory GItemConnectionData_edges(
          [void Function(GItemConnectionData_edgesBuilder b) updates]) =
      _$GItemConnectionData_edges;

  static void _initializeBuilder(GItemConnectionData_edgesBuilder b) =>
      b..G__typename = 'ItemEdge';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GItemConnectionData_edges> get serializer =>
      _$gItemConnectionDataEdgesSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GItemConnectionData_edges.serializer,
        this,
      ) as Map<String, dynamic>);

  static GItemConnectionData_edges? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GItemConnectionData_edges.serializer,
        json,
      );
}

abstract class GItemEdge {
  String get G__typename;
  Map<String, dynamic> toJson();
}

abstract class GItemEdgeData
    implements Built<GItemEdgeData, GItemEdgeDataBuilder>, GItemEdge {
  GItemEdgeData._();

  factory GItemEdgeData([void Function(GItemEdgeDataBuilder b) updates]) =
      _$GItemEdgeData;

  static void _initializeBuilder(GItemEdgeDataBuilder b) =>
      b..G__typename = 'ItemEdge';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GItemEdgeData> get serializer => _$gItemEdgeDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GItemEdgeData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GItemEdgeData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GItemEdgeData.serializer,
        json,
      );
}
