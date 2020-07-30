import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/controllers/organisation_controller.dart';
import 'package:provider/provider.dart';



class Organizations extends StatefulWidget {
  Organizations({Key key}) : super(key: key);

  @override
  _OrganizationsState createState() => _OrganizationsState();
}

class _OrganizationsState extends State<Organizations> {
  List organizationsList = [];
  int isSelected = 0;
  


  initState() {
    super.initState();
    gqlquerry();
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
          members{
           _id
           firstName
           lastName}
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




  Widget build(BuildContext context) {
  final OrgController org = Provider.of<OrgController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Organizations'),
      ),
      body: organizationsList.isEmpty ? Center(child: CircularProgressIndicator()) : 
      ListView.builder(
        itemCount: organizationsList.length,
        itemBuilder: (context, index) {
          return 
          Card(child: RadioListTile(
            controlAffinity: ListTileControlAffinity.trailing,
            title: Text(organizationsList[index]['name']),
            subtitle: Text(organizationsList[index]['description']),
            groupValue: isSelected,
            value: index,
             onChanged: (val){
               org.currentOrganisation(organizationsList[val]['_id']);
               setState(() {
                 isSelected = val;
                 
               });
                
             }))
          ;
        },
      ),
    );
  }
}