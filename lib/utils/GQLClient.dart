import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/preferences.dart';
import 'package:flutter/material.dart';

class GraphQLConfiguration {
  Preferences _pref = Preferences();
  static String token;
  static String refreshToken;
  static const String displayImgRoute = "http://calico.palisadoes.org/talawa/";

  getToken() async {
    final id = await _pref.getToken();
    token = id;
  }

  getRefreshToken() async {
    final rToken = await _pref.getRefreshToken();
    refreshToken = rToken;
  }

  static HttpLink httpLink = HttpLink(
    uri: "http://calico.palisadoes.org/talawa/graphql",
  );

  static AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer $token',
  );

  static final Link finalAuthLink = authLink.concat(httpLink);

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: InMemoryCache(),
      link: httpLink,
    );
  }

  GraphQLClient authClient() {
    getToken();
    return GraphQLClient(
      cache: InMemoryCache(),
      link: finalAuthLink,
    );
  }
}
