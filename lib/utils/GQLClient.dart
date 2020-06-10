import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

  final HttpLink  httpLink = HttpLink(uri: "https://talawa-testing.herokuapp.com/graphql");

  final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(link: httpLink, cache: InMemoryCache()));

    final String signUp = """
        mutation SignUp (\$firstName: String!, \$lastName: String!, \$email: String!, \$password: String!){
          signUp(data: {firstName: \$firstName, lastName: \$lastName, email: \$email, password: \$password}){
            userId
            token
          }
        }

    """;

    final String fetchUsers = ''' 
        query{
          users {
            firstName
            lastName
            email
            password
          }
      }
    ''';