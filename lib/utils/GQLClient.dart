import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/preferences.dart';

class GraphQLConfiguration {
  Preferences _pref = Preferences();
  static String token;

  getToken() async {
    final id = await _pref.getToken();
    token = id;
  }
 
  static HttpLink httpLink = HttpLink(
    uri: "http://calico.palisadoes.org/talawa/",
  );

  static AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer $token',
  );

  static final Link finalAuthLink = authLink.concat(httpLink);
  
final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(link: httpLink, cache: InMemoryCache()));

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: InMemoryCache(),
      link: httpLink,
    );
  }


  GraphQLClient authClient() {
    return GraphQLClient(
      cache: InMemoryCache(),
      link: finalAuthLink,
    );
  }
  
}


