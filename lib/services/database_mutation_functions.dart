import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/models/org_info.dart';
import 'package:talawa/models/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/widgets/progress_dialog.dart';
import 'package:talawa/locator.dart';
import 'graphql_config.dart';

class DataBaseMutationFunctions {
  final Queries _query = Queries();
  final GraphQLClient clientNonAuth = locator<GraphqlConfig>().clientToQuery();
  final GraphQLClient clientAuth = locator<GraphqlConfig>().authClient();

  GraphQLError emailAccountPresent =
      const GraphQLError(message: 'Email address already exists');
  GraphQLError userNotFound = const GraphQLError(message: 'User not found');
  GraphQLError userNotAuthenticated = const GraphQLError(
      message: 'User is not authenticated: Undefined location');
  GraphQLError refreshAccessTokenExpiredException = const GraphQLError(
      message:
          'Access Token has expired. Please refresh session.: Undefined location');

  bool? encounteredExceptionOrError(OperationException exception,
      {bool showPopUps = true}) {
    if (exception.linkException != null) {
      print(exception.linkException);
      if (showPopUps) {
        locator<NavigationService>()
            .showSnackBar("Server not running/wrong url");
      }
      return false;
    } else {
      print(exception.graphqlErrors);
      for (int i = 0; i < exception.graphqlErrors.length; i++) {
        if (exception.graphqlErrors[i].message == emailAccountPresent.message) {
          if (showPopUps) {
            locator<NavigationService>()
                .showSnackBar("Account with this email already registered");
          }
          return false;
        } else if (exception.graphqlErrors[i].message == userNotFound.message) {
          if (showPopUps) {
            locator<NavigationService>()
                .showSnackBar("No account registered with this email");
          }
          return false;
        } else if (exception.graphqlErrors[i].message ==
            refreshAccessTokenExpiredException.message) {
          //print(exception.graphqlErrors);
          return true;
        }
      }
      locator<NavigationService>().showSnackBar("Something went wrong");
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    locator<NavigationService>()
        .pushDialog(const ProgressDialog(key: Key('LoginProgress')));

    final QueryResult result = await clientNonAuth.mutate(
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
      final User loggedInUser =
          User.fromJson(result.data!['login'] as Map<String, dynamic>);
      loggedInUser.print();
      locator<UserConfig>().updateUser(loggedInUser);
      return true;
    }
    return false;
  }

  Future<bool> signup(
      String firstName, String lastName, String email, String password) async {
    locator<NavigationService>()
        .pushDialog(const ProgressDialog(key: Key('SignUpProgress')));

    final QueryResult result = await clientNonAuth.mutate(MutationOptions(
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
      final User signedInUser =
          User.fromJson(result.data!['signUp'] as Map<String, dynamic>);
      locator<UserConfig>().updateUser(signedInUser);
      return true;
    }
    return false;
  }

  Future<bool> joinPublicOrg(String id) async {
    final QueryResult result = await clientAuth
        .mutate(MutationOptions(document: gql(_query.joinOrgById(id))));

    if (result.hasException) {
      final bool? exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        joinPublicOrg(id);
      } else {
        locator<NavigationService>().pop();
      }
    } else if (result.data != null && result.isConcrete) {
      final OrgInfo joinedOrg = OrgInfo.fromJson(
          result.data!['joinPublicOrganization']['joinedOrganizations'][0]
              as Map<String, dynamic>);
      locator<UserConfig>().updateUserJoinedOrg([joinedOrg]);
      locator<NavigationService>().pop();
      return true;
    }
    return false;
  }

  Future<bool> sendMembershipRequest(String id) async {
    final QueryResult result = await clientAuth.mutate(
        MutationOptions(document: gql(_query.sendMembershipRequest(id))));
    if (result.hasException) {
      final bool? exception = encounteredExceptionOrError(result.exception!);
      if (exception!) {
        sendMembershipRequest(id);
      } else {
        locator<NavigationService>().pop();
      }
    } else if (result.data != null && result.isConcrete) {
      final OrgInfo membershipRequest = OrgInfo.fromJson(
          result.data!['sendMembershipRequest']['organization']
              as Map<String, dynamic>);
      locator<UserConfig>().updateUserMemberRequestOrg([membershipRequest]);
      locator<NavigationService>().pop();
      return true;
    }
    return false;
  }
}
