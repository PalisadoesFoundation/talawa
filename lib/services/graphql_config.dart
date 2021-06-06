import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:talawa/services/user_config.dart';

import '../locator.dart';

class GraphqlConfig {
  static const urlKey = "url";
  static const imageUrlKey = "imageUrl";
  static String? token;
  static String? orgURI;

//prefix route for showing images
  String? displayImgRoute;

  getToken() async {
    final _token = locator<UserConfig>().currentUser!.authToken;
    token = _token;
    getOrgUrl();
  }

  getOrgUrl() async {
    final box = await Hive.openBox('url');
    final String? url = box.get(urlKey) as String?;
    final String? imgUrl = box.get(imageUrlKey) as String?;
    orgURI = url;
    displayImgRoute = imgUrl;
    print('uri  : $orgURI');
  }

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(partialDataPolicy: PartialDataCachePolicy.accept),
      link: HttpLink(
          'https://talawa-graphql-api.herokuapp.com/graphql'), //bug over here in using a variable that stores the same url
    );
  }

  GraphQLClient authClient() {
    final AuthLink authLink = AuthLink(getToken: () async => 'Bearer $token');
    final HttpLink httpLink = HttpLink(
        'https://talawa-graphql-api.herokuapp.com/graphql'); //bug over here in using a variable that stores the same url
    final Link finalAuthLink = authLink.concat(httpLink);
    getToken();
    return GraphQLClient(
      cache: GraphQLCache(),
      link: finalAuthLink,
    );
  }
}
