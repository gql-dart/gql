// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test_repro/graphql/__generated__/serializers.gql.dart'
    as _i1;
import 'package:gql_code_builder/src/serializers/inline_fragment_serializer.dart'
    as _i2;

part 'query.data.gql.g.dart';

abstract class GReproQueryData
    implements Built<GReproQueryData, GReproQueryDataBuilder> {
  GReproQueryData._();

  factory GReproQueryData([void Function(GReproQueryDataBuilder b) updates]) =
      _$GReproQueryData;

  static void _initializeBuilder(GReproQueryDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GReproQueryData_repro? get repro;
  static Serializer<GReproQueryData> get serializer =>
      _$gReproQueryDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReproQueryData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReproQueryData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReproQueryData.serializer,
        json,
      );
}

abstract class GReproQueryData_repro
    implements Built<GReproQueryData_repro, GReproQueryData_reproBuilder> {
  GReproQueryData_repro._();

  factory GReproQueryData_repro(
          [void Function(GReproQueryData_reproBuilder b) updates]) =
      _$GReproQueryData_repro;

  static void _initializeBuilder(GReproQueryData_reproBuilder b) =>
      b..G__typename = 'Repro';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  GChildFragmentData? get child;
  static Serializer<GReproQueryData_repro> get serializer =>
      _$gReproQueryDataReproSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReproQueryData_repro.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReproQueryData_repro? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReproQueryData_repro.serializer,
        json,
      );
}

abstract class GChildFragment {
  String get G__typename;
}

extension GChildFragmentWhenExtension on GChildFragment {
  _T when<_T>({
    required _T Function(GChildFragment__asChildReproA) childReproA,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'ChildReproA':
        return childReproA((this as GChildFragment__asChildReproA));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GChildFragment__asChildReproA)? childReproA,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'ChildReproA':
        return childReproA != null
            ? childReproA((this as GChildFragment__asChildReproA))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GChildFragment__base implements GChildFragment {
  @override
  String get G__typename;
  @override
  Map<String, dynamic> toJson();
}

abstract class GChildFragment__asChildReproA implements GChildFragment {
  @override
  String get G__typename;
  String get id;
  String get name;
  BuiltList<GChildFragment__asChildReproA_childs?>? get childs;
  @override
  Map<String, dynamic> toJson();
}

abstract class GChildFragment__asChildReproA_childs {
  String get G__typename;
}

extension GChildFragment__asChildReproA_childsWhenExtension
    on GChildFragment__asChildReproA_childs {
  _T when<_T>({
    required _T Function(GChildFragment__asChildReproA_childs__asChildReproB)
        childReproB,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'ChildReproB':
        return childReproB(
            (this as GChildFragment__asChildReproA_childs__asChildReproB));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GChildFragment__asChildReproA_childs__asChildReproB)?
        childReproB,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'ChildReproB':
        return childReproB != null
            ? childReproB(
                (this as GChildFragment__asChildReproA_childs__asChildReproB))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GChildFragment__asChildReproA_childs__base
    implements GChildFragment__asChildReproA_childs {
  @override
  String get G__typename;
  @override
  Map<String, dynamic> toJson();
}

abstract class GChildFragment__asChildReproA_childs__asChildReproB
    implements GChildFragment__asChildReproA_childs {
  @override
  String get G__typename;
  String get id;
  int get count;
  @override
  Map<String, dynamic> toJson();
}

abstract class GChildFragmentData implements GChildFragment {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GChildFragmentData> get serializer =>
      _i2.InlineFragmentSerializer<GChildFragmentData>(
        'GChildFragmentData',
        GChildFragmentData__base,
        {'ChildReproA': GChildFragmentData__asChildReproA},
      );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GChildFragmentData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GChildFragmentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GChildFragmentData.serializer,
        json,
      );
}

extension GChildFragmentDataWhenExtension on GChildFragmentData {
  _T when<_T>({
    required _T Function(GChildFragmentData__asChildReproA) childReproA,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'ChildReproA':
        return childReproA((this as GChildFragmentData__asChildReproA));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GChildFragmentData__asChildReproA)? childReproA,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'ChildReproA':
        return childReproA != null
            ? childReproA((this as GChildFragmentData__asChildReproA))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GChildFragmentData__base
    implements
        Built<GChildFragmentData__base, GChildFragmentData__baseBuilder>,
        GChildFragmentData {
  GChildFragmentData__base._();

  factory GChildFragmentData__base(
          [void Function(GChildFragmentData__baseBuilder b) updates]) =
      _$GChildFragmentData__base;

  static void _initializeBuilder(GChildFragmentData__baseBuilder b) =>
      b..G__typename = 'ChildRepro';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GChildFragmentData__base> get serializer =>
      _$gChildFragmentDataBaseSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GChildFragmentData__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GChildFragmentData__base? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GChildFragmentData__base.serializer,
        json,
      );
}

abstract class GChildFragmentData__asChildReproA
    implements
        Built<GChildFragmentData__asChildReproA,
            GChildFragmentData__asChildReproABuilder>,
        GChildFragmentData {
  GChildFragmentData__asChildReproA._();

  factory GChildFragmentData__asChildReproA(
          [void Function(GChildFragmentData__asChildReproABuilder b) updates]) =
      _$GChildFragmentData__asChildReproA;

  static void _initializeBuilder(GChildFragmentData__asChildReproABuilder b) =>
      b..G__typename = 'ChildReproA';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  BuiltList<GChildFragmentData__asChildReproA_childs?>? get childs;
  static Serializer<GChildFragmentData__asChildReproA> get serializer =>
      _$gChildFragmentDataAsChildReproASerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GChildFragmentData__asChildReproA.serializer,
        this,
      ) as Map<String, dynamic>);

  static GChildFragmentData__asChildReproA? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GChildFragmentData__asChildReproA.serializer,
        json,
      );
}

abstract class GChildFragmentData__asChildReproA_childs {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GChildFragmentData__asChildReproA_childs> get serializer =>
      _i2.InlineFragmentSerializer<GChildFragmentData__asChildReproA_childs>(
        'GChildFragmentData__asChildReproA_childs',
        GChildFragmentData__asChildReproA_childs__base,
        {
          'ChildReproB': GChildFragmentData__asChildReproA_childs__asChildReproB
        },
      );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GChildFragmentData__asChildReproA_childs.serializer,
        this,
      ) as Map<String, dynamic>);

  static GChildFragmentData__asChildReproA_childs? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GChildFragmentData__asChildReproA_childs.serializer,
        json,
      );
}

