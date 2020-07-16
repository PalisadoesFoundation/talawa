import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talawa/model/user.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/view_models/vm_login.dart';
import 'package:talawa/views/pages/_pages.dart';
import 'package:talawa/model/token.dart';
import 'package:talawa/utils/globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api.dart';



class GraphAPI with ChangeNotifier {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  Queries _loginQuery = Queries();
  LoginViewModel user = new LoginViewModel();
  User userModel = User();


  //could not follow the normal way listed in the documentation for Query, as the the login query needed to be manuallybcalled when the button is pressed
  Future login(BuildContext context, LoginViewModel user) async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
  SharedPreferences preferences = await SharedPreferences.getInstance();

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
          duration: Duration(seconds: 5)));
    } else if (!result.hasException && !result.loading) {
      print(result.data);
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Getting Things Ready...",
              style: TextStyle(color: Colors.white, fontSize: 18)),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3)));

      //Store user token and id in preferences

       final Token token = new Token(tokenString: result.data['login']['token']);
        await Preferences.saveCurrentUserId(token);
       final String currentUserId = result.data['login']['userId'];
        await preferences.setString("userId", currentUserId);

      print('User logged in');
        Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => new HomePage()));
    }
  }

  

    //clears token and pages stack
    void logout(BuildContext context) async {
    await Preferences.clearUser();
   Navigator.pushNamedAndRemoveUntil(context, UIData.loginPageRoute, (r) => false);
  }


}
