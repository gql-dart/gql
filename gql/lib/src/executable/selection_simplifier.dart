/// Simplifies operation selection set structures into more easily/logically traversable forms.
///
/// GraphQL Selection Sets can get fairly complicated, and resolve into structures that don't coorespond to the declaration graph.
///
/// For example, subfields are merged across same-named fields:
/// ```graphql
/// fragment withOrbitals on PlanetsConnection {
///   planets {
///     orbitalPeriod
///   }
/// }
///
/// {
///  allPlanets {
///     planets {
///       id
///     }
///     planets {
///       name
///     }
///     ...withOrbitals
///   }
/// }
///
/// # results in the same structure as
/// {
///   allPlanets {
///     planets {
///       id
///       name
///       orbitalPeriod
///     }
///   }
/// }
/// ```
///
/// This module simplifies the former above into the latter to the best of it's ability,
/// Making certain use-cases (like code generation) easier to implement.
///
/// NOTE: mutually recursive fragment spreads aren't valid in graphql
/// TODO: this is kinda a sloppy mess. The entire path mechanic seems unnecessary
import 'package:built_collection/built_collection.dart';
import './definitions.dart' as d;

export './definitions.dart' hide SelectionSet, InlineFragment, Field;

abstract class Simplified {
  /// There should be a path to this field for every fragment it's defined within,
  /// So that we can find corresponding models in the builder
  Set<BuiltList<String>> get fragmentPaths;

  BuiltList<String> get path;
}

abstract class SimplifiedSelection implements Simplified, d.Selection {}

Set<BuiltList<String>> _mergeFragmentPaths<S>([
  S maybeSimple,
  Set<BuiltList<String>> fragmentPaths,
]) =>
    {
      if (maybeSimple != null && maybeSimple is SimplifiedSelection)
        ...maybeSimple.fragmentPaths,
      if (fragmentPaths != null) ...fragmentPaths
    };

Set<BuiltList<String>> _descendIntoFragments([
  Set<BuiltList<String>> fragmentPaths,
  String selectionName,
]) =>
    (fragmentPaths == null)
        ? null
        : fragmentPaths.map((f) => f.append(selectionName)).toSet();

class Field extends d.Field with SimplifiedSelection {
  Field(
    d.Field field,
    this.selectionSet,
    this._path, [
    Set<BuiltList<String>> fragmentPaths,
  ])  : fragmentPaths = _mergeFragmentPaths(field, fragmentPaths),
        super(
          field.astNode,
          field.schemaType,
          field.getType,
        );

  Field mergedWith(Field other) => Field(
        this,
        selectionSet?.mergedWith(other.selectionSet) ?? other.selectionSet,
        _path,
        other.fragmentPaths,
      );

  final BuiltList<String> _path;

  @override
  BuiltList<String> get path => _path.append(alias);

  @override
  final SelectionSet selectionSet;

  @override
  final Set<BuiltList<String>> fragmentPaths;
}

class InlineFragment extends d.InlineFragment with SimplifiedSelection {
  InlineFragment(
    d.InlineFragment inlineFragment,
    this.selectionSet,
    this._path, [
    Set<BuiltList<String>> fragmentPaths,
  ])  : fragmentPaths = _mergeFragmentPaths(inlineFragment, fragmentPaths),
        super(
          inlineFragment.astNode,
          inlineFragment.schemaType,
          inlineFragment.getType,
        );

  InlineFragment mergedWith(InlineFragment other) => InlineFragment(
        this,
        selectionSet?.mergedWith(other.selectionSet) ?? other.selectionSet,
        _path,
        other.fragmentPaths,
      );

  @override
  final SelectionSet selectionSet;

  final BuiltList<String> _path;

  @override
  BuiltList<String> get path => _path.append(alias);

  @override
  final Set<BuiltList<String>> fragmentPaths;
}

/// A composit selectionset that represents the merger of all selection sets defined at the same path
class SelectionSet extends d.SelectionSet with Simplified {
  SelectionSet._(
    this.selectionSets,
    this.selections,
    this.path,
    this.fragmentPaths,
  ) : super(
          selectionSets.first.astNode,
          selectionSets.first.schemaType,
          selectionSets.first.getType,
        );

