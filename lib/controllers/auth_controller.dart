//flutter packages to be called here
import 'package:flutter/material.dart';

//pages are called here
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/model/token.dart';
import 'package:talawa/utils/uidata.dart';

class AuthController with ChangeNotifier {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  final Queries _queries = Queries();
  final Preferences _pref = Preferences();
  String imgSrc;

  //function that uses refresh token to get new access token and refresh token when access token is expired
  Future<void> getNewToken() async {
    final String refreshToken = await _pref.getRefreshToken();

    final GraphQLClient _client = graphQLConfiguration.clientToQuery();

    final QueryResult result = await _client.mutate(MutationOptions(
        documentNode: gql(_queries.refreshToken(refreshToken))));

    if (result.hasException) {
      print(result.exception);
    } else if (!result.hasException && !result.loading) {
      final Token accessToken = Token(
          tokenString: result.data['refreshToken']['accessToken'].toString());
      await _pref.saveToken(accessToken);
      final Token refreshToken = Token(
          tokenString: result.data['refreshToken']['refreshToken'].toString());
      await _pref.saveRefreshToken(refreshToken);
    } else {
      return;
    }
  }

  //clears user and org details and pages stack
  Future<void> logout(BuildContext context) async {
    await Preferences.clearUser();
    super.dispose();
    Navigator.pushNamedAndRemoveUntil(
        context, UIData.loginPageRoute, (r) => false);
  }
}
