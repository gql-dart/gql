// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_fragments_on_interface.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetBooksData> _$gGetBooksDataSerializer =
    _$GGetBooksDataSerializer();
Serializer<GGetBooksData_books__base> _$gGetBooksDataBooksBaseSerializer =
    _$GGetBooksData_books__baseSerializer();
Serializer<GGetBooksData_books__base_author__base>
    _$gGetBooksDataBooksBaseAuthorBaseSerializer =
    _$GGetBooksData_books__base_author__baseSerializer();
Serializer<GGetBooksData_books__base_author__asPerson>
    _$gGetBooksDataBooksBaseAuthorAsPersonSerializer =
    _$GGetBooksData_books__base_author__asPersonSerializer();
Serializer<GGetBooksData_books__base_author__asCompany>
    _$gGetBooksDataBooksBaseAuthorAsCompanySerializer =
    _$GGetBooksData_books__base_author__asCompanySerializer();
Serializer<GGetBooksData_books__asTextbook>
    _$gGetBooksDataBooksAsTextbookSerializer =
    _$GGetBooksData_books__asTextbookSerializer();
Serializer<GGetBooksData_books__asTextbook_author__base>
    _$gGetBooksDataBooksAsTextbookAuthorBaseSerializer =
    _$GGetBooksData_books__asTextbook_author__baseSerializer();
Serializer<GGetBooksData_books__asTextbook_author__asPerson>
    _$gGetBooksDataBooksAsTextbookAuthorAsPersonSerializer =
    _$GGetBooksData_books__asTextbook_author__asPersonSerializer();
Serializer<GGetBooksData_books__asTextbook_author__asCompany>
    _$gGetBooksDataBooksAsTextbookAuthorAsCompanySerializer =
    _$GGetBooksData_books__asTextbook_author__asCompanySerializer();
Serializer<GGetBooksData_books__asColoringBook>
    _$gGetBooksDataBooksAsColoringBookSerializer =
    _$GGetBooksData_books__asColoringBookSerializer();
Serializer<GGetBooksData_books__asColoringBook_author__base>
    _$gGetBooksDataBooksAsColoringBookAuthorBaseSerializer =
    _$GGetBooksData_books__asColoringBook_author__baseSerializer();
Serializer<GGetBooksData_books__asColoringBook_author__asPerson>
    _$gGetBooksDataBooksAsColoringBookAuthorAsPersonSerializer =
    _$GGetBooksData_books__asColoringBook_author__asPersonSerializer();
Serializer<GGetBooksData_books__asColoringBook_author__asCompany>
    _$gGetBooksDataBooksAsColoringBookAuthorAsCompanySerializer =
    _$GGetBooksData_books__asColoringBook_author__asCompanySerializer();
Serializer<GAuthorFragmentData__base> _$gAuthorFragmentDataBaseSerializer =
    _$GAuthorFragmentData__baseSerializer();
Serializer<GAuthorFragmentData__asPerson>
    _$gAuthorFragmentDataAsPersonSerializer =
    _$GAuthorFragmentData__asPersonSerializer();
Serializer<GAuthorFragmentData__asCompany>
    _$gAuthorFragmentDataAsCompanySerializer =
    _$GAuthorFragmentData__asCompanySerializer();
Serializer<GBookFragmentData__base> _$gBookFragmentDataBaseSerializer =
    _$GBookFragmentData__baseSerializer();
Serializer<GBookFragmentData__base_author__base>
    _$gBookFragmentDataBaseAuthorBaseSerializer =
    _$GBookFragmentData__base_author__baseSerializer();
Serializer<GBookFragmentData__base_author__asPerson>
    _$gBookFragmentDataBaseAuthorAsPersonSerializer =
    _$GBookFragmentData__base_author__asPersonSerializer();
Serializer<GBookFragmentData__base_author__asCompany>
    _$gBookFragmentDataBaseAuthorAsCompanySerializer =
    _$GBookFragmentData__base_author__asCompanySerializer();
Serializer<GBookFragmentData__asTextbook>
    _$gBookFragmentDataAsTextbookSerializer =
    _$GBookFragmentData__asTextbookSerializer();
Serializer<GBookFragmentData__asTextbook_author__base>
    _$gBookFragmentDataAsTextbookAuthorBaseSerializer =
    _$GBookFragmentData__asTextbook_author__baseSerializer();
Serializer<GBookFragmentData__asTextbook_author__asPerson>
    _$gBookFragmentDataAsTextbookAuthorAsPersonSerializer =
    _$GBookFragmentData__asTextbook_author__asPersonSerializer();
Serializer<GBookFragmentData__asTextbook_author__asCompany>
    _$gBookFragmentDataAsTextbookAuthorAsCompanySerializer =
    _$GBookFragmentData__asTextbook_author__asCompanySerializer();
Serializer<GBookFragmentData__asColoringBook>
    _$gBookFragmentDataAsColoringBookSerializer =
    _$GBookFragmentData__asColoringBookSerializer();
Serializer<GBookFragmentData__asColoringBook_author__base>
    _$gBookFragmentDataAsColoringBookAuthorBaseSerializer =
    _$GBookFragmentData__asColoringBook_author__baseSerializer();
Serializer<GBookFragmentData__asColoringBook_author__asPerson>
    _$gBookFragmentDataAsColoringBookAuthorAsPersonSerializer =
    _$GBookFragmentData__asColoringBook_author__asPersonSerializer();
Serializer<GBookFragmentData__asColoringBook_author__asCompany>
    _$gBookFragmentDataAsColoringBookAuthorAsCompanySerializer =
    _$GBookFragmentData__asColoringBook_author__asCompanySerializer();

