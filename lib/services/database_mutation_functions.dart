import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/utils/queries.dart';

class DataBaseMutationFunctions {
  late GraphQLClient clientNonAuth;
  late GraphQLClient clientAuth;
  late Queries _query;
  init() {
    clientNonAuth = graphqlConfig.clientToQuery();
    clientAuth = graphqlConfig.authClient();
    _query = Queries();
  }

  GraphQLError userNotFound = const GraphQLError(message: 'User not found');
  GraphQLError userNotAuthenticated =
      const GraphQLError(message: 'User is not authenticated');
  GraphQLError emailAccountPresent =
      const GraphQLError(message: 'Email address already exists');
  GraphQLError wrongCredentials =
      const GraphQLError(message: 'Invalid credentials');
  GraphQLError organizationNotFound =
      const GraphQLError(message: 'Organization not found');
  GraphQLError refreshAccessTokenExpiredException = const GraphQLError(
      message:
          'Access Token has expired. Please refresh session.: Undefined location');
  GraphQLError memberRequestExist =
      const GraphQLError(message: 'Membership Request already exists');

  bool? encounteredExceptionOrError(OperationException exception,
      {bool showSnackBar = true}) {
    if (exception.linkException != null) {
      debugPrint(exception.linkException.toString());
      if (showSnackBar) {
        navigationService.showSnackBar("Server not running/wrong url");
      }
      return false;
    } else {
      debugPrint(exception.graphqlErrors.toString());
      for (int i = 0; i < exception.graphqlErrors.length; i++) {
        if (exception.graphqlErrors[i].message ==
            refreshAccessTokenExpiredException.message) {
          print('token refreshed');
          refreshAccessToken(userConfig.currentUser.refreshToken!).then(
              (value) => graphqlConfig
                  .getToken()
                  .then((value) => databaseFunctions.init()));
          print('client refreshed');
          return true;
        } else if (exception.graphqlErrors[i].message ==
            userNotAuthenticated.message) {
          print('client refreshed');
          refreshAccessToken(userConfig.currentUser.refreshToken!).then(
              (value) => graphqlConfig
                  .getToken()
                  .then((value) => databaseFunctions.init()));
          //  graphqlConfig.getToken().then((value) => databaseFunctions.init());
          return true;
        } else if (exception.graphqlErrors[i].message == userNotFound.message) {
          if (showSnackBar) {
            navigationService
                .showSnackBar("No account registered with this email");
          }
          return false;
        } else if (exception.graphqlErrors[i].message ==
            memberRequestExist.message) {
          if (showSnackBar) {
            navigationService.showSnackBar("Membership request already exist");
          }
          return false;
        } else if (exception.graphqlErrors[i].message ==
            wrongCredentials.message) {
          if (showSnackBar) {
            navigationService.showSnackBar("Enter a valid password");
          }
          return false;
        } else if (exception.graphqlErrors[i].message ==
            organizationNotFound.message) {
          if (showSnackBar) {
            navigationService.showSnackBar("Organization Not Found");
          }
          return false;
        } else if (exception.graphqlErrors[i].message ==
            emailAccountPresent.message) {
          if (showSnackBar) {
            navigationService
                .showSnackBar("Account with this email already registered");
          }
          return false;
        }
      }
      navigationService.showSnackBar("Something went wrong");
      return false;
    }
  }

  Future<dynamic> gqlAuthQuery(String query) async {
    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: <String, dynamic>{},
    );
    final QueryResult result = await clientAuth.query(options);
    if (result.hasException) {
      final bool? exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        gqlAuthQuery(query);
      }
    } else if (result.data != null && result.isConcrete) {
      return result;
    }
    return null;
  }

  Future<dynamic> gqlAuthMutation(String mutation,
      {Map<String, dynamic>? variables}) async {
    final QueryResult result = await clientAuth.mutate(MutationOptions(
      document: gql(mutation),
      variables: variables ?? <String, dynamic>{},
    ));
    if (result.hasException) {
      final bool? exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        gqlAuthMutation(mutation, variables: variables);
      }
    } else if (result.data != null && result.isConcrete) {
      return result;
    }
    return null;
  }

  Future<dynamic> gqlNonAuthMutation(String mutation,
      {Map<String, dynamic>? variables, bool reCall = true}) async {
    final QueryResult result = await clientNonAuth.mutate(MutationOptions(
        document: gql(mutation), variables: variables ?? <String, dynamic>{}));

    if (result.hasException) {
      final bool? exception = encounteredExceptionOrError(result.exception!);
      if (exception! && reCall) {
        gqlNonAuthMutation(mutation, variables: variables);
      }
    } else if (result.data != null && result.isConcrete) {
      return result;
    }
    return null;
  }

  Future<bool> refreshAccessToken(String refreshToken) async {
    final QueryResult result = await clientNonAuth.mutate(MutationOptions(
      document: gql(
        _query.refreshToken(refreshToken),
      ),
    ));

    if (result.hasException) {
      final bool? exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        refreshAccessToken(refreshToken);
      } else {
        navigationService.pop();
      }
    } else if (result.data != null && result.isConcrete) {
      userConfig.updateAccessToken(
          refreshToken: result.data!['refreshToken']['refreshToken'].toString(),
          accessToken: result.data!['refreshToken']['accessToken'].toString());
      databaseFunctions.init();
      return true;
    }
    return false;
  }

  Future<dynamic> fetchOrgById(String id) async {
    final QueryResult result = await clientNonAuth
        .mutate(MutationOptions(document: gql(_query.fetchOrgById(id))));
    if (result.hasException) {
      final bool? exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        fetchOrgById(id);
      }
    } else if (result.data != null && result.isConcrete) {
      return OrgInfo.fromJson(
          result.data!['organizations'][0] as Map<String, dynamic>);
    }
    return false;
  }
}
