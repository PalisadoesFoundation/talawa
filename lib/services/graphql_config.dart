import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/locator.dart';

class GraphqlConfig {
  static const imageUrlKey = "imageUrl";
  static const urlKey = "url";
  static String? orgURI = ' ';
  static String? token;

//prefix route for showing images
  String? displayImgRoute;

  getToken() async {
    final _token = locator<UserConfig>().currentUser!.authToken;
    token = _token;
    getOrgUrl();
  }

  getOrgUrl() {
    final box = Hive.box('url');
    final String? url = box.get(urlKey) as String?;
    final String? imgUrl = box.get(imageUrlKey) as String?;
    orgURI = url ?? ' ';
    displayImgRoute = imgUrl ?? ' ';
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
