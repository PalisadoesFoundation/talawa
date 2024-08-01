import 'package:graphql_flutter/graphql_flutter.dart';

/// Exception thrown for critical actions that require special handling.
///
/// Extends [OperationException] to integrate with GraphQL error handling.
class CriticalActionException extends OperationException {
  /// Constructor for [CriticalActionException].
  ///
  /// Takes a [actionError] message that describes the specific error encountered.
  CriticalActionException(this.actionError);

  /// The error message associated with this critical action.
  String actionError;

  @override
  String toString() => 'CriticalActionException: $actionError';
}
