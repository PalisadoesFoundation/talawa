import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/user_config.dart';

class GraphqlConfig {
  static const urlKey = "url";
  static const imageUrlKey = "imageUrl";
  static String? token;
  static String? orgURI;

//prefix route for showing images
  String? displayImgRoute;

  getToken() async {
    print('in get token');
    final _token = UserConfig().currentUser.authToken;
    token = _token;
    getOrgUrl();
  }

  getOrgUrl() async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    final url = await storage.read(key: urlKey);
    final imgUrl = await storage.read(key: imageUrlKey);
    orgURI = url;
    displayImgRoute = imgUrl;
    print('uri  : $orgURI');
  }

  GraphQLClient clientToQuery() {
    print('orgURI: $orgURI');
    return GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink(orgURI!),
    );
  }

  GraphQLClient authClient() {
    final AuthLink authLink = AuthLink(getToken: () async => 'Bearer $token');
    final HttpLink httpLink = HttpLink(orgURI!);
    final Link finalAuthLink = authLink.concat(httpLink);
    getToken();
    return GraphQLClient(
      cache: GraphQLCache(),
      link: finalAuthLink,
    );
  }
}
