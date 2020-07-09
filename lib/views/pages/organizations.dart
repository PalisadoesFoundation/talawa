import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';



class Organizations extends StatefulWidget {
  Organizations({Key key}) : super(key: key);

  @override
  _OrganizationsState createState() => _OrganizationsState();
}

class _OrganizationsState extends State<Organizations> {
  List organizationsList = [];

  initState() {
    super.initState();
    gqlquerry();
    gqlquerry1();
  }

  @override
Future<List> gqlquerry() async {
    HttpLink _httpLink = HttpLink(
      uri: 'http://talawa-ranil.herokuapp.com/graphql',
    );
    final AuthLink _authLink = AuthLink(
      getToken: () async => 'Bearer e26cdfbd-ca7e-61cd-5ee0-97b9e6d155ac',
    );

    GraphQLClient _client = GraphQLClient(
      cache: InMemoryCache(),
      link: _httpLink,
    );

    const String readRepositories = """
      query {
        organizations { 
          _id
          name
          description
          isPublic
        }
      }
    """;

    const int nRepositories = 0;

    final QueryOptions options = QueryOptions(
      documentNode: gql(readRepositories),
      variables: <String, dynamic>{
        'nRepositories': nRepositories,
      },
    );

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      print(result.exception.toString());
    }

    final Map repositories = result.data;

    // print(repositories);
    setState(() {
      organizationsList = repositories['organizations'];
    });
  }


///////////////////////////////////////////////////////////////////////////////
  Future<List> gqlquerry1() async {
    HttpLink _httpLink = HttpLink(
      uri: 'http://talawa-ranil.herokuapp.com/graphql',
    );
    final AuthLink _authLink = AuthLink(
      getToken: () async => 'Bearer e26cdfbd-ca7e-61cd-5ee0-97b9e6d155ac',
    );

    GraphQLClient _client = GraphQLClient(
      cache: InMemoryCache(),
      link: _httpLink,
    );

    const String readRepositories = """
      mutation RegisterForEvent(
        \$id: ID!,
        )
        {registerForEvent(
          id: \$id,
          ){
            _id
            title
            description
          }
        }
    """;

    final QueryOptions options = QueryOptions(
      documentNode: gql(readRepositories),
      variables: <String, dynamic>{
        'id': '5ef5ffb895efc700243b68c9',
      },
    );

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      print(result.exception.toString());
    }

    final Map repositories = result.data;

    print(repositories);
    // setState(() {
    //   // eventList = repositories['events'];
    // });
  }



  Widget build(BuildContext context) {
        var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Organizations'),
      ),
      body: ListView.builder(
        itemCount: organizationsList.length,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              Container(
                  height: 110,
                  width: width,
                  child: Card(
                      semanticContainer: false,
                      child: Column(children: [
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(organizationsList[index]['name'])),
                        Text(organizationsList[index]['description']),

                      ])),
                ),
            ],
          );
        },
      ),
    );
  }
}