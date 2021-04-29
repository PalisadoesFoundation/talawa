import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/exception_type.dart';
import 'package:talawa/utils/globals.dart';

ExceptionType retrieveExceptionType(QueryResult result) {
  if (result.exception.toString().substring(16) == accessTokenException) {
    return ExceptionType.accesstokenException;
  }

  return ExceptionType.notDefined;
}
