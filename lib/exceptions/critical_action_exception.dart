import 'package:graphql_flutter/graphql_flutter.dart';

class CriticalActionException extends OperationException {
  String actionError;

  CriticalActionException(this.actionError);

  @override
  String toString() => 'CriticalActionException: $actionError';
}