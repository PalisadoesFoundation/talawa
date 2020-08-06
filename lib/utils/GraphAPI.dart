import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/model/token.dart';
class GraphAPI with ChangeNotifier {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  Queries _queries = Queries();

  Preferences _pref = Preferences();

  void getNewToken() async {
  
      String refreshToken = await _pref.getRefreshToken();

      GraphQLClient _client = graphQLConfiguration.clientToQuery();
   
      QueryResult result = await _client.mutate(MutationOptions(
          documentNode: gql(_queries.refreshToken(refreshToken))
          ));

      if (result.hasException) {
        print(result.exception);
      } else if (!result.hasException && !result.loading) {
        print(result.data);
      final Token accessToken = new Token(tokenString: result.data['refreshToken']['accessToken']);
      await _pref.saveToken(accessToken);
      final Token refreshToken = new Token(tokenString: result.data['refreshToken']['refreshToken']);
      await _pref.saveRefreshToken(refreshToken);

            } else {
        return null;
      }
    
  }


  //clears token and pages stack
  void logout(BuildContext context) async {
    await Preferences.clearUser();
    Navigator.pushNamedAndRemoveUntil(
        context, UIData.loginPageRoute, (r) => false);
  }
}
