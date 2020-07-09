import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink(
    uri: "https://talawa-testing.herokuapp.com/graphql",
  );



    static AuthLink _authLink = AuthLink(
      getToken: () async =>
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZWRlOWIyODAzYTU3ZDIyZjYzZWY5MWQiLCJlbWFpbCI6InJ3QGdtYWlsLmNvbSIsImlhdCI6MTU5MjY5MDc0Mn0.Q-xQ3dEolbmYbHxDuQ9wuOiiTF9LU_mumEwh60X_zAY',
    );

    static Link _link = _authLink.concat(httpLink);




final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(

    GraphQLClient(link: _link, cache: InMemoryCache()));

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: InMemoryCache(),
      link: _link,
    );
  }
}