extension GChildFragmentData__asChildReproA_childsWhenExtension
    on GChildFragmentData__asChildReproA_childs {
  _T when<_T>({
    required _T Function(
            GChildFragmentData__asChildReproA_childs__asChildReproB)
        childReproB,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'ChildReproB':
        return childReproB(
            (this as GChildFragmentData__asChildReproA_childs__asChildReproB));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GChildFragmentData__asChildReproA_childs__asChildReproB)?
        childReproB,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'ChildReproB':
        return childReproB != null
            ? childReproB((this
                as GChildFragmentData__asChildReproA_childs__asChildReproB))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GChildFragmentData__asChildReproA_childs__base
    implements
        Built<GChildFragmentData__asChildReproA_childs__base,
            GChildFragmentData__asChildReproA_childs__baseBuilder>,
        GChildFragmentData__asChildReproA_childs {
  GChildFragmentData__asChildReproA_childs__base._();

  factory GChildFragmentData__asChildReproA_childs__base(
      [void Function(GChildFragmentData__asChildReproA_childs__baseBuilder b)
          updates]) = _$GChildFragmentData__asChildReproA_childs__base;

  static void _initializeBuilder(
          GChildFragmentData__asChildReproA_childs__baseBuilder b) =>
      b..G__typename = 'ChildRepro';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GChildFragmentData__asChildReproA_childs__base>
      get serializer => _$gChildFragmentDataAsChildReproAChildsBaseSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GChildFragmentData__asChildReproA_childs__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GChildFragmentData__asChildReproA_childs__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GChildFragmentData__asChildReproA_childs__base.serializer,
        json,
      );
}

abstract class GChildFragmentData__asChildReproA_childs__asChildReproB
    implements
        Built<GChildFragmentData__asChildReproA_childs__asChildReproB,
            GChildFragmentData__asChildReproA_childs__asChildReproBBuilder>,
        GChildFragmentData__asChildReproA_childs {
  GChildFragmentData__asChildReproA_childs__asChildReproB._();

  factory GChildFragmentData__asChildReproA_childs__asChildReproB(
      [void Function(
              GChildFragmentData__asChildReproA_childs__asChildReproBBuilder b)
          updates]) = _$GChildFragmentData__asChildReproA_childs__asChildReproB;

  static void _initializeBuilder(
          GChildFragmentData__asChildReproA_childs__asChildReproBBuilder b) =>
      b..G__typename = 'ChildReproB';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  int get count;
  static Serializer<GChildFragmentData__asChildReproA_childs__asChildReproB>
      get serializer =>
          _$gChildFragmentDataAsChildReproAChildsAsChildReproBSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GChildFragmentData__asChildReproA_childs__asChildReproB.serializer,
        this,
      ) as Map<String, dynamic>);

  static GChildFragmentData__asChildReproA_childs__asChildReproB? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GChildFragmentData__asChildReproA_childs__asChildReproB.serializer,
        json,
      );
}
