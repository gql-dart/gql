import "package:collection/collection.dart";
import "package:meta/meta.dart";

typedef ContextUpdater<T> = T Function(T entry);

/// Entry in the [Context].
///
/// Any class extending [ContextEntry] may be added to the [Context].
///
/// Context entries are a subject to [Request] and [Response] equality comparisons.
/// Only the values returned by [fieldsForEquality] will be treated as significant.
@immutable
abstract class ContextEntry {
  const ContextEntry();

  /// List of values to be used for equality.
  List<Object> get fieldsForEquality;

  @override
  bool operator ==(Object o) =>
      identical(this, o) ||
      (o.runtimeType == runtimeType &&
          const ListEquality<Object>(
            DeepCollectionEquality(),
          ).equals(
            (o as ContextEntry).fieldsForEquality,
            fieldsForEquality,
          ));

  @override
  int get hashCode => const ListEquality<Object>(
        DeepCollectionEquality(),
      ).hash(
        fieldsForEquality,
      );
}

/// A [Context] to be passed along with a [Request].
///
/// This implementation relies on [Object.runtimeType].
/// Context entries appear only once per type.
@immutable
class Context {
  final Map<Type, ContextEntry> _context;

  /// Create an empty context.
  ///
  /// Entries may be added later using [withEntry].
  const Context() : _context = const <Type, ContextEntry>{};

  const Context._fromMap(Map<Type, ContextEntry> context)
      : _context = context,
        assert(context != null);

  /// Creates a context from initial values represented as a map
  ///
  /// Every values runtime [Type] must be exactly the [Type] defined by the key.
  factory Context.fromMap(Map<Type, ContextEntry> context) {
    assert(
      context.entries.every(
        (entry) => entry.value == null || entry.value.runtimeType == entry.key,
      ),
      "Every values runtime type must be exactly the key",
    );

    return Context._fromMap(context);
  }

  /// Creates a context from a list of [entries].
  ///
  /// If more then one entry per type is provided, the last one is used.
  Context.fromList(List<ContextEntry> entries)
      : assert(entries != null),
        _context = entries.fold(
          <Type, ContextEntry>{},
          (ctx, e) => <Type, ContextEntry>{
            ...ctx,
            e.runtimeType: e,
          },
        );

  /// Create a [Context] with [entry] added to the existing entries.
  Context withEntry<T extends ContextEntry>(T entry) {
    if (entry != null && T != entry.runtimeType) {
      throw ArgumentError.value(
        entry,
        "entry",
        "must be exactly of type '${T}'",
      );
    }

    return Context.fromMap(
      <Type, ContextEntry>{
        ..._context,
        T: entry,
      },
    );
  }

  /// Create a [Context] by updating entry of type [T]
  Context updateEntry<T extends ContextEntry>(
    ContextUpdater<T> update,
  ) =>
      withEntry<T>(
        update(
          entry<T>(),
        ),
      );

  /// Retrieves an entry from [Context] by type [T].
  ///
  /// If entry is not present in the [Context],
  /// the [defaultValue] is returned.
  ///
  /// If provided, [defaultValue] must exactly match the return type [T].
  T entry<T extends ContextEntry>([T defaultValue]) {
    if (defaultValue != null && T != defaultValue.runtimeType) {
      throw ArgumentError.value(
        defaultValue,
        "defaultValue",
        "does not match the expected return type '${T}'",
      );
    }
    return _context.containsKey(T) ? _context[T] as T : defaultValue;
  }

  List<Object> _getChildren() => [
        _context,
      ];

  @override
  bool operator ==(Object o) =>
      identical(this, o) ||
      (o is Context &&
          const ListEquality<Object>(
            DeepCollectionEquality(),
          ).equals(
            o._getChildren(),
            _getChildren(),
          ));

  @override
  int get hashCode => const ListEquality<Object>(
        DeepCollectionEquality(),
      ).hash(
        _getChildren(),
      );
}
