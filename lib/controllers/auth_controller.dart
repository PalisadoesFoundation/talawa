
//flutter packages to be called here
import 'package:flutter/material.dart';

//pages are called here
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/model/token.dart';
import 'package:talawa/utils/uidata.dart';

class AuthController with ChangeNotifier {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  final Queries _queries = Queries();
  final Preferences _pref = Preferences();
  String imgSrc;

  //function that uses refresh token to get new access token and refresh token when access token is expired
  void getNewToken() async {
    var refreshToken = await _pref.getRefreshToken();

    var _client = graphQLConfiguration.clientToQuery();

    var result = await _client.mutate(MutationOptions(
        documentNode: gql(_queries.refreshToken(refreshToken))));

    if (result.hasException) {
      print(result.exception);
    } else if (!result.hasException && !result.loading) {
      final accessToken =
          Token(tokenString: result.data['refreshToken']['accessToken']);
      await _pref.saveToken(accessToken);
      final refreshToken =
          Token(tokenString: result.data['refreshToken']['refreshToken']);
      await _pref.saveRefreshToken(refreshToken);
    } else {
      return null;
    }
  }

  //clears user and org details and pages stack
  void logout(BuildContext context) async {
    await Preferences.clearUser();
    super.dispose();
    await Navigator.pushNamedAndRemoveUntil(
        context, UIData.loginPageRoute, (r) => false);
  }
}
