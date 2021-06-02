import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/models/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/widgets/progress_dialog.dart';
import 'package:talawa/locator.dart';

class DataBaseMutationFunctions {
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
      locator<NavigationService>().showSnackBar("Server not running/wrong url");
      return false;
    } else {
      print(exception.graphqlErrors);
      for (int i = 0; i < exception.graphqlErrors.length; i++) {
        if (exception.graphqlErrors[i].message == emailAccountPresent.message) {
          locator<NavigationService>()
              .showSnackBar("Account with this email already registered");
          return false;
        } else if (exception.graphqlErrors[i].message == userNotFound.message) {
          locator<NavigationService>()
              .showSnackBar("No account registered with this email");
          return false;
        } else if (exception.graphqlErrors[i].message ==
            refreshAccessTokenExpiredException.message) {
          print(exception.graphqlErrors);
          return true;
        }
      }
      locator<NavigationService>().showSnackBar("Something went wrong");
      return false;
    }
  }

  Future login(String email, String password) async {
    locator<NavigationService>()
        .pushDialog(const ProgressDialog(key: Key('LoginProgress')));

    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink('https://talawa-graphql-api.herokuapp.com/graphql'),
    );
    //  locator<GraphqlConfig>().clientToQuery();
    final Queries _query = Queries();

    final QueryResult result = await client.mutate(
        MutationOptions(document: gql(_query.loginUser(email, password))));
    if (result.hasException) {
      final bool? exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        login(email, password);
      } else {
        locator<NavigationService>().pop();
      }
    } else if (result.data != null && result.isConcrete) {
      locator<NavigationService>().pop();
      final User loggedInUser = User.fromJson(result.data!, 'login');
      loggedInUser.print();
      locator<NavigationService>().removeAllAndPush('/mainScreen', '/');
    }
  }

  Future signup(
      String firstName, String lastName, String email, String password) async {
    locator<NavigationService>()
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
        locator<NavigationService>().pop();
      }
    } else if (result.data != null && result.isConcrete) {
      locator<NavigationService>().pop();
      print(result.data);
      final User loggedInUser = User.fromJson(result.data!, 'signUp');
      loggedInUser.print();
      locator<NavigationService>().removeAllAndPush('/waiting', '/');
    }
  }
}
