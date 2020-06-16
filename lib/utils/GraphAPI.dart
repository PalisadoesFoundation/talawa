import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/model/token.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/view_models/vm_login.dart';
import 'package:talawa/views/pages/home_page.dart';

class GraphAPI {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  Queries _loginQuery = Queries();
  LoginViewModel user = new LoginViewModel();
  String _currentUserId;

  //could not follow the normal way listed in the documentation for Query, as the the login query needed to be manuallybcalled when the button is pressed
  Future login(BuildContext context, LoginViewModel user) async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult result = await _client.query(
      QueryOptions(
          documentNode: gql(_loginQuery.login),
          variables: {"email": user.email, "password": user.password}),
    );

    if (result.hasException) {
      print(result.exception);
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(result.exception.toString(),
              style: TextStyle(color: Colors.white, fontSize: 18)),
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 4)));
    } else if (!result.hasException && !result.loading) {
      print(result.data);
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Getting Things Ready...",
              style: TextStyle(color: Colors.white, fontSize: 18)),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 4)));

      //Store user token in local storage
      final Token token = new Token(tokenString: result.data['login']['token']);
      print(result.data['login']['token']);
      _currentUserId = await Preferences.saveCurrentUserId(token);

        //Navigate user to activity screen
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => new HomePage()));
            print( 'User logged in');
    }
  }
}