  factory SelectionSet(
    Iterable<d.SelectionSet> selectionSets,
    BuiltList<String> path,
    Set<BuiltList<String>> fragmentPaths,
  ) {
    // flatten other simplified selection sets
    final _selectionSets = selectionSets.expand<d.SelectionSet>(
      (ss) {
        if (ss == null) {
          return [];
        }
        if (ss is SelectionSet) {
          return ss.selectionSets;
        }
        return [ss];
      },
    ).toList();
    if (_selectionSets.isEmpty) {
      return null;
    }

    final selections = <String, d.Selection>{};
    for (final selection
        in _flattened(_selectionSets, path, fragmentPaths ?? {})) {
      if (selections.containsKey(selection.alias)) {
        if (selection is Field) {
          final existing = selections[selection.alias] as Field;
          selections[selection.alias] = existing.mergedWith(selection);
        }
        if (selection is InlineFragment) {
          final existing = selections[selection.alias] as InlineFragment;
          selections[selection.alias] = existing.mergedWith(selection);
        }
      }
      selections[selection.alias] = selection;
    }

    return SelectionSet._(
      _selectionSets,
      selections.values.toList(),
      path,
      fragmentPaths ?? {},
    );
  }

  SelectionSet mergedWith(SelectionSet other) => other == null
      ? this
      : SelectionSet(
          [this, other],
          path,
          fragmentPaths.union(other.fragmentPaths ?? {}),
        );

  final List<d.SelectionSet> selectionSets;

  @override
  final BuiltList<String> path;

  @override
  final List<d.Selection> selections;

  @override
  List<Field> get fields => selections.whereType<Field>().toList();

  @override
  List<InlineFragment> get inlineFragments =>
      selections.whereType<InlineFragment>().toList();

  /// Preserve fragmentSpreads so as to not lose useful info
  @override
  List<d.FragmentSpread> get fragmentSpreads {
    final spreadNames = <String>{};
    return selectionSets
        .expand((s) => s.fragmentSpreads)
        .where((spread) => spreadNames.add(spread.name))
        .toList();
  }

  @override
  final Set<BuiltList<String>> fragmentPaths;
}

Iterable<d.Selection> _flattened(
  Iterable<d.SelectionSet> selectionSets,
  BuiltList<String> path,
  Set<BuiltList<String>> fragmentPaths,
) =>
    selectionSets.expand(
      (ss) => ss.selections.expand(
        (selection) => _simplifySelectionFirstPass(
          selection,
          path,
          fragmentPaths,
        ),
      ),
    );

// TODO wrote this when I thought tracking paths would be important,
// but really flattening/merging is not as complicated as I was thinking
/// Flatten any fragment spreads into simplified fields, and add paths to fields
Iterable<d.Selection> _simplifySelectionFirstPass(
  d.Selection selection,
  BuiltList<String> path, [
  Set<BuiltList<String>> fragmentPaths,
]) {
  if (selection == null) {
    throw ArgumentError('Received null selection in $path!');
  }
  final fps = _descendIntoFragments(fragmentPaths, selection.alias);
  if (selection is d.InlineFragment) {
    return [
      InlineFragment(
        selection,
        selection.selectionSet != null
            ? SelectionSet(
                [selection.selectionSet], path.append(selection.alias), fps)
            : null,
        path,
        fps,
      )
    ];
  }
  if (selection is d.Field) {
    return [
      Field(
        selection,
        selection.selectionSet != null
            ? SelectionSet(
                [selection.selectionSet], path.append(selection.alias), fps)
            : null,
        path,
        fps,
      )
    ];
  }
  if (selection is d.FragmentSpread) {
    return selection.fragment.selectionSet.selections.expand((s) {
      return _simplifySelectionFirstPass(s, path, {
        ...fragmentPaths,
        [selection.fragment.name].toBuiltList()
      });
    });
  }

  throw StateError(
    'cannot simplify selection ${selection.runtimeType} $selection',
  );
}

extension Append<T> on BuiltList<T> {
  BuiltList<T> append(T other) => followedBy([other]).toBuiltList();
}

extension GetSimplified on d.SelectionSet {
  SelectionSet simplified(String root) =>
      SelectionSet([this], <String>[root].toBuiltList(), {});
}
