import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/models/user/user_model.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/snackbar_service.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/widgets/progress_dialog.dart';
import 'package:talawa/locator.dart';

class DataBaseMutationFunctions {
  //Services
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackBarService>();
  final _graphqlConfigService = locator<GraphqlConfigService>();

  GraphQLError emailAccountPresent =
      const GraphQLError(message: 'Email address already exists');
  GraphQLError userNotFound = const GraphQLError(message: 'User not found');
  GraphQLError userNotAuthenticated = const GraphQLError(
      message: 'User is not authenticated: Undefined location');
  GraphQLError refreshAccessTokenExpiredException = const GraphQLError(
      message:
          'Access Token has expired. Please refresh session.: Undefined location');

  bool? encounteredExceptionOrError(OperationException exception) {
    if (exception.linkException != null) {
      print(exception.linkException!.originalException.toString());
      _snackbarService.showSnackBar("Server not running/wrong url");
      return false;
    } else {
      print(exception.graphqlErrors);
      for (int i = 0; i < exception.graphqlErrors.length; i++) {
        if (exception.graphqlErrors[i].message == emailAccountPresent.message) {
          _snackbarService
              .showSnackBar("Account with this email already registered");
          return false;
        } else if (exception.graphqlErrors[i].message == userNotFound.message) {
          _snackbarService
              .showSnackBar("No account registered with this email");
          return false;
        } else if (exception.graphqlErrors[i].message ==
            refreshAccessTokenExpiredException.message) {
          print(exception.graphqlErrors);
          return true;
        }
      }
      _snackbarService.showSnackBar("Something went wrong");
      return false;
    }
  }

  Future login(String email, String password) async {
    _navigationService
        .pushDialog(const ProgressDialog(key: Key('LoginProgress')));

    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink('https://talawa-graphql-api.herokuapp.com/graphql'),
    );

    final GraphQLClient _client = _graphqlConfigService.clientToQuery();
    //  locator<GraphqlConfig>().clientToQuery();
    final Queries _query = Queries();

    final QueryResult result = await _client.mutate(
        MutationOptions(document: gql(_query.loginUser(email, password))));
    if (result.hasException) {
      final bool? exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        login(email, password);
      } else {
        _navigationService.pop();
      }
    } else if (result.data != null && result.isConcrete) {
      _navigationService.pop();

      Map<String, dynamic> userJson =
          result.data!["login"]["user"] as Map<String, dynamic>;

      final User loggedInUser = User.fromJson(userJson);
      _navigationService.removeAllAndPush('/mainScreen', '/');
    }
  }

  Future signup(
      String firstName, String lastName, String email, String password) async {
    _navigationService
        .pushDialog(const ProgressDialog(key: Key('LoginProgress')));
    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink('https://talawa-graphql-api.herokuapp.com/graphql'),
    );
    //  locator<GraphqlConfig>().clientToQuery();
    final Queries _query = Queries();
    final QueryResult result = await client.mutate(MutationOptions(
        document:
            gql(_query.registerUser(firstName, lastName, email, password))));
    if (result.hasException) {
      final bool? exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        login(email, password);
      } else {
        _navigationService.pop();
      }
    } else if (result.data != null && result.isConcrete) {
      _navigationService.pop();
      print(result.data);
      final User loggedInUser = User.fromJson(result.data!);
      print(loggedInUser.firstName);
      // loggedInUser.print();
      _navigationService.removeAllAndPush('/waiting', '/');
    }
  }
}
