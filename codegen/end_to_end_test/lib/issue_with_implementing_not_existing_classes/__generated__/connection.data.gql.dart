// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i3;
import 'package:end_to_end_test/issue_with_implementing_not_existing_classes/__generated__/field11.data.gql.dart'
    as _i2;
import 'package:end_to_end_test/issue_with_implementing_not_existing_classes/__generated__/field2.data.gql.dart'
    as _i1;

part 'connection.data.gql.g.dart';

abstract class GConnection {
  String get G__typename;
  BuiltList<GConnection_field1> get field1;
  _i1.GField2 get field2;
  Map<String, dynamic> toJson();
}

abstract class GConnection_field1 {
  String get G__typename;
  _i2.GField11 get field11;
  Map<String, dynamic> toJson();
}

abstract class GConnectionData
    implements Built<GConnectionData, GConnectionDataBuilder>, GConnection {
  GConnectionData._();

  factory GConnectionData([void Function(GConnectionDataBuilder b) updates]) =
      _$GConnectionData;

  static void _initializeBuilder(GConnectionDataBuilder b) =>
      b..G__typename = 'Connection';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GConnectionData_field1> get field1;
  @override
  GConnectionData_field2 get field2;
  static Serializer<GConnectionData> get serializer =>
      _$gConnectionDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GConnectionData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GConnectionData? fromJson(Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GConnectionData.serializer,
        json,
      );
}

abstract class GConnectionData_field1
    implements
        Built<GConnectionData_field1, GConnectionData_field1Builder>,
        GConnection_field1 {
  GConnectionData_field1._();

  factory GConnectionData_field1(
          [void Function(GConnectionData_field1Builder b) updates]) =
      _$GConnectionData_field1;

  static void _initializeBuilder(GConnectionData_field1Builder b) =>
      b..G__typename = 'Field1Edge';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GConnectionData_field1_field11 get field11;
  static Serializer<GConnectionData_field1> get serializer =>
      _$gConnectionDataField1Serializer;

  @override
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GConnectionData_field1.serializer,
        this,
      ) as Map<String, dynamic>);

  static GConnectionData_field1? fromJson(Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GConnectionData_field1.serializer,
        json,
      );
}

abstract class GConnectionData_field1_field11
    implements
        Built<GConnectionData_field1_field11,
            GConnectionData_field1_field11Builder>,
        _i2.GField11 {
  GConnectionData_field1_field11._();

  factory GConnectionData_field1_field11(
          [void Function(GConnectionData_field1_field11Builder b) updates]) =
      _$GConnectionData_field1_field11;

  static void _initializeBuilder(GConnectionData_field1_field11Builder b) =>
      b..G__typename = 'Field11';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GConnectionData_field1_field11_field111 get field111;
  static Serializer<GConnectionData_field1_field11> get serializer =>
      _$gConnectionDataField1Field11Serializer;

  @override
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GConnectionData_field1_field11.serializer,
        this,
      ) as Map<String, dynamic>);

  static GConnectionData_field1_field11? fromJson(Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GConnectionData_field1_field11.serializer,
        json,
      );
}

abstract class GConnectionData_field1_field11_field111
    implements
        Built<GConnectionData_field1_field11_field111,
            GConnectionData_field1_field11_field111Builder>,
        GConnection_field1_field11_field111,
        _i2.GField11_field111 {
  GConnectionData_field1_field11_field111._();

  factory GConnectionData_field1_field11_field111(
      [void Function(GConnectionData_field1_field11_field111Builder b)
          updates]) = _$GConnectionData_field1_field11_field111;

  static void _initializeBuilder(
          GConnectionData_field1_field11_field111Builder b) =>
      b..G__typename = 'Field111';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GConnectionData_field1_field11_field111> get serializer =>
      _$gConnectionDataField1Field11Field111Serializer;

  @override
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GConnectionData_field1_field11_field111.serializer,
        this,
      ) as Map<String, dynamic>);

  static GConnectionData_field1_field11_field111? fromJson(
          Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GConnectionData_field1_field11_field111.serializer,
        json,
      );
}

abstract class GConnectionData_field2
    implements
        Built<GConnectionData_field2, GConnectionData_field2Builder>,
        _i1.GField2 {
  GConnectionData_field2._();

  factory GConnectionData_field2(
          [void Function(GConnectionData_field2Builder b) updates]) =
      _$GConnectionData_field2;

  static void _initializeBuilder(GConnectionData_field2Builder b) =>
      b..G__typename = 'Field2';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GConnectionData_field2> get serializer =>
      _$gConnectionDataField2Serializer;

  @override
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GConnectionData_field2.serializer,
        this,
      ) as Map<String, dynamic>);

  static GConnectionData_field2? fromJson(Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GConnectionData_field2.serializer,
        json,
      );
}
