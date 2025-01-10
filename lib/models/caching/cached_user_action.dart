import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';

part 'cached_user_action.g.dart';

/// CachedUserAction class represents a user action that is cached for offline use.
///
/// This class provides the following functionalities:
/// * `toJson` : converts a CachedUserAction to a JSON-compatible map.
/// * `fromJson` : creates a CachedUserAction from a JSON-compatible map.
/// * `execute` : executes the cached user action based on its operation type.
@HiveType(typeId: 3)
class CachedUserAction extends HiveObject {
  CachedUserAction({
    required this.id,
    required this.operation,
    this.variables,
    required this.timeStamp,
    required this.status,
    this.metaData,
    required this.operationType,
    required this.expiry,
  });

  /// Creates a CachedUserAction from a JSON-compatible map.
  ///
  /// **params**:
  /// * `json` : a map representing the CachedUserAction.
  ///
  /// **returns**:
  /// * `CachedUserAction` : a new instance of CachedUserAction.
  factory CachedUserAction.fromJson(Map<String, dynamic> json) {
    return CachedUserAction(
      id: json['id'] as String,
      operation: json['operation'] as String,
      variables: json['variables'] as Map<String, dynamic>?,
      timeStamp: DateTime.parse(json['timeStamp'] as String),
      status: json['status'] as CachedUserActionStatus,
      expiry: DateTime.parse(json['expiry'] as String),
      metaData: json['metaData'] as Map<String, dynamic>?,
      operationType: json['operationType'] as CachedOperationType,
    );
  }

  /// Converts a CachedUserAction to a JSON-compatible map.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Map<String, dynamic>`: a map representing the CachedUserAction.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'operation': operation,
      'variables': variables,
      'timeStamp': timeStamp.toIso8601String(),
      'status': status,
      'metaData': metaData,
      'operationType': operationType,
      'expiry': expiry.toIso8601String(),
    };
  }

  @override
  String toString() {
    return '''
      CachedUserAction(
        id: $id,
        operation: $operation,
        variables: $variables,
        timeStamp: $timeStamp,
        expiry: $expiry,
        status: $status,
        metaData: $metaData,
        operationType: $operationType,
      )
    ''';
  }

  /// Executes the cached user action based on its operation type.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<QueryResult<Object?>>`: result.
  Future<QueryResult<Object?>> execute() async {
    switch (operationType) {
      case CachedOperationType.gqlAuthQuery:
        return await databaseFunctions.gqlAuthQuery(
          operation,
          variables: this.variables,
        );
      case CachedOperationType.gqlAuthMutation:
        return await databaseFunctions.gqlAuthMutation(
          operation,
          variables: this.variables,
        );
      case CachedOperationType.gqlNonAuthQuery:
        return await databaseFunctions.gqlNonAuthQuery(
          operation,
          variables: this.variables,
        );
      case CachedOperationType.gqlNonAuthMutation:
        return await databaseFunctions.gqlNonAuthMutation(
          operation,
          variables: this.variables,
        );
      default:
        return databaseFunctions.noData;
    }
  }

  /// The unique identifier for the cached user action.
  @HiveField(0)
  String id;

  /// The operation to be performed for the cached user action.
  @HiveField(1)
  String operation;

  /// The variables required for the operation, if any.
  @HiveField(2)
  Map<String, dynamic>? variables;

  /// The timestamp when the action was cached.
  @HiveField(3)
  DateTime timeStamp;

  /// The status of the cached user action.
  @HiveField(4)
  CachedUserActionStatus status;

  /// Any additional metadata related to the cached user action.
  @HiveField(5)
  Map<String, dynamic>? metaData;

  /// The type of operation for the cached user action.
  @HiveField(6)
  CachedOperationType operationType;

  /// The expiry date and time for the cached user action.
  @HiveField(7)
  DateTime expiry;
}
