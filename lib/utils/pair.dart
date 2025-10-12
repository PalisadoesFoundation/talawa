import 'package:flutter/foundation.dart';

/// A simple pair class to hold two values of potentially different types.
@immutable
class Pair<T, U> {
  /// Creates a new pair with the given values.
  const Pair(this.first, this.second);

  /// The first value in the pair.
  final T first;

  /// The second value in the pair.
  final U second;

  @override
  String toString() => '($first, $second)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pair &&
          runtimeType == other.runtimeType &&
          first == other.first &&
          second == other.second;

  @override
  int get hashCode => Object.hash(first, second);
}