class _$GGetBooksDataSerializer implements StructuredSerializer<GGetBooksData> {
  @override
  final Iterable<Type> types = const [GGetBooksData, _$GGetBooksData];
  @override
  final String wireName = 'GGetBooksData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetBooksData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'books',
      serializers.serialize(object.books,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GGetBooksData_books)])),
    ];

    return result;
  }

  @override
  GGetBooksData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GGetBooksDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'books':
          result.books.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GGetBooksData_books)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetBooksData_books__baseSerializer
    implements StructuredSerializer<GGetBooksData_books__base> {
  @override
  final Iterable<Type> types = const [
    GGetBooksData_books__base,
    _$GGetBooksData_books__base
  ];
  @override
  final String wireName = 'GGetBooksData_books__base';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetBooksData_books__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(GGetBooksData_books__base_author)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetBooksData_books__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GGetBooksData_books__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
                  specifiedType:
                      const FullType(GGetBooksData_books__base_author))!
              as GGetBooksData_books__base_author;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetBooksData_books__base_author__baseSerializer
    implements StructuredSerializer<GGetBooksData_books__base_author__base> {
  @override
  final Iterable<Type> types = const [
    GGetBooksData_books__base_author__base,
    _$GGetBooksData_books__base_author__base
  ];
  @override
  final String wireName = 'GGetBooksData_books__base_author__base';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetBooksData_books__base_author__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetBooksData_books__base_author__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GGetBooksData_books__base_author__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetBooksData_books__base_author__asPersonSerializer
    implements
        StructuredSerializer<GGetBooksData_books__base_author__asPerson> {
  @override
  final Iterable<Type> types = const [
    GGetBooksData_books__base_author__asPerson,
    _$GGetBooksData_books__base_author__asPerson
  ];
  @override
  final String wireName = 'GGetBooksData_books__base_author__asPerson';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetBooksData_books__base_author__asPerson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'firstName',
      serializers.serialize(object.firstName,
          specifiedType: const FullType(String)),
      'lastName',
      serializers.serialize(object.lastName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetBooksData_books__base_author__asPerson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GGetBooksData_books__base_author__asPersonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetBooksData_books__base_author__asCompanySerializer
    implements
        StructuredSerializer<GGetBooksData_books__base_author__asCompany> {
  @override
  final Iterable<Type> types = const [
    GGetBooksData_books__base_author__asCompany,
    _$GGetBooksData_books__base_author__asCompany
  ];
  @override
  final String wireName = 'GGetBooksData_books__base_author__asCompany';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetBooksData_books__base_author__asCompany object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetBooksData_books__base_author__asCompany deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GGetBooksData_books__base_author__asCompanyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetBooksData_books__asTextbookSerializer
    implements StructuredSerializer<GGetBooksData_books__asTextbook> {
  @override
  final Iterable<Type> types = const [
    GGetBooksData_books__asTextbook,
    _$GGetBooksData_books__asTextbook
  ];
  @override
  final String wireName = 'GGetBooksData_books__asTextbook';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetBooksData_books__asTextbook object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'author',
      serializers.serialize(object.author,
          specifiedType:
              const FullType(GGetBooksData_books__asTextbook_author)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'courses',
      serializers.serialize(object.courses,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  GGetBooksData_books__asTextbook deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GGetBooksData_books__asTextbookBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
                  specifiedType:
                      const FullType(GGetBooksData_books__asTextbook_author))!
              as GGetBooksData_books__asTextbook_author;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'courses':
          result.courses.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetBooksData_books__asTextbook_author__baseSerializer
    implements
        StructuredSerializer<GGetBooksData_books__asTextbook_author__base> {
  @override
  final Iterable<Type> types = const [
    GGetBooksData_books__asTextbook_author__base,
    _$GGetBooksData_books__asTextbook_author__base
  ];
  @override
  final String wireName = 'GGetBooksData_books__asTextbook_author__base';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetBooksData_books__asTextbook_author__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetBooksData_books__asTextbook_author__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GGetBooksData_books__asTextbook_author__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetBooksData_books__asTextbook_author__asPersonSerializer
    implements
        StructuredSerializer<GGetBooksData_books__asTextbook_author__asPerson> {
  @override
  final Iterable<Type> types = const [
    GGetBooksData_books__asTextbook_author__asPerson,
    _$GGetBooksData_books__asTextbook_author__asPerson
  ];
  @override
  final String wireName = 'GGetBooksData_books__asTextbook_author__asPerson';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetBooksData_books__asTextbook_author__asPerson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'firstName',
      serializers.serialize(object.firstName,
          specifiedType: const FullType(String)),
      'lastName',
      serializers.serialize(object.lastName,
          specifiedType: const FullType(String)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(GBookFragment_author)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetBooksData_books__asTextbook_author__asPerson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GGetBooksData_books__asTextbook_author__asPersonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
                  specifiedType: const FullType(GBookFragment_author))!
              as GBookFragment_author;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetBooksData_books__asTextbook_author__asCompanySerializer
    implements
        StructuredSerializer<
            GGetBooksData_books__asTextbook_author__asCompany> {
  @override
  final Iterable<Type> types = const [
    GGetBooksData_books__asTextbook_author__asCompany,
    _$GGetBooksData_books__asTextbook_author__asCompany
  ];
  @override
  final String wireName = 'GGetBooksData_books__asTextbook_author__asCompany';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetBooksData_books__asTextbook_author__asCompany object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(GBookFragment_author)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetBooksData_books__asTextbook_author__asCompany deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GGetBooksData_books__asTextbook_author__asCompanyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
                  specifiedType: const FullType(GBookFragment_author))!
              as GBookFragment_author;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetBooksData_books__asColoringBookSerializer
    implements StructuredSerializer<GGetBooksData_books__asColoringBook> {
  @override
  final Iterable<Type> types = const [
    GGetBooksData_books__asColoringBook,
    _$GGetBooksData_books__asColoringBook
  ];
  @override
  final String wireName = 'GGetBooksData_books__asColoringBook';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetBooksData_books__asColoringBook object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'author',
      serializers.serialize(object.author,
          specifiedType:
              const FullType(GGetBooksData_books__asColoringBook_author)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'colors',
      serializers.serialize(object.colors,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  GGetBooksData_books__asColoringBook deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GGetBooksData_books__asColoringBookBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetBooksData_books__asColoringBook_author))!
              as GGetBooksData_books__asColoringBook_author;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'colors':
          result.colors.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetBooksData_books__asColoringBook_author__baseSerializer
    implements
        StructuredSerializer<GGetBooksData_books__asColoringBook_author__base> {
  @override
  final Iterable<Type> types = const [
    GGetBooksData_books__asColoringBook_author__base,
    _$GGetBooksData_books__asColoringBook_author__base
  ];
  @override
  final String wireName = 'GGetBooksData_books__asColoringBook_author__base';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetBooksData_books__asColoringBook_author__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetBooksData_books__asColoringBook_author__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GGetBooksData_books__asColoringBook_author__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetBooksData_books__asColoringBook_author__asPersonSerializer
    implements
        StructuredSerializer<
            GGetBooksData_books__asColoringBook_author__asPerson> {
  @override
  final Iterable<Type> types = const [
    GGetBooksData_books__asColoringBook_author__asPerson,
    _$GGetBooksData_books__asColoringBook_author__asPerson
  ];
  @override
  final String wireName =
      'GGetBooksData_books__asColoringBook_author__asPerson';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetBooksData_books__asColoringBook_author__asPerson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'firstName',
      serializers.serialize(object.firstName,
          specifiedType: const FullType(String)),
      'lastName',
      serializers.serialize(object.lastName,
          specifiedType: const FullType(String)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(GBookFragment_author)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetBooksData_books__asColoringBook_author__asPerson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        GGetBooksData_books__asColoringBook_author__asPersonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
                  specifiedType: const FullType(GBookFragment_author))!
              as GBookFragment_author;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetBooksData_books__asColoringBook_author__asCompanySerializer
    implements
        StructuredSerializer<
            GGetBooksData_books__asColoringBook_author__asCompany> {
  @override
  final Iterable<Type> types = const [
    GGetBooksData_books__asColoringBook_author__asCompany,
    _$GGetBooksData_books__asColoringBook_author__asCompany
  ];
  @override
  final String wireName =
      'GGetBooksData_books__asColoringBook_author__asCompany';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetBooksData_books__asColoringBook_author__asCompany object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(GBookFragment_author)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetBooksData_books__asColoringBook_author__asCompany deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        GGetBooksData_books__asColoringBook_author__asCompanyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
                  specifiedType: const FullType(GBookFragment_author))!
              as GBookFragment_author;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GAuthorFragmentData__baseSerializer
    implements StructuredSerializer<GAuthorFragmentData__base> {
  @override
  final Iterable<Type> types = const [
    GAuthorFragmentData__base,
    _$GAuthorFragmentData__base
  ];
  @override
  final String wireName = 'GAuthorFragmentData__base';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAuthorFragmentData__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GAuthorFragmentData__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GAuthorFragmentData__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GAuthorFragmentData__asPersonSerializer
    implements StructuredSerializer<GAuthorFragmentData__asPerson> {
  @override
  final Iterable<Type> types = const [
    GAuthorFragmentData__asPerson,
    _$GAuthorFragmentData__asPerson
  ];
  @override
  final String wireName = 'GAuthorFragmentData__asPerson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAuthorFragmentData__asPerson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'firstName',
      serializers.serialize(object.firstName,
          specifiedType: const FullType(String)),
      'lastName',
      serializers.serialize(object.lastName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GAuthorFragmentData__asPerson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GAuthorFragmentData__asPersonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GAuthorFragmentData__asCompanySerializer
    implements StructuredSerializer<GAuthorFragmentData__asCompany> {
  @override
  final Iterable<Type> types = const [
    GAuthorFragmentData__asCompany,
    _$GAuthorFragmentData__asCompany
  ];
  @override
  final String wireName = 'GAuthorFragmentData__asCompany';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAuthorFragmentData__asCompany object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GAuthorFragmentData__asCompany deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GAuthorFragmentData__asCompanyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GBookFragmentData__baseSerializer
    implements StructuredSerializer<GBookFragmentData__base> {
  @override
  final Iterable<Type> types = const [
    GBookFragmentData__base,
    _$GBookFragmentData__base
  ];
  @override
  final String wireName = 'GBookFragmentData__base';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GBookFragmentData__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(GBookFragmentData__base_author)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GBookFragmentData__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GBookFragmentData__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
                  specifiedType:
                      const FullType(GBookFragmentData__base_author))!
              as GBookFragmentData__base_author;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GBookFragmentData__base_author__baseSerializer
    implements StructuredSerializer<GBookFragmentData__base_author__base> {
  @override
  final Iterable<Type> types = const [
    GBookFragmentData__base_author__base,
    _$GBookFragmentData__base_author__base
  ];
  @override
  final String wireName = 'GBookFragmentData__base_author__base';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GBookFragmentData__base_author__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GBookFragmentData__base_author__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GBookFragmentData__base_author__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GBookFragmentData__base_author__asPersonSerializer
    implements StructuredSerializer<GBookFragmentData__base_author__asPerson> {
  @override
  final Iterable<Type> types = const [
    GBookFragmentData__base_author__asPerson,
    _$GBookFragmentData__base_author__asPerson
  ];
  @override
  final String wireName = 'GBookFragmentData__base_author__asPerson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GBookFragmentData__base_author__asPerson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'firstName',
      serializers.serialize(object.firstName,
          specifiedType: const FullType(String)),
      'lastName',
      serializers.serialize(object.lastName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GBookFragmentData__base_author__asPerson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GBookFragmentData__base_author__asPersonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GBookFragmentData__base_author__asCompanySerializer
    implements StructuredSerializer<GBookFragmentData__base_author__asCompany> {
  @override
  final Iterable<Type> types = const [
    GBookFragmentData__base_author__asCompany,
    _$GBookFragmentData__base_author__asCompany
  ];
  @override
  final String wireName = 'GBookFragmentData__base_author__asCompany';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GBookFragmentData__base_author__asCompany object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GBookFragmentData__base_author__asCompany deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GBookFragmentData__base_author__asCompanyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GBookFragmentData__asTextbookSerializer
    implements StructuredSerializer<GBookFragmentData__asTextbook> {
  @override
  final Iterable<Type> types = const [
    GBookFragmentData__asTextbook,
    _$GBookFragmentData__asTextbook
  ];
  @override
  final String wireName = 'GBookFragmentData__asTextbook';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GBookFragmentData__asTextbook object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(GBookFragmentData__asTextbook_author)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'courses',
      serializers.serialize(object.courses,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  GBookFragmentData__asTextbook deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GBookFragmentData__asTextbookBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
                  specifiedType:
                      const FullType(GBookFragmentData__asTextbook_author))!
              as GBookFragmentData__asTextbook_author;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'courses':
          result.courses.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GBookFragmentData__asTextbook_author__baseSerializer
    implements
        StructuredSerializer<GBookFragmentData__asTextbook_author__base> {
  @override
  final Iterable<Type> types = const [
    GBookFragmentData__asTextbook_author__base,
    _$GBookFragmentData__asTextbook_author__base
  ];
  @override
  final String wireName = 'GBookFragmentData__asTextbook_author__base';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GBookFragmentData__asTextbook_author__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GBookFragmentData__asTextbook_author__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GBookFragmentData__asTextbook_author__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GBookFragmentData__asTextbook_author__asPersonSerializer
    implements
        StructuredSerializer<GBookFragmentData__asTextbook_author__asPerson> {
  @override
  final Iterable<Type> types = const [
    GBookFragmentData__asTextbook_author__asPerson,
    _$GBookFragmentData__asTextbook_author__asPerson
  ];
  @override
  final String wireName = 'GBookFragmentData__asTextbook_author__asPerson';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GBookFragmentData__asTextbook_author__asPerson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'firstName',
      serializers.serialize(object.firstName,
          specifiedType: const FullType(String)),
      'lastName',
      serializers.serialize(object.lastName,
          specifiedType: const FullType(String)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(GBookFragment_author)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GBookFragmentData__asTextbook_author__asPerson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GBookFragmentData__asTextbook_author__asPersonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
                  specifiedType: const FullType(GBookFragment_author))!
              as GBookFragment_author;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GBookFragmentData__asTextbook_author__asCompanySerializer
    implements
        StructuredSerializer<GBookFragmentData__asTextbook_author__asCompany> {
  @override
  final Iterable<Type> types = const [
    GBookFragmentData__asTextbook_author__asCompany,
    _$GBookFragmentData__asTextbook_author__asCompany
  ];
  @override
  final String wireName = 'GBookFragmentData__asTextbook_author__asCompany';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GBookFragmentData__asTextbook_author__asCompany object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(GBookFragment_author)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GBookFragmentData__asTextbook_author__asCompany deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GBookFragmentData__asTextbook_author__asCompanyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
                  specifiedType: const FullType(GBookFragment_author))!
              as GBookFragment_author;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GBookFragmentData__asColoringBookSerializer
    implements StructuredSerializer<GBookFragmentData__asColoringBook> {
  @override
  final Iterable<Type> types = const [
    GBookFragmentData__asColoringBook,
    _$GBookFragmentData__asColoringBook
  ];
  @override
  final String wireName = 'GBookFragmentData__asColoringBook';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GBookFragmentData__asColoringBook object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'author',
      serializers.serialize(object.author,
          specifiedType:
              const FullType(GBookFragmentData__asColoringBook_author)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'colors',
      serializers.serialize(object.colors,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  GBookFragmentData__asColoringBook deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GBookFragmentData__asColoringBookBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
                  specifiedType:
                      const FullType(GBookFragmentData__asColoringBook_author))!
              as GBookFragmentData__asColoringBook_author;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'colors':
          result.colors.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GBookFragmentData__asColoringBook_author__baseSerializer
    implements
        StructuredSerializer<GBookFragmentData__asColoringBook_author__base> {
  @override
  final Iterable<Type> types = const [
    GBookFragmentData__asColoringBook_author__base,
    _$GBookFragmentData__asColoringBook_author__base
  ];
  @override
  final String wireName = 'GBookFragmentData__asColoringBook_author__base';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GBookFragmentData__asColoringBook_author__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GBookFragmentData__asColoringBook_author__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GBookFragmentData__asColoringBook_author__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GBookFragmentData__asColoringBook_author__asPersonSerializer
    implements
        StructuredSerializer<
            GBookFragmentData__asColoringBook_author__asPerson> {
  @override
  final Iterable<Type> types = const [
    GBookFragmentData__asColoringBook_author__asPerson,
    _$GBookFragmentData__asColoringBook_author__asPerson
  ];
  @override
  final String wireName = 'GBookFragmentData__asColoringBook_author__asPerson';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GBookFragmentData__asColoringBook_author__asPerson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'firstName',
      serializers.serialize(object.firstName,
          specifiedType: const FullType(String)),
      'lastName',
      serializers.serialize(object.lastName,
          specifiedType: const FullType(String)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(GBookFragment_author)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GBookFragmentData__asColoringBook_author__asPerson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GBookFragmentData__asColoringBook_author__asPersonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
                  specifiedType: const FullType(GBookFragment_author))!
              as GBookFragment_author;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GBookFragmentData__asColoringBook_author__asCompanySerializer
    implements
        StructuredSerializer<
            GBookFragmentData__asColoringBook_author__asCompany> {
  @override
  final Iterable<Type> types = const [
    GBookFragmentData__asColoringBook_author__asCompany,
    _$GBookFragmentData__asColoringBook_author__asCompany
  ];
  @override
  final String wireName = 'GBookFragmentData__asColoringBook_author__asCompany';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GBookFragmentData__asColoringBook_author__asCompany object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(GBookFragment_author)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GBookFragmentData__asColoringBook_author__asCompany deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GBookFragmentData__asColoringBook_author__asCompanyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
                  specifiedType: const FullType(GBookFragment_author))!
              as GBookFragment_author;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetBooksData extends GGetBooksData {
  @override
  final String G__typename;
  @override
  final BuiltList<GGetBooksData_books> books;

  factory _$GGetBooksData([void Function(GGetBooksDataBuilder)? updates]) =>
      (GGetBooksDataBuilder()..update(updates))._build();

  _$GGetBooksData._({required this.G__typename, required this.books})
      : super._();
  @override
  GGetBooksData rebuild(void Function(GGetBooksDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetBooksDataBuilder toBuilder() => GGetBooksDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetBooksData &&
        G__typename == other.G__typename &&
        books == other.books;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, books.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetBooksData')
          ..add('G__typename', G__typename)
          ..add('books', books))
        .toString();
  }
}

class GGetBooksDataBuilder
    implements Builder<GGetBooksData, GGetBooksDataBuilder> {
  _$GGetBooksData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GGetBooksData_books>? _books;
  ListBuilder<GGetBooksData_books> get books =>
      _$this._books ??= ListBuilder<GGetBooksData_books>();
  set books(ListBuilder<GGetBooksData_books>? books) => _$this._books = books;

  GGetBooksDataBuilder() {
    GGetBooksData._initializeBuilder(this);
  }

  GGetBooksDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _books = $v.books.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetBooksData other) {
    _$v = other as _$GGetBooksData;
  }

  @override
  void update(void Function(GGetBooksDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetBooksData build() => _build();

  _$GGetBooksData _build() {
    _$GGetBooksData _$result;
    try {
      _$result = _$v ??
          _$GGetBooksData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GGetBooksData', 'G__typename'),
            books: books.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'books';
        books.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GGetBooksData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetBooksData_books__base extends GGetBooksData_books__base {
  @override
  final String G__typename;
  @override
  final GGetBooksData_books__base_author author;
  @override
  final String title;

  factory _$GGetBooksData_books__base(
          [void Function(GGetBooksData_books__baseBuilder)? updates]) =>
      (GGetBooksData_books__baseBuilder()..update(updates))._build();

  _$GGetBooksData_books__base._(
      {required this.G__typename, required this.author, required this.title})
      : super._();
  @override
  GGetBooksData_books__base rebuild(
          void Function(GGetBooksData_books__baseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetBooksData_books__baseBuilder toBuilder() =>
      GGetBooksData_books__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetBooksData_books__base &&
        G__typename == other.G__typename &&
        author == other.author &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetBooksData_books__base')
          ..add('G__typename', G__typename)
          ..add('author', author)
          ..add('title', title))
        .toString();
  }
}

class GGetBooksData_books__baseBuilder
    implements
        Builder<GGetBooksData_books__base, GGetBooksData_books__baseBuilder> {
  _$GGetBooksData_books__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetBooksData_books__base_author? _author;
  GGetBooksData_books__base_author? get author => _$this._author;
  set author(GGetBooksData_books__base_author? author) =>
      _$this._author = author;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GGetBooksData_books__baseBuilder() {
    GGetBooksData_books__base._initializeBuilder(this);
  }

  GGetBooksData_books__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _author = $v.author;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetBooksData_books__base other) {
    _$v = other as _$GGetBooksData_books__base;
  }

  @override
  void update(void Function(GGetBooksData_books__baseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetBooksData_books__base build() => _build();

  _$GGetBooksData_books__base _build() {
    final _$result = _$v ??
        _$GGetBooksData_books__base._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename, r'GGetBooksData_books__base', 'G__typename'),
          author: BuiltValueNullFieldError.checkNotNull(
              author, r'GGetBooksData_books__base', 'author'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'GGetBooksData_books__base', 'title'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GGetBooksData_books__base_author__base
    extends GGetBooksData_books__base_author__base {
  @override
  final String G__typename;
  @override
  final String displayName;

  factory _$GGetBooksData_books__base_author__base(
          [void Function(GGetBooksData_books__base_author__baseBuilder)?
              updates]) =>
      (GGetBooksData_books__base_author__baseBuilder()..update(updates))
          ._build();

  _$GGetBooksData_books__base_author__base._(
      {required this.G__typename, required this.displayName})
      : super._();
  @override
  GGetBooksData_books__base_author__base rebuild(
          void Function(GGetBooksData_books__base_author__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetBooksData_books__base_author__baseBuilder toBuilder() =>
      GGetBooksData_books__base_author__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetBooksData_books__base_author__base &&
        G__typename == other.G__typename &&
        displayName == other.displayName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetBooksData_books__base_author__base')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName))
        .toString();
  }
}

class GGetBooksData_books__base_author__baseBuilder
    implements
        Builder<GGetBooksData_books__base_author__base,
            GGetBooksData_books__base_author__baseBuilder> {
  _$GGetBooksData_books__base_author__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  GGetBooksData_books__base_author__baseBuilder() {
    GGetBooksData_books__base_author__base._initializeBuilder(this);
  }

  GGetBooksData_books__base_author__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetBooksData_books__base_author__base other) {
    _$v = other as _$GGetBooksData_books__base_author__base;
  }

  @override
  void update(
      void Function(GGetBooksData_books__base_author__baseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetBooksData_books__base_author__base build() => _build();

  _$GGetBooksData_books__base_author__base _build() {
    final _$result = _$v ??
        _$GGetBooksData_books__base_author__base._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GGetBooksData_books__base_author__base', 'G__typename'),
          displayName: BuiltValueNullFieldError.checkNotNull(displayName,
              r'GGetBooksData_books__base_author__base', 'displayName'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GGetBooksData_books__base_author__asPerson
    extends GGetBooksData_books__base_author__asPerson {
  @override
  final String G__typename;
  @override
  final String displayName;
  @override
  final String firstName;
  @override
  final String lastName;

  factory _$GGetBooksData_books__base_author__asPerson(
          [void Function(GGetBooksData_books__base_author__asPersonBuilder)?
              updates]) =>
      (GGetBooksData_books__base_author__asPersonBuilder()..update(updates))
          ._build();

  _$GGetBooksData_books__base_author__asPerson._(
      {required this.G__typename,
      required this.displayName,
      required this.firstName,
      required this.lastName})
      : super._();
  @override
  GGetBooksData_books__base_author__asPerson rebuild(
          void Function(GGetBooksData_books__base_author__asPersonBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetBooksData_books__base_author__asPersonBuilder toBuilder() =>
      GGetBooksData_books__base_author__asPersonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetBooksData_books__base_author__asPerson &&
        G__typename == other.G__typename &&
        displayName == other.displayName &&
        firstName == other.firstName &&
        lastName == other.lastName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetBooksData_books__base_author__asPerson')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName)
          ..add('firstName', firstName)
          ..add('lastName', lastName))
        .toString();
  }
}

class GGetBooksData_books__base_author__asPersonBuilder
    implements
        Builder<GGetBooksData_books__base_author__asPerson,
            GGetBooksData_books__base_author__asPersonBuilder> {
  _$GGetBooksData_books__base_author__asPerson? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  GGetBooksData_books__base_author__asPersonBuilder() {
    GGetBooksData_books__base_author__asPerson._initializeBuilder(this);
  }

  GGetBooksData_books__base_author__asPersonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetBooksData_books__base_author__asPerson other) {
    _$v = other as _$GGetBooksData_books__base_author__asPerson;
  }

  @override
  void update(
      void Function(GGetBooksData_books__base_author__asPersonBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetBooksData_books__base_author__asPerson build() => _build();

  _$GGetBooksData_books__base_author__asPerson _build() {
    final _$result = _$v ??
        _$GGetBooksData_books__base_author__asPerson._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GGetBooksData_books__base_author__asPerson', 'G__typename'),
          displayName: BuiltValueNullFieldError.checkNotNull(displayName,
              r'GGetBooksData_books__base_author__asPerson', 'displayName'),
          firstName: BuiltValueNullFieldError.checkNotNull(firstName,
              r'GGetBooksData_books__base_author__asPerson', 'firstName'),
          lastName: BuiltValueNullFieldError.checkNotNull(lastName,
              r'GGetBooksData_books__base_author__asPerson', 'lastName'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GGetBooksData_books__base_author__asCompany
    extends GGetBooksData_books__base_author__asCompany {
  @override
  final String G__typename;
  @override
  final String displayName;
  @override
  final String name;

  factory _$GGetBooksData_books__base_author__asCompany(
          [void Function(GGetBooksData_books__base_author__asCompanyBuilder)?
              updates]) =>
      (GGetBooksData_books__base_author__asCompanyBuilder()..update(updates))
          ._build();

  _$GGetBooksData_books__base_author__asCompany._(
      {required this.G__typename,
      required this.displayName,
      required this.name})
      : super._();
  @override
  GGetBooksData_books__base_author__asCompany rebuild(
          void Function(GGetBooksData_books__base_author__asCompanyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetBooksData_books__base_author__asCompanyBuilder toBuilder() =>
      GGetBooksData_books__base_author__asCompanyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetBooksData_books__base_author__asCompany &&
        G__typename == other.G__typename &&
        displayName == other.displayName &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetBooksData_books__base_author__asCompany')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName)
          ..add('name', name))
        .toString();
  }
}

class GGetBooksData_books__base_author__asCompanyBuilder
    implements
        Builder<GGetBooksData_books__base_author__asCompany,
            GGetBooksData_books__base_author__asCompanyBuilder> {
  _$GGetBooksData_books__base_author__asCompany? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GGetBooksData_books__base_author__asCompanyBuilder() {
    GGetBooksData_books__base_author__asCompany._initializeBuilder(this);
  }

  GGetBooksData_books__base_author__asCompanyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetBooksData_books__base_author__asCompany other) {
    _$v = other as _$GGetBooksData_books__base_author__asCompany;
  }

  @override
  void update(
      void Function(GGetBooksData_books__base_author__asCompanyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetBooksData_books__base_author__asCompany build() => _build();

  _$GGetBooksData_books__base_author__asCompany _build() {
    final _$result = _$v ??
        _$GGetBooksData_books__base_author__asCompany._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GGetBooksData_books__base_author__asCompany', 'G__typename'),
          displayName: BuiltValueNullFieldError.checkNotNull(displayName,
              r'GGetBooksData_books__base_author__asCompany', 'displayName'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'GGetBooksData_books__base_author__asCompany', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GGetBooksData_books__asTextbook
    extends GGetBooksData_books__asTextbook {
  @override
  final String G__typename;
  @override
  final GGetBooksData_books__asTextbook_author author;
  @override
  final String title;
  @override
  final BuiltList<String> courses;

  factory _$GGetBooksData_books__asTextbook(
          [void Function(GGetBooksData_books__asTextbookBuilder)? updates]) =>
      (GGetBooksData_books__asTextbookBuilder()..update(updates))._build();

  _$GGetBooksData_books__asTextbook._(
      {required this.G__typename,
      required this.author,
      required this.title,
      required this.courses})
      : super._();
  @override
  GGetBooksData_books__asTextbook rebuild(
          void Function(GGetBooksData_books__asTextbookBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetBooksData_books__asTextbookBuilder toBuilder() =>
      GGetBooksData_books__asTextbookBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetBooksData_books__asTextbook &&
        G__typename == other.G__typename &&
        author == other.author &&
        title == other.title &&
        courses == other.courses;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, courses.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetBooksData_books__asTextbook')
          ..add('G__typename', G__typename)
          ..add('author', author)
          ..add('title', title)
          ..add('courses', courses))
        .toString();
  }
}

class GGetBooksData_books__asTextbookBuilder
    implements
        Builder<GGetBooksData_books__asTextbook,
            GGetBooksData_books__asTextbookBuilder> {
  _$GGetBooksData_books__asTextbook? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetBooksData_books__asTextbook_author? _author;
  GGetBooksData_books__asTextbook_author? get author => _$this._author;
  set author(GGetBooksData_books__asTextbook_author? author) =>
      _$this._author = author;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ListBuilder<String>? _courses;
  ListBuilder<String> get courses => _$this._courses ??= ListBuilder<String>();
  set courses(ListBuilder<String>? courses) => _$this._courses = courses;

  GGetBooksData_books__asTextbookBuilder() {
    GGetBooksData_books__asTextbook._initializeBuilder(this);
  }

  GGetBooksData_books__asTextbookBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _author = $v.author;
      _title = $v.title;
      _courses = $v.courses.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetBooksData_books__asTextbook other) {
    _$v = other as _$GGetBooksData_books__asTextbook;
  }

  @override
  void update(void Function(GGetBooksData_books__asTextbookBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetBooksData_books__asTextbook build() => _build();

  _$GGetBooksData_books__asTextbook _build() {
    _$GGetBooksData_books__asTextbook _$result;
    try {
      _$result = _$v ??
          _$GGetBooksData_books__asTextbook._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GGetBooksData_books__asTextbook', 'G__typename'),
            author: BuiltValueNullFieldError.checkNotNull(
                author, r'GGetBooksData_books__asTextbook', 'author'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GGetBooksData_books__asTextbook', 'title'),
            courses: courses.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'courses';
        courses.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GGetBooksData_books__asTextbook', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetBooksData_books__asTextbook_author__base
    extends GGetBooksData_books__asTextbook_author__base {
  @override
  final String G__typename;
  @override
  final String displayName;

  factory _$GGetBooksData_books__asTextbook_author__base(
          [void Function(GGetBooksData_books__asTextbook_author__baseBuilder)?
              updates]) =>
      (GGetBooksData_books__asTextbook_author__baseBuilder()..update(updates))
          ._build();

  _$GGetBooksData_books__asTextbook_author__base._(
      {required this.G__typename, required this.displayName})
      : super._();
  @override
  GGetBooksData_books__asTextbook_author__base rebuild(
          void Function(GGetBooksData_books__asTextbook_author__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetBooksData_books__asTextbook_author__baseBuilder toBuilder() =>
      GGetBooksData_books__asTextbook_author__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetBooksData_books__asTextbook_author__base &&
        G__typename == other.G__typename &&
        displayName == other.displayName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetBooksData_books__asTextbook_author__base')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName))
        .toString();
  }
}

class GGetBooksData_books__asTextbook_author__baseBuilder
    implements
        Builder<GGetBooksData_books__asTextbook_author__base,
            GGetBooksData_books__asTextbook_author__baseBuilder> {
  _$GGetBooksData_books__asTextbook_author__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  GGetBooksData_books__asTextbook_author__baseBuilder() {
    GGetBooksData_books__asTextbook_author__base._initializeBuilder(this);
  }

  GGetBooksData_books__asTextbook_author__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetBooksData_books__asTextbook_author__base other) {
    _$v = other as _$GGetBooksData_books__asTextbook_author__base;
  }

  @override
  void update(
      void Function(GGetBooksData_books__asTextbook_author__baseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetBooksData_books__asTextbook_author__base build() => _build();

  _$GGetBooksData_books__asTextbook_author__base _build() {
    final _$result = _$v ??
        _$GGetBooksData_books__asTextbook_author__base._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GGetBooksData_books__asTextbook_author__base', 'G__typename'),
          displayName: BuiltValueNullFieldError.checkNotNull(displayName,
              r'GGetBooksData_books__asTextbook_author__base', 'displayName'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GGetBooksData_books__asTextbook_author__asPerson
    extends GGetBooksData_books__asTextbook_author__asPerson {
  @override
  final String G__typename;
  @override
  final String displayName;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final GBookFragment_author author;
  @override
  final String title;

  factory _$GGetBooksData_books__asTextbook_author__asPerson(
          [void Function(
                  GGetBooksData_books__asTextbook_author__asPersonBuilder)?
              updates]) =>
      (GGetBooksData_books__asTextbook_author__asPersonBuilder()
            ..update(updates))
          ._build();

  _$GGetBooksData_books__asTextbook_author__asPerson._(
      {required this.G__typename,
      required this.displayName,
      required this.firstName,
      required this.lastName,
      required this.author,
      required this.title})
      : super._();
  @override
  GGetBooksData_books__asTextbook_author__asPerson rebuild(
          void Function(GGetBooksData_books__asTextbook_author__asPersonBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetBooksData_books__asTextbook_author__asPersonBuilder toBuilder() =>
      GGetBooksData_books__asTextbook_author__asPersonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetBooksData_books__asTextbook_author__asPerson &&
        G__typename == other.G__typename &&
        displayName == other.displayName &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        author == other.author &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetBooksData_books__asTextbook_author__asPerson')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('author', author)
          ..add('title', title))
        .toString();
  }
}

class GGetBooksData_books__asTextbook_author__asPersonBuilder
    implements
        Builder<GGetBooksData_books__asTextbook_author__asPerson,
            GGetBooksData_books__asTextbook_author__asPersonBuilder> {
  _$GGetBooksData_books__asTextbook_author__asPerson? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  GBookFragment_author? _author;
  GBookFragment_author? get author => _$this._author;
  set author(GBookFragment_author? author) => _$this._author = author;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GGetBooksData_books__asTextbook_author__asPersonBuilder() {
    GGetBooksData_books__asTextbook_author__asPerson._initializeBuilder(this);
  }

  GGetBooksData_books__asTextbook_author__asPersonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _author = $v.author;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetBooksData_books__asTextbook_author__asPerson other) {
    _$v = other as _$GGetBooksData_books__asTextbook_author__asPerson;
  }

  @override
  void update(
      void Function(GGetBooksData_books__asTextbook_author__asPersonBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetBooksData_books__asTextbook_author__asPerson build() => _build();

  _$GGetBooksData_books__asTextbook_author__asPerson _build() {
    final _$result = _$v ??
        _$GGetBooksData_books__asTextbook_author__asPerson._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GGetBooksData_books__asTextbook_author__asPerson',
              'G__typename'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName,
              r'GGetBooksData_books__asTextbook_author__asPerson',
              'displayName'),
          firstName: BuiltValueNullFieldError.checkNotNull(firstName,
              r'GGetBooksData_books__asTextbook_author__asPerson', 'firstName'),
          lastName: BuiltValueNullFieldError.checkNotNull(lastName,
              r'GGetBooksData_books__asTextbook_author__asPerson', 'lastName'),
          author: BuiltValueNullFieldError.checkNotNull(author,
              r'GGetBooksData_books__asTextbook_author__asPerson', 'author'),
          title: BuiltValueNullFieldError.checkNotNull(title,
              r'GGetBooksData_books__asTextbook_author__asPerson', 'title'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GGetBooksData_books__asTextbook_author__asCompany
    extends GGetBooksData_books__asTextbook_author__asCompany {
  @override
  final String G__typename;
  @override
  final String displayName;
  @override
  final String name;
  @override
  final GBookFragment_author author;
  @override
  final String title;

  factory _$GGetBooksData_books__asTextbook_author__asCompany(
          [void Function(
                  GGetBooksData_books__asTextbook_author__asCompanyBuilder)?
              updates]) =>
      (GGetBooksData_books__asTextbook_author__asCompanyBuilder()
            ..update(updates))
          ._build();

  _$GGetBooksData_books__asTextbook_author__asCompany._(
      {required this.G__typename,
      required this.displayName,
      required this.name,
      required this.author,
      required this.title})
      : super._();
  @override
  GGetBooksData_books__asTextbook_author__asCompany rebuild(
          void Function(
                  GGetBooksData_books__asTextbook_author__asCompanyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetBooksData_books__asTextbook_author__asCompanyBuilder toBuilder() =>
      GGetBooksData_books__asTextbook_author__asCompanyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetBooksData_books__asTextbook_author__asCompany &&
        G__typename == other.G__typename &&
        displayName == other.displayName &&
        name == other.name &&
        author == other.author &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetBooksData_books__asTextbook_author__asCompany')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName)
          ..add('name', name)
          ..add('author', author)
          ..add('title', title))
        .toString();
  }
}

class GGetBooksData_books__asTextbook_author__asCompanyBuilder
    implements
        Builder<GGetBooksData_books__asTextbook_author__asCompany,
            GGetBooksData_books__asTextbook_author__asCompanyBuilder> {
  _$GGetBooksData_books__asTextbook_author__asCompany? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GBookFragment_author? _author;
  GBookFragment_author? get author => _$this._author;
  set author(GBookFragment_author? author) => _$this._author = author;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GGetBooksData_books__asTextbook_author__asCompanyBuilder() {
    GGetBooksData_books__asTextbook_author__asCompany._initializeBuilder(this);
  }

  GGetBooksData_books__asTextbook_author__asCompanyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _name = $v.name;
      _author = $v.author;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetBooksData_books__asTextbook_author__asCompany other) {
    _$v = other as _$GGetBooksData_books__asTextbook_author__asCompany;
  }

  @override
  void update(
      void Function(GGetBooksData_books__asTextbook_author__asCompanyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetBooksData_books__asTextbook_author__asCompany build() => _build();

  _$GGetBooksData_books__asTextbook_author__asCompany _build() {
    final _$result = _$v ??
        _$GGetBooksData_books__asTextbook_author__asCompany._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GGetBooksData_books__asTextbook_author__asCompany',
              'G__typename'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName,
              r'GGetBooksData_books__asTextbook_author__asCompany',
              'displayName'),
          name: BuiltValueNullFieldError.checkNotNull(name,
              r'GGetBooksData_books__asTextbook_author__asCompany', 'name'),
          author: BuiltValueNullFieldError.checkNotNull(author,
              r'GGetBooksData_books__asTextbook_author__asCompany', 'author'),
          title: BuiltValueNullFieldError.checkNotNull(title,
              r'GGetBooksData_books__asTextbook_author__asCompany', 'title'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GGetBooksData_books__asColoringBook
    extends GGetBooksData_books__asColoringBook {
  @override
  final String G__typename;
  @override
  final GGetBooksData_books__asColoringBook_author author;
  @override
  final String title;
  @override
  final BuiltList<String> colors;

  factory _$GGetBooksData_books__asColoringBook(
          [void Function(GGetBooksData_books__asColoringBookBuilder)?
              updates]) =>
      (GGetBooksData_books__asColoringBookBuilder()..update(updates))._build();

  _$GGetBooksData_books__asColoringBook._(
      {required this.G__typename,
      required this.author,
      required this.title,
      required this.colors})
      : super._();
  @override
  GGetBooksData_books__asColoringBook rebuild(
          void Function(GGetBooksData_books__asColoringBookBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetBooksData_books__asColoringBookBuilder toBuilder() =>
      GGetBooksData_books__asColoringBookBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetBooksData_books__asColoringBook &&
        G__typename == other.G__typename &&
        author == other.author &&
        title == other.title &&
        colors == other.colors;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, colors.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetBooksData_books__asColoringBook')
          ..add('G__typename', G__typename)
          ..add('author', author)
          ..add('title', title)
          ..add('colors', colors))
        .toString();
  }
}

class GGetBooksData_books__asColoringBookBuilder
    implements
        Builder<GGetBooksData_books__asColoringBook,
            GGetBooksData_books__asColoringBookBuilder> {
  _$GGetBooksData_books__asColoringBook? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetBooksData_books__asColoringBook_author? _author;
  GGetBooksData_books__asColoringBook_author? get author => _$this._author;
  set author(GGetBooksData_books__asColoringBook_author? author) =>
      _$this._author = author;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ListBuilder<String>? _colors;
  ListBuilder<String> get colors => _$this._colors ??= ListBuilder<String>();
  set colors(ListBuilder<String>? colors) => _$this._colors = colors;

  GGetBooksData_books__asColoringBookBuilder() {
    GGetBooksData_books__asColoringBook._initializeBuilder(this);
  }

  GGetBooksData_books__asColoringBookBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _author = $v.author;
      _title = $v.title;
      _colors = $v.colors.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetBooksData_books__asColoringBook other) {
    _$v = other as _$GGetBooksData_books__asColoringBook;
  }

  @override
  void update(
      void Function(GGetBooksData_books__asColoringBookBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetBooksData_books__asColoringBook build() => _build();

  _$GGetBooksData_books__asColoringBook _build() {
    _$GGetBooksData_books__asColoringBook _$result;
    try {
      _$result = _$v ??
          _$GGetBooksData_books__asColoringBook._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetBooksData_books__asColoringBook', 'G__typename'),
            author: BuiltValueNullFieldError.checkNotNull(
                author, r'GGetBooksData_books__asColoringBook', 'author'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GGetBooksData_books__asColoringBook', 'title'),
            colors: colors.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'colors';
        colors.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'GGetBooksData_books__asColoringBook',
            _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetBooksData_books__asColoringBook_author__base
    extends GGetBooksData_books__asColoringBook_author__base {
  @override
  final String G__typename;
  @override
  final String displayName;

  factory _$GGetBooksData_books__asColoringBook_author__base(
          [void Function(
                  GGetBooksData_books__asColoringBook_author__baseBuilder)?
              updates]) =>
      (GGetBooksData_books__asColoringBook_author__baseBuilder()
            ..update(updates))
          ._build();

  _$GGetBooksData_books__asColoringBook_author__base._(
      {required this.G__typename, required this.displayName})
      : super._();
  @override
  GGetBooksData_books__asColoringBook_author__base rebuild(
          void Function(GGetBooksData_books__asColoringBook_author__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetBooksData_books__asColoringBook_author__baseBuilder toBuilder() =>
      GGetBooksData_books__asColoringBook_author__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetBooksData_books__asColoringBook_author__base &&
        G__typename == other.G__typename &&
        displayName == other.displayName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetBooksData_books__asColoringBook_author__base')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName))
        .toString();
  }
}

class GGetBooksData_books__asColoringBook_author__baseBuilder
    implements
        Builder<GGetBooksData_books__asColoringBook_author__base,
            GGetBooksData_books__asColoringBook_author__baseBuilder> {
  _$GGetBooksData_books__asColoringBook_author__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  GGetBooksData_books__asColoringBook_author__baseBuilder() {
    GGetBooksData_books__asColoringBook_author__base._initializeBuilder(this);
  }

  GGetBooksData_books__asColoringBook_author__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetBooksData_books__asColoringBook_author__base other) {
    _$v = other as _$GGetBooksData_books__asColoringBook_author__base;
  }

  @override
  void update(
      void Function(GGetBooksData_books__asColoringBook_author__baseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetBooksData_books__asColoringBook_author__base build() => _build();

  _$GGetBooksData_books__asColoringBook_author__base _build() {
    final _$result = _$v ??
        _$GGetBooksData_books__asColoringBook_author__base._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GGetBooksData_books__asColoringBook_author__base',
              'G__typename'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName,
              r'GGetBooksData_books__asColoringBook_author__base',
              'displayName'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GGetBooksData_books__asColoringBook_author__asPerson
    extends GGetBooksData_books__asColoringBook_author__asPerson {
  @override
  final String G__typename;
  @override
  final String displayName;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final GBookFragment_author author;
  @override
  final String title;

  factory _$GGetBooksData_books__asColoringBook_author__asPerson(
          [void Function(
                  GGetBooksData_books__asColoringBook_author__asPersonBuilder)?
              updates]) =>
      (GGetBooksData_books__asColoringBook_author__asPersonBuilder()
            ..update(updates))
          ._build();

  _$GGetBooksData_books__asColoringBook_author__asPerson._(
      {required this.G__typename,
      required this.displayName,
      required this.firstName,
      required this.lastName,
      required this.author,
      required this.title})
      : super._();
  @override
  GGetBooksData_books__asColoringBook_author__asPerson rebuild(
          void Function(
                  GGetBooksData_books__asColoringBook_author__asPersonBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetBooksData_books__asColoringBook_author__asPersonBuilder toBuilder() =>
      GGetBooksData_books__asColoringBook_author__asPersonBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetBooksData_books__asColoringBook_author__asPerson &&
        G__typename == other.G__typename &&
        displayName == other.displayName &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        author == other.author &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetBooksData_books__asColoringBook_author__asPerson')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('author', author)
          ..add('title', title))
        .toString();
  }
}

class GGetBooksData_books__asColoringBook_author__asPersonBuilder
    implements
        Builder<GGetBooksData_books__asColoringBook_author__asPerson,
            GGetBooksData_books__asColoringBook_author__asPersonBuilder> {
  _$GGetBooksData_books__asColoringBook_author__asPerson? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  GBookFragment_author? _author;
  GBookFragment_author? get author => _$this._author;
  set author(GBookFragment_author? author) => _$this._author = author;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GGetBooksData_books__asColoringBook_author__asPersonBuilder() {
    GGetBooksData_books__asColoringBook_author__asPerson._initializeBuilder(
        this);
  }

  GGetBooksData_books__asColoringBook_author__asPersonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _author = $v.author;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetBooksData_books__asColoringBook_author__asPerson other) {
    _$v = other as _$GGetBooksData_books__asColoringBook_author__asPerson;
  }

  @override
  void update(
      void Function(
              GGetBooksData_books__asColoringBook_author__asPersonBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetBooksData_books__asColoringBook_author__asPerson build() => _build();

  _$GGetBooksData_books__asColoringBook_author__asPerson _build() {
    final _$result = _$v ??
        _$GGetBooksData_books__asColoringBook_author__asPerson._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GGetBooksData_books__asColoringBook_author__asPerson',
              'G__typename'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName,
              r'GGetBooksData_books__asColoringBook_author__asPerson',
              'displayName'),
          firstName: BuiltValueNullFieldError.checkNotNull(
              firstName,
              r'GGetBooksData_books__asColoringBook_author__asPerson',
              'firstName'),
          lastName: BuiltValueNullFieldError.checkNotNull(
              lastName,
              r'GGetBooksData_books__asColoringBook_author__asPerson',
              'lastName'),
          author: BuiltValueNullFieldError.checkNotNull(
              author,
              r'GGetBooksData_books__asColoringBook_author__asPerson',
              'author'),
          title: BuiltValueNullFieldError.checkNotNull(title,
              r'GGetBooksData_books__asColoringBook_author__asPerson', 'title'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GGetBooksData_books__asColoringBook_author__asCompany
    extends GGetBooksData_books__asColoringBook_author__asCompany {
  @override
  final String G__typename;
  @override
  final String displayName;
  @override
  final String name;
  @override
  final GBookFragment_author author;
  @override
  final String title;

  factory _$GGetBooksData_books__asColoringBook_author__asCompany(
          [void Function(
                  GGetBooksData_books__asColoringBook_author__asCompanyBuilder)?
              updates]) =>
      (GGetBooksData_books__asColoringBook_author__asCompanyBuilder()
            ..update(updates))
          ._build();

  _$GGetBooksData_books__asColoringBook_author__asCompany._(
      {required this.G__typename,
      required this.displayName,
      required this.name,
      required this.author,
      required this.title})
      : super._();
  @override
  GGetBooksData_books__asColoringBook_author__asCompany rebuild(
          void Function(
                  GGetBooksData_books__asColoringBook_author__asCompanyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetBooksData_books__asColoringBook_author__asCompanyBuilder toBuilder() =>
      GGetBooksData_books__asColoringBook_author__asCompanyBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetBooksData_books__asColoringBook_author__asCompany &&
        G__typename == other.G__typename &&
        displayName == other.displayName &&
        name == other.name &&
        author == other.author &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetBooksData_books__asColoringBook_author__asCompany')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName)
          ..add('name', name)
          ..add('author', author)
          ..add('title', title))
        .toString();
  }
}

class GGetBooksData_books__asColoringBook_author__asCompanyBuilder
    implements
        Builder<GGetBooksData_books__asColoringBook_author__asCompany,
            GGetBooksData_books__asColoringBook_author__asCompanyBuilder> {
  _$GGetBooksData_books__asColoringBook_author__asCompany? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GBookFragment_author? _author;
  GBookFragment_author? get author => _$this._author;
  set author(GBookFragment_author? author) => _$this._author = author;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GGetBooksData_books__asColoringBook_author__asCompanyBuilder() {
    GGetBooksData_books__asColoringBook_author__asCompany._initializeBuilder(
        this);
  }

  GGetBooksData_books__asColoringBook_author__asCompanyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _name = $v.name;
      _author = $v.author;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetBooksData_books__asColoringBook_author__asCompany other) {
    _$v = other as _$GGetBooksData_books__asColoringBook_author__asCompany;
  }

  @override
  void update(
      void Function(
              GGetBooksData_books__asColoringBook_author__asCompanyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetBooksData_books__asColoringBook_author__asCompany build() => _build();

  _$GGetBooksData_books__asColoringBook_author__asCompany _build() {
    final _$result = _$v ??
        _$GGetBooksData_books__asColoringBook_author__asCompany._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GGetBooksData_books__asColoringBook_author__asCompany',
              'G__typename'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName,
              r'GGetBooksData_books__asColoringBook_author__asCompany',
              'displayName'),
          name: BuiltValueNullFieldError.checkNotNull(name,
              r'GGetBooksData_books__asColoringBook_author__asCompany', 'name'),
          author: BuiltValueNullFieldError.checkNotNull(
              author,
              r'GGetBooksData_books__asColoringBook_author__asCompany',
              'author'),
          title: BuiltValueNullFieldError.checkNotNull(
              title,
              r'GGetBooksData_books__asColoringBook_author__asCompany',
              'title'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GAuthorFragmentData__base extends GAuthorFragmentData__base {
  @override
  final String G__typename;
  @override
  final String displayName;

  factory _$GAuthorFragmentData__base(
          [void Function(GAuthorFragmentData__baseBuilder)? updates]) =>
      (GAuthorFragmentData__baseBuilder()..update(updates))._build();

  _$GAuthorFragmentData__base._(
      {required this.G__typename, required this.displayName})
      : super._();
  @override
  GAuthorFragmentData__base rebuild(
          void Function(GAuthorFragmentData__baseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAuthorFragmentData__baseBuilder toBuilder() =>
      GAuthorFragmentData__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAuthorFragmentData__base &&
        G__typename == other.G__typename &&
        displayName == other.displayName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAuthorFragmentData__base')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName))
        .toString();
  }
}

class GAuthorFragmentData__baseBuilder
    implements
        Builder<GAuthorFragmentData__base, GAuthorFragmentData__baseBuilder> {
  _$GAuthorFragmentData__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  GAuthorFragmentData__baseBuilder() {
    GAuthorFragmentData__base._initializeBuilder(this);
  }

  GAuthorFragmentData__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAuthorFragmentData__base other) {
    _$v = other as _$GAuthorFragmentData__base;
  }

  @override
  void update(void Function(GAuthorFragmentData__baseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAuthorFragmentData__base build() => _build();

  _$GAuthorFragmentData__base _build() {
    final _$result = _$v ??
        _$GAuthorFragmentData__base._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename, r'GAuthorFragmentData__base', 'G__typename'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName, r'GAuthorFragmentData__base', 'displayName'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GAuthorFragmentData__asPerson extends GAuthorFragmentData__asPerson {
  @override
  final String G__typename;
  @override
  final String displayName;
  @override
  final String firstName;
  @override
  final String lastName;

  factory _$GAuthorFragmentData__asPerson(
          [void Function(GAuthorFragmentData__asPersonBuilder)? updates]) =>
      (GAuthorFragmentData__asPersonBuilder()..update(updates))._build();

  _$GAuthorFragmentData__asPerson._(
      {required this.G__typename,
      required this.displayName,
      required this.firstName,
      required this.lastName})
      : super._();
  @override
  GAuthorFragmentData__asPerson rebuild(
          void Function(GAuthorFragmentData__asPersonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAuthorFragmentData__asPersonBuilder toBuilder() =>
      GAuthorFragmentData__asPersonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAuthorFragmentData__asPerson &&
        G__typename == other.G__typename &&
        displayName == other.displayName &&
        firstName == other.firstName &&
        lastName == other.lastName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAuthorFragmentData__asPerson')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName)
          ..add('firstName', firstName)
          ..add('lastName', lastName))
        .toString();
  }
}

class GAuthorFragmentData__asPersonBuilder
    implements
        Builder<GAuthorFragmentData__asPerson,
            GAuthorFragmentData__asPersonBuilder> {
  _$GAuthorFragmentData__asPerson? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  GAuthorFragmentData__asPersonBuilder() {
    GAuthorFragmentData__asPerson._initializeBuilder(this);
  }

  GAuthorFragmentData__asPersonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAuthorFragmentData__asPerson other) {
    _$v = other as _$GAuthorFragmentData__asPerson;
  }

  @override
  void update(void Function(GAuthorFragmentData__asPersonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAuthorFragmentData__asPerson build() => _build();

  _$GAuthorFragmentData__asPerson _build() {
    final _$result = _$v ??
        _$GAuthorFragmentData__asPerson._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename, r'GAuthorFragmentData__asPerson', 'G__typename'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName, r'GAuthorFragmentData__asPerson', 'displayName'),
          firstName: BuiltValueNullFieldError.checkNotNull(
              firstName, r'GAuthorFragmentData__asPerson', 'firstName'),
          lastName: BuiltValueNullFieldError.checkNotNull(
              lastName, r'GAuthorFragmentData__asPerson', 'lastName'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GAuthorFragmentData__asCompany extends GAuthorFragmentData__asCompany {
  @override
  final String G__typename;
  @override
  final String displayName;
  @override
  final String name;

  factory _$GAuthorFragmentData__asCompany(
          [void Function(GAuthorFragmentData__asCompanyBuilder)? updates]) =>
      (GAuthorFragmentData__asCompanyBuilder()..update(updates))._build();

  _$GAuthorFragmentData__asCompany._(
      {required this.G__typename,
      required this.displayName,
      required this.name})
      : super._();
  @override
  GAuthorFragmentData__asCompany rebuild(
          void Function(GAuthorFragmentData__asCompanyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAuthorFragmentData__asCompanyBuilder toBuilder() =>
      GAuthorFragmentData__asCompanyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAuthorFragmentData__asCompany &&
        G__typename == other.G__typename &&
        displayName == other.displayName &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAuthorFragmentData__asCompany')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName)
          ..add('name', name))
        .toString();
  }
}

class GAuthorFragmentData__asCompanyBuilder
    implements
        Builder<GAuthorFragmentData__asCompany,
            GAuthorFragmentData__asCompanyBuilder> {
  _$GAuthorFragmentData__asCompany? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GAuthorFragmentData__asCompanyBuilder() {
    GAuthorFragmentData__asCompany._initializeBuilder(this);
  }

  GAuthorFragmentData__asCompanyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAuthorFragmentData__asCompany other) {
    _$v = other as _$GAuthorFragmentData__asCompany;
  }

  @override
  void update(void Function(GAuthorFragmentData__asCompanyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAuthorFragmentData__asCompany build() => _build();

  _$GAuthorFragmentData__asCompany _build() {
    final _$result = _$v ??
        _$GAuthorFragmentData__asCompany._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename, r'GAuthorFragmentData__asCompany', 'G__typename'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName, r'GAuthorFragmentData__asCompany', 'displayName'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'GAuthorFragmentData__asCompany', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GBookFragmentData__base extends GBookFragmentData__base {
  @override
  final String G__typename;
  @override
  final GBookFragmentData__base_author author;
  @override
  final String title;

  factory _$GBookFragmentData__base(
          [void Function(GBookFragmentData__baseBuilder)? updates]) =>
      (GBookFragmentData__baseBuilder()..update(updates))._build();

  _$GBookFragmentData__base._(
      {required this.G__typename, required this.author, required this.title})
      : super._();
  @override
  GBookFragmentData__base rebuild(
          void Function(GBookFragmentData__baseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GBookFragmentData__baseBuilder toBuilder() =>
      GBookFragmentData__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GBookFragmentData__base &&
        G__typename == other.G__typename &&
        author == other.author &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GBookFragmentData__base')
          ..add('G__typename', G__typename)
          ..add('author', author)
          ..add('title', title))
        .toString();
  }
}

class GBookFragmentData__baseBuilder
    implements
        Builder<GBookFragmentData__base, GBookFragmentData__baseBuilder> {
  _$GBookFragmentData__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GBookFragmentData__base_author? _author;
  GBookFragmentData__base_author? get author => _$this._author;
  set author(GBookFragmentData__base_author? author) => _$this._author = author;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GBookFragmentData__baseBuilder() {
    GBookFragmentData__base._initializeBuilder(this);
  }

  GBookFragmentData__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _author = $v.author;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GBookFragmentData__base other) {
    _$v = other as _$GBookFragmentData__base;
  }

  @override
  void update(void Function(GBookFragmentData__baseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GBookFragmentData__base build() => _build();

  _$GBookFragmentData__base _build() {
    final _$result = _$v ??
        _$GBookFragmentData__base._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename, r'GBookFragmentData__base', 'G__typename'),
          author: BuiltValueNullFieldError.checkNotNull(
              author, r'GBookFragmentData__base', 'author'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'GBookFragmentData__base', 'title'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GBookFragmentData__base_author__base
    extends GBookFragmentData__base_author__base {
  @override
  final String G__typename;
  @override
  final String displayName;

  factory _$GBookFragmentData__base_author__base(
          [void Function(GBookFragmentData__base_author__baseBuilder)?
              updates]) =>
      (GBookFragmentData__base_author__baseBuilder()..update(updates))._build();

  _$GBookFragmentData__base_author__base._(
      {required this.G__typename, required this.displayName})
      : super._();
  @override
  GBookFragmentData__base_author__base rebuild(
          void Function(GBookFragmentData__base_author__baseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GBookFragmentData__base_author__baseBuilder toBuilder() =>
      GBookFragmentData__base_author__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GBookFragmentData__base_author__base &&
        G__typename == other.G__typename &&
        displayName == other.displayName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GBookFragmentData__base_author__base')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName))
        .toString();
  }
}

class GBookFragmentData__base_author__baseBuilder
    implements
        Builder<GBookFragmentData__base_author__base,
            GBookFragmentData__base_author__baseBuilder> {
  _$GBookFragmentData__base_author__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  GBookFragmentData__base_author__baseBuilder() {
    GBookFragmentData__base_author__base._initializeBuilder(this);
  }

  GBookFragmentData__base_author__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GBookFragmentData__base_author__base other) {
    _$v = other as _$GBookFragmentData__base_author__base;
  }

  @override
  void update(
      void Function(GBookFragmentData__base_author__baseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GBookFragmentData__base_author__base build() => _build();

  _$GBookFragmentData__base_author__base _build() {
    final _$result = _$v ??
        _$GBookFragmentData__base_author__base._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GBookFragmentData__base_author__base', 'G__typename'),
          displayName: BuiltValueNullFieldError.checkNotNull(displayName,
              r'GBookFragmentData__base_author__base', 'displayName'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GBookFragmentData__base_author__asPerson
    extends GBookFragmentData__base_author__asPerson {
  @override
  final String G__typename;
  @override
  final String displayName;
  @override
  final String firstName;
  @override
  final String lastName;

  factory _$GBookFragmentData__base_author__asPerson(
          [void Function(GBookFragmentData__base_author__asPersonBuilder)?
              updates]) =>
      (GBookFragmentData__base_author__asPersonBuilder()..update(updates))
          ._build();

  _$GBookFragmentData__base_author__asPerson._(
      {required this.G__typename,
      required this.displayName,
      required this.firstName,
      required this.lastName})
      : super._();
  @override
  GBookFragmentData__base_author__asPerson rebuild(
          void Function(GBookFragmentData__base_author__asPersonBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GBookFragmentData__base_author__asPersonBuilder toBuilder() =>
      GBookFragmentData__base_author__asPersonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GBookFragmentData__base_author__asPerson &&
        G__typename == other.G__typename &&
        displayName == other.displayName &&
        firstName == other.firstName &&
        lastName == other.lastName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GBookFragmentData__base_author__asPerson')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName)
          ..add('firstName', firstName)
          ..add('lastName', lastName))
        .toString();
  }
}

class GBookFragmentData__base_author__asPersonBuilder
    implements
        Builder<GBookFragmentData__base_author__asPerson,
            GBookFragmentData__base_author__asPersonBuilder> {
  _$GBookFragmentData__base_author__asPerson? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  GBookFragmentData__base_author__asPersonBuilder() {
    GBookFragmentData__base_author__asPerson._initializeBuilder(this);
  }

  GBookFragmentData__base_author__asPersonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GBookFragmentData__base_author__asPerson other) {
    _$v = other as _$GBookFragmentData__base_author__asPerson;
  }

  @override
  void update(
      void Function(GBookFragmentData__base_author__asPersonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GBookFragmentData__base_author__asPerson build() => _build();

  _$GBookFragmentData__base_author__asPerson _build() {
    final _$result = _$v ??
        _$GBookFragmentData__base_author__asPerson._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GBookFragmentData__base_author__asPerson', 'G__typename'),
          displayName: BuiltValueNullFieldError.checkNotNull(displayName,
              r'GBookFragmentData__base_author__asPerson', 'displayName'),
          firstName: BuiltValueNullFieldError.checkNotNull(firstName,
              r'GBookFragmentData__base_author__asPerson', 'firstName'),
          lastName: BuiltValueNullFieldError.checkNotNull(lastName,
              r'GBookFragmentData__base_author__asPerson', 'lastName'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GBookFragmentData__base_author__asCompany
    extends GBookFragmentData__base_author__asCompany {
  @override
  final String G__typename;
  @override
  final String displayName;
  @override
  final String name;

  factory _$GBookFragmentData__base_author__asCompany(
          [void Function(GBookFragmentData__base_author__asCompanyBuilder)?
              updates]) =>
      (GBookFragmentData__base_author__asCompanyBuilder()..update(updates))
          ._build();

  _$GBookFragmentData__base_author__asCompany._(
      {required this.G__typename,
      required this.displayName,
      required this.name})
      : super._();
  @override
  GBookFragmentData__base_author__asCompany rebuild(
          void Function(GBookFragmentData__base_author__asCompanyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GBookFragmentData__base_author__asCompanyBuilder toBuilder() =>
      GBookFragmentData__base_author__asCompanyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GBookFragmentData__base_author__asCompany &&
        G__typename == other.G__typename &&
        displayName == other.displayName &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GBookFragmentData__base_author__asCompany')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName)
          ..add('name', name))
        .toString();
  }
}

class GBookFragmentData__base_author__asCompanyBuilder
    implements
        Builder<GBookFragmentData__base_author__asCompany,
            GBookFragmentData__base_author__asCompanyBuilder> {
  _$GBookFragmentData__base_author__asCompany? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GBookFragmentData__base_author__asCompanyBuilder() {
    GBookFragmentData__base_author__asCompany._initializeBuilder(this);
  }

  GBookFragmentData__base_author__asCompanyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GBookFragmentData__base_author__asCompany other) {
    _$v = other as _$GBookFragmentData__base_author__asCompany;
  }

  @override
  void update(
      void Function(GBookFragmentData__base_author__asCompanyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GBookFragmentData__base_author__asCompany build() => _build();

  _$GBookFragmentData__base_author__asCompany _build() {
    final _$result = _$v ??
        _$GBookFragmentData__base_author__asCompany._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GBookFragmentData__base_author__asCompany', 'G__typename'),
          displayName: BuiltValueNullFieldError.checkNotNull(displayName,
              r'GBookFragmentData__base_author__asCompany', 'displayName'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'GBookFragmentData__base_author__asCompany', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GBookFragmentData__asTextbook extends GBookFragmentData__asTextbook {
  @override
  final String G__typename;
  @override
  final GBookFragmentData__asTextbook_author author;
  @override
  final String title;
  @override
  final BuiltList<String> courses;

  factory _$GBookFragmentData__asTextbook(
          [void Function(GBookFragmentData__asTextbookBuilder)? updates]) =>
      (GBookFragmentData__asTextbookBuilder()..update(updates))._build();

  _$GBookFragmentData__asTextbook._(
      {required this.G__typename,
      required this.author,
      required this.title,
      required this.courses})
      : super._();
  @override
  GBookFragmentData__asTextbook rebuild(
          void Function(GBookFragmentData__asTextbookBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GBookFragmentData__asTextbookBuilder toBuilder() =>
      GBookFragmentData__asTextbookBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GBookFragmentData__asTextbook &&
        G__typename == other.G__typename &&
        author == other.author &&
        title == other.title &&
        courses == other.courses;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, courses.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GBookFragmentData__asTextbook')
          ..add('G__typename', G__typename)
          ..add('author', author)
          ..add('title', title)
          ..add('courses', courses))
        .toString();
  }
}

class GBookFragmentData__asTextbookBuilder
    implements
        Builder<GBookFragmentData__asTextbook,
            GBookFragmentData__asTextbookBuilder> {
  _$GBookFragmentData__asTextbook? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GBookFragmentData__asTextbook_author? _author;
  GBookFragmentData__asTextbook_author? get author => _$this._author;
  set author(GBookFragmentData__asTextbook_author? author) =>
      _$this._author = author;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ListBuilder<String>? _courses;
  ListBuilder<String> get courses => _$this._courses ??= ListBuilder<String>();
  set courses(ListBuilder<String>? courses) => _$this._courses = courses;

  GBookFragmentData__asTextbookBuilder() {
    GBookFragmentData__asTextbook._initializeBuilder(this);
  }

  GBookFragmentData__asTextbookBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _author = $v.author;
      _title = $v.title;
      _courses = $v.courses.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GBookFragmentData__asTextbook other) {
    _$v = other as _$GBookFragmentData__asTextbook;
  }

  @override
  void update(void Function(GBookFragmentData__asTextbookBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GBookFragmentData__asTextbook build() => _build();

  _$GBookFragmentData__asTextbook _build() {
    _$GBookFragmentData__asTextbook _$result;
    try {
      _$result = _$v ??
          _$GBookFragmentData__asTextbook._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GBookFragmentData__asTextbook', 'G__typename'),
            author: BuiltValueNullFieldError.checkNotNull(
                author, r'GBookFragmentData__asTextbook', 'author'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GBookFragmentData__asTextbook', 'title'),
            courses: courses.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'courses';
        courses.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GBookFragmentData__asTextbook', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GBookFragmentData__asTextbook_author__base
    extends GBookFragmentData__asTextbook_author__base {
  @override
  final String G__typename;
  @override
  final String displayName;

  factory _$GBookFragmentData__asTextbook_author__base(
          [void Function(GBookFragmentData__asTextbook_author__baseBuilder)?
              updates]) =>
      (GBookFragmentData__asTextbook_author__baseBuilder()..update(updates))
          ._build();

  _$GBookFragmentData__asTextbook_author__base._(
      {required this.G__typename, required this.displayName})
      : super._();
  @override
  GBookFragmentData__asTextbook_author__base rebuild(
          void Function(GBookFragmentData__asTextbook_author__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GBookFragmentData__asTextbook_author__baseBuilder toBuilder() =>
      GBookFragmentData__asTextbook_author__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GBookFragmentData__asTextbook_author__base &&
        G__typename == other.G__typename &&
        displayName == other.displayName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GBookFragmentData__asTextbook_author__base')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName))
        .toString();
  }
}

class GBookFragmentData__asTextbook_author__baseBuilder
    implements
        Builder<GBookFragmentData__asTextbook_author__base,
            GBookFragmentData__asTextbook_author__baseBuilder> {
  _$GBookFragmentData__asTextbook_author__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  GBookFragmentData__asTextbook_author__baseBuilder() {
    GBookFragmentData__asTextbook_author__base._initializeBuilder(this);
  }

  GBookFragmentData__asTextbook_author__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GBookFragmentData__asTextbook_author__base other) {
    _$v = other as _$GBookFragmentData__asTextbook_author__base;
  }

  @override
  void update(
      void Function(GBookFragmentData__asTextbook_author__baseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GBookFragmentData__asTextbook_author__base build() => _build();

  _$GBookFragmentData__asTextbook_author__base _build() {
    final _$result = _$v ??
        _$GBookFragmentData__asTextbook_author__base._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GBookFragmentData__asTextbook_author__base', 'G__typename'),
          displayName: BuiltValueNullFieldError.checkNotNull(displayName,
              r'GBookFragmentData__asTextbook_author__base', 'displayName'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GBookFragmentData__asTextbook_author__asPerson
    extends GBookFragmentData__asTextbook_author__asPerson {
  @override
  final String G__typename;
  @override
  final String displayName;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final GBookFragment_author author;
  @override
  final String title;

  factory _$GBookFragmentData__asTextbook_author__asPerson(
          [void Function(GBookFragmentData__asTextbook_author__asPersonBuilder)?
              updates]) =>
      (GBookFragmentData__asTextbook_author__asPersonBuilder()..update(updates))
          ._build();

  _$GBookFragmentData__asTextbook_author__asPerson._(
      {required this.G__typename,
      required this.displayName,
      required this.firstName,
      required this.lastName,
      required this.author,
      required this.title})
      : super._();
  @override
  GBookFragmentData__asTextbook_author__asPerson rebuild(
          void Function(GBookFragmentData__asTextbook_author__asPersonBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GBookFragmentData__asTextbook_author__asPersonBuilder toBuilder() =>
      GBookFragmentData__asTextbook_author__asPersonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GBookFragmentData__asTextbook_author__asPerson &&
        G__typename == other.G__typename &&
        displayName == other.displayName &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        author == other.author &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GBookFragmentData__asTextbook_author__asPerson')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('author', author)
          ..add('title', title))
        .toString();
  }
}

class GBookFragmentData__asTextbook_author__asPersonBuilder
    implements
        Builder<GBookFragmentData__asTextbook_author__asPerson,
            GBookFragmentData__asTextbook_author__asPersonBuilder> {
  _$GBookFragmentData__asTextbook_author__asPerson? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  GBookFragment_author? _author;
  GBookFragment_author? get author => _$this._author;
  set author(GBookFragment_author? author) => _$this._author = author;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GBookFragmentData__asTextbook_author__asPersonBuilder() {
    GBookFragmentData__asTextbook_author__asPerson._initializeBuilder(this);
  }

  GBookFragmentData__asTextbook_author__asPersonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _author = $v.author;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GBookFragmentData__asTextbook_author__asPerson other) {
    _$v = other as _$GBookFragmentData__asTextbook_author__asPerson;
  }

  @override
  void update(
      void Function(GBookFragmentData__asTextbook_author__asPersonBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GBookFragmentData__asTextbook_author__asPerson build() => _build();

  _$GBookFragmentData__asTextbook_author__asPerson _build() {
    final _$result = _$v ??
        _$GBookFragmentData__asTextbook_author__asPerson._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GBookFragmentData__asTextbook_author__asPerson', 'G__typename'),
          displayName: BuiltValueNullFieldError.checkNotNull(displayName,
              r'GBookFragmentData__asTextbook_author__asPerson', 'displayName'),
          firstName: BuiltValueNullFieldError.checkNotNull(firstName,
              r'GBookFragmentData__asTextbook_author__asPerson', 'firstName'),
          lastName: BuiltValueNullFieldError.checkNotNull(lastName,
              r'GBookFragmentData__asTextbook_author__asPerson', 'lastName'),
          author: BuiltValueNullFieldError.checkNotNull(author,
              r'GBookFragmentData__asTextbook_author__asPerson', 'author'),
          title: BuiltValueNullFieldError.checkNotNull(title,
              r'GBookFragmentData__asTextbook_author__asPerson', 'title'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GBookFragmentData__asTextbook_author__asCompany
    extends GBookFragmentData__asTextbook_author__asCompany {
  @override
  final String G__typename;
  @override
  final String displayName;
  @override
  final String name;
  @override
  final GBookFragment_author author;
  @override
  final String title;

  factory _$GBookFragmentData__asTextbook_author__asCompany(
          [void Function(
                  GBookFragmentData__asTextbook_author__asCompanyBuilder)?
              updates]) =>
      (GBookFragmentData__asTextbook_author__asCompanyBuilder()
            ..update(updates))
          ._build();

  _$GBookFragmentData__asTextbook_author__asCompany._(
      {required this.G__typename,
      required this.displayName,
      required this.name,
      required this.author,
      required this.title})
      : super._();
  @override
  GBookFragmentData__asTextbook_author__asCompany rebuild(
          void Function(GBookFragmentData__asTextbook_author__asCompanyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GBookFragmentData__asTextbook_author__asCompanyBuilder toBuilder() =>
      GBookFragmentData__asTextbook_author__asCompanyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GBookFragmentData__asTextbook_author__asCompany &&
        G__typename == other.G__typename &&
        displayName == other.displayName &&
        name == other.name &&
        author == other.author &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GBookFragmentData__asTextbook_author__asCompany')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName)
          ..add('name', name)
          ..add('author', author)
          ..add('title', title))
        .toString();
  }
}

class GBookFragmentData__asTextbook_author__asCompanyBuilder
    implements
        Builder<GBookFragmentData__asTextbook_author__asCompany,
            GBookFragmentData__asTextbook_author__asCompanyBuilder> {
  _$GBookFragmentData__asTextbook_author__asCompany? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GBookFragment_author? _author;
  GBookFragment_author? get author => _$this._author;
  set author(GBookFragment_author? author) => _$this._author = author;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GBookFragmentData__asTextbook_author__asCompanyBuilder() {
    GBookFragmentData__asTextbook_author__asCompany._initializeBuilder(this);
  }

  GBookFragmentData__asTextbook_author__asCompanyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _name = $v.name;
      _author = $v.author;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GBookFragmentData__asTextbook_author__asCompany other) {
    _$v = other as _$GBookFragmentData__asTextbook_author__asCompany;
  }

  @override
  void update(
      void Function(GBookFragmentData__asTextbook_author__asCompanyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GBookFragmentData__asTextbook_author__asCompany build() => _build();

  _$GBookFragmentData__asTextbook_author__asCompany _build() {
    final _$result = _$v ??
        _$GBookFragmentData__asTextbook_author__asCompany._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GBookFragmentData__asTextbook_author__asCompany',
              'G__typename'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName,
              r'GBookFragmentData__asTextbook_author__asCompany',
              'displayName'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'GBookFragmentData__asTextbook_author__asCompany', 'name'),
          author: BuiltValueNullFieldError.checkNotNull(author,
              r'GBookFragmentData__asTextbook_author__asCompany', 'author'),
          title: BuiltValueNullFieldError.checkNotNull(title,
              r'GBookFragmentData__asTextbook_author__asCompany', 'title'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GBookFragmentData__asColoringBook
    extends GBookFragmentData__asColoringBook {
  @override
  final String G__typename;
  @override
  final GBookFragmentData__asColoringBook_author author;
  @override
  final String title;
  @override
  final BuiltList<String> colors;

  factory _$GBookFragmentData__asColoringBook(
          [void Function(GBookFragmentData__asColoringBookBuilder)? updates]) =>
      (GBookFragmentData__asColoringBookBuilder()..update(updates))._build();

  _$GBookFragmentData__asColoringBook._(
      {required this.G__typename,
      required this.author,
      required this.title,
      required this.colors})
      : super._();
  @override
  GBookFragmentData__asColoringBook rebuild(
          void Function(GBookFragmentData__asColoringBookBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GBookFragmentData__asColoringBookBuilder toBuilder() =>
      GBookFragmentData__asColoringBookBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GBookFragmentData__asColoringBook &&
        G__typename == other.G__typename &&
        author == other.author &&
        title == other.title &&
        colors == other.colors;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, colors.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GBookFragmentData__asColoringBook')
          ..add('G__typename', G__typename)
          ..add('author', author)
          ..add('title', title)
          ..add('colors', colors))
        .toString();
  }
}

class GBookFragmentData__asColoringBookBuilder
    implements
        Builder<GBookFragmentData__asColoringBook,
            GBookFragmentData__asColoringBookBuilder> {
  _$GBookFragmentData__asColoringBook? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GBookFragmentData__asColoringBook_author? _author;
  GBookFragmentData__asColoringBook_author? get author => _$this._author;
  set author(GBookFragmentData__asColoringBook_author? author) =>
      _$this._author = author;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ListBuilder<String>? _colors;
  ListBuilder<String> get colors => _$this._colors ??= ListBuilder<String>();
  set colors(ListBuilder<String>? colors) => _$this._colors = colors;

  GBookFragmentData__asColoringBookBuilder() {
    GBookFragmentData__asColoringBook._initializeBuilder(this);
  }

  GBookFragmentData__asColoringBookBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _author = $v.author;
      _title = $v.title;
      _colors = $v.colors.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GBookFragmentData__asColoringBook other) {
    _$v = other as _$GBookFragmentData__asColoringBook;
  }

  @override
  void update(
      void Function(GBookFragmentData__asColoringBookBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GBookFragmentData__asColoringBook build() => _build();

  _$GBookFragmentData__asColoringBook _build() {
    _$GBookFragmentData__asColoringBook _$result;
    try {
      _$result = _$v ??
          _$GBookFragmentData__asColoringBook._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GBookFragmentData__asColoringBook', 'G__typename'),
            author: BuiltValueNullFieldError.checkNotNull(
                author, r'GBookFragmentData__asColoringBook', 'author'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'GBookFragmentData__asColoringBook', 'title'),
            colors: colors.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'colors';
        colors.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GBookFragmentData__asColoringBook', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GBookFragmentData__asColoringBook_author__base
    extends GBookFragmentData__asColoringBook_author__base {
  @override
  final String G__typename;
  @override
  final String displayName;

  factory _$GBookFragmentData__asColoringBook_author__base(
          [void Function(GBookFragmentData__asColoringBook_author__baseBuilder)?
              updates]) =>
      (GBookFragmentData__asColoringBook_author__baseBuilder()..update(updates))
          ._build();

  _$GBookFragmentData__asColoringBook_author__base._(
      {required this.G__typename, required this.displayName})
      : super._();
  @override
  GBookFragmentData__asColoringBook_author__base rebuild(
          void Function(GBookFragmentData__asColoringBook_author__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GBookFragmentData__asColoringBook_author__baseBuilder toBuilder() =>
      GBookFragmentData__asColoringBook_author__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GBookFragmentData__asColoringBook_author__base &&
        G__typename == other.G__typename &&
        displayName == other.displayName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GBookFragmentData__asColoringBook_author__base')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName))
        .toString();
  }
}

class GBookFragmentData__asColoringBook_author__baseBuilder
    implements
        Builder<GBookFragmentData__asColoringBook_author__base,
            GBookFragmentData__asColoringBook_author__baseBuilder> {
  _$GBookFragmentData__asColoringBook_author__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  GBookFragmentData__asColoringBook_author__baseBuilder() {
    GBookFragmentData__asColoringBook_author__base._initializeBuilder(this);
  }

  GBookFragmentData__asColoringBook_author__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GBookFragmentData__asColoringBook_author__base other) {
    _$v = other as _$GBookFragmentData__asColoringBook_author__base;
  }

  @override
  void update(
      void Function(GBookFragmentData__asColoringBook_author__baseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GBookFragmentData__asColoringBook_author__base build() => _build();

  _$GBookFragmentData__asColoringBook_author__base _build() {
    final _$result = _$v ??
        _$GBookFragmentData__asColoringBook_author__base._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GBookFragmentData__asColoringBook_author__base', 'G__typename'),
          displayName: BuiltValueNullFieldError.checkNotNull(displayName,
              r'GBookFragmentData__asColoringBook_author__base', 'displayName'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GBookFragmentData__asColoringBook_author__asPerson
    extends GBookFragmentData__asColoringBook_author__asPerson {
  @override
  final String G__typename;
  @override
  final String displayName;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final GBookFragment_author author;
  @override
  final String title;

  factory _$GBookFragmentData__asColoringBook_author__asPerson(
          [void Function(
                  GBookFragmentData__asColoringBook_author__asPersonBuilder)?
              updates]) =>
      (GBookFragmentData__asColoringBook_author__asPersonBuilder()
            ..update(updates))
          ._build();

  _$GBookFragmentData__asColoringBook_author__asPerson._(
      {required this.G__typename,
      required this.displayName,
      required this.firstName,
      required this.lastName,
      required this.author,
      required this.title})
      : super._();
  @override
  GBookFragmentData__asColoringBook_author__asPerson rebuild(
          void Function(
                  GBookFragmentData__asColoringBook_author__asPersonBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GBookFragmentData__asColoringBook_author__asPersonBuilder toBuilder() =>
      GBookFragmentData__asColoringBook_author__asPersonBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GBookFragmentData__asColoringBook_author__asPerson &&
        G__typename == other.G__typename &&
        displayName == other.displayName &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        author == other.author &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GBookFragmentData__asColoringBook_author__asPerson')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('author', author)
          ..add('title', title))
        .toString();
  }
}

class GBookFragmentData__asColoringBook_author__asPersonBuilder
    implements
        Builder<GBookFragmentData__asColoringBook_author__asPerson,
            GBookFragmentData__asColoringBook_author__asPersonBuilder> {
  _$GBookFragmentData__asColoringBook_author__asPerson? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  GBookFragment_author? _author;
  GBookFragment_author? get author => _$this._author;
  set author(GBookFragment_author? author) => _$this._author = author;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GBookFragmentData__asColoringBook_author__asPersonBuilder() {
    GBookFragmentData__asColoringBook_author__asPerson._initializeBuilder(this);
  }

  GBookFragmentData__asColoringBook_author__asPersonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _author = $v.author;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GBookFragmentData__asColoringBook_author__asPerson other) {
    _$v = other as _$GBookFragmentData__asColoringBook_author__asPerson;
  }

  @override
  void update(
      void Function(GBookFragmentData__asColoringBook_author__asPersonBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GBookFragmentData__asColoringBook_author__asPerson build() => _build();

  _$GBookFragmentData__asColoringBook_author__asPerson _build() {
    final _$result = _$v ??
        _$GBookFragmentData__asColoringBook_author__asPerson._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GBookFragmentData__asColoringBook_author__asPerson',
              'G__typename'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName,
              r'GBookFragmentData__asColoringBook_author__asPerson',
              'displayName'),
          firstName: BuiltValueNullFieldError.checkNotNull(
              firstName,
              r'GBookFragmentData__asColoringBook_author__asPerson',
              'firstName'),
          lastName: BuiltValueNullFieldError.checkNotNull(
              lastName,
              r'GBookFragmentData__asColoringBook_author__asPerson',
              'lastName'),
          author: BuiltValueNullFieldError.checkNotNull(author,
              r'GBookFragmentData__asColoringBook_author__asPerson', 'author'),
          title: BuiltValueNullFieldError.checkNotNull(title,
              r'GBookFragmentData__asColoringBook_author__asPerson', 'title'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GBookFragmentData__asColoringBook_author__asCompany
    extends GBookFragmentData__asColoringBook_author__asCompany {
  @override
  final String G__typename;
  @override
  final String displayName;
  @override
  final String name;
  @override
  final GBookFragment_author author;
  @override
  final String title;

  factory _$GBookFragmentData__asColoringBook_author__asCompany(
          [void Function(
                  GBookFragmentData__asColoringBook_author__asCompanyBuilder)?
              updates]) =>
      (GBookFragmentData__asColoringBook_author__asCompanyBuilder()
            ..update(updates))
          ._build();

  _$GBookFragmentData__asColoringBook_author__asCompany._(
      {required this.G__typename,
      required this.displayName,
      required this.name,
      required this.author,
      required this.title})
      : super._();
  @override
  GBookFragmentData__asColoringBook_author__asCompany rebuild(
          void Function(
                  GBookFragmentData__asColoringBook_author__asCompanyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GBookFragmentData__asColoringBook_author__asCompanyBuilder toBuilder() =>
      GBookFragmentData__asColoringBook_author__asCompanyBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GBookFragmentData__asColoringBook_author__asCompany &&
        G__typename == other.G__typename &&
        displayName == other.displayName &&
        name == other.name &&
        author == other.author &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GBookFragmentData__asColoringBook_author__asCompany')
          ..add('G__typename', G__typename)
          ..add('displayName', displayName)
          ..add('name', name)
          ..add('author', author)
          ..add('title', title))
        .toString();
  }
}

class GBookFragmentData__asColoringBook_author__asCompanyBuilder
    implements
        Builder<GBookFragmentData__asColoringBook_author__asCompany,
            GBookFragmentData__asColoringBook_author__asCompanyBuilder> {
  _$GBookFragmentData__asColoringBook_author__asCompany? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GBookFragment_author? _author;
  GBookFragment_author? get author => _$this._author;
  set author(GBookFragment_author? author) => _$this._author = author;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  GBookFragmentData__asColoringBook_author__asCompanyBuilder() {
    GBookFragmentData__asColoringBook_author__asCompany._initializeBuilder(
        this);
  }

  GBookFragmentData__asColoringBook_author__asCompanyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _displayName = $v.displayName;
      _name = $v.name;
      _author = $v.author;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GBookFragmentData__asColoringBook_author__asCompany other) {
    _$v = other as _$GBookFragmentData__asColoringBook_author__asCompany;
  }

  @override
  void update(
      void Function(GBookFragmentData__asColoringBook_author__asCompanyBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GBookFragmentData__asColoringBook_author__asCompany build() => _build();

  _$GBookFragmentData__asColoringBook_author__asCompany _build() {
    final _$result = _$v ??
        _$GBookFragmentData__asColoringBook_author__asCompany._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GBookFragmentData__asColoringBook_author__asCompany',
              'G__typename'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName,
              r'GBookFragmentData__asColoringBook_author__asCompany',
              'displayName'),
          name: BuiltValueNullFieldError.checkNotNull(name,
              r'GBookFragmentData__asColoringBook_author__asCompany', 'name'),
          author: BuiltValueNullFieldError.checkNotNull(author,
              r'GBookFragmentData__asColoringBook_author__asCompany', 'author'),
          title: BuiltValueNullFieldError.checkNotNull(title,
              r'GBookFragmentData__asColoringBook_author__asCompany', 'title'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
