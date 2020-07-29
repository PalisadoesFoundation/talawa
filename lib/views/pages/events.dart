import 'package:flutter/material.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/views/pages/addEventPage.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


import 'package:provider/provider.dart';
import 'package:talawa/controllers/organisation_controller.dart';

class Events extends StatefulWidget {
  Events({Key key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List eventList = [];
  int selectedIndex = 0;
  String title = '';
  String description = '';
  String orgId = '';

  initState() {
    super.initState();
    gqlquerry();
  }

///////////////////////////////////////////////////////////////////////////////
  Future<List> gqlquerry() async {
    HttpLink _httpLink = HttpLink(
      uri: 'http://talawa-ranil.herokuapp.com/graphql',
    );
    final AuthLink _authLink = AuthLink(
      getToken: () async => 'Bearer e26cdfbd-ca7e-61cd-5ee0-97b9e6d155ac',
    );

    // final Link _link = _authLink.concat(_httpLink);

    GraphQLClient _client = GraphQLClient(
      cache: InMemoryCache(),
      link: _httpLink,
    );

    const String readRepositories = """
      query {
        events { 
          _id
          title
          description
          isPublic
          isRegisterable
          recurring
          recurrance
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
      eventList = repositories['events'];
    });
  }

////////////////////////////////////////////////////////////////////////////////////
  Future<void> _deleteEvent(context, eventId) async {
        const String mutation = """
      mutation RemoveEvent(
        \$id: ID!,
        )
        {removeEvent(
          id: \$id,
          ){
            _id
            title
            description
          }
        }
    """;

    Map<String, dynamic> changes = {'id': eventId};
    String name = 'Delete this Event?'; 
    String message = 'Are you sure you want to delete this event?';
    _gqlMutation( context,  eventId,  mutation,  name,  message,  changes);
  }

////////////////////////////////////////////////////////////////////////////////////
  Future<void> _registerDialog(context, eventId) async {
    const String mutation = """
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
    
    Map changes = {'id': eventId};
    String name = 'Register For Event?'; 
    String message = 'Would You like to register for this event?';
    _gqlMutation( context,  eventId,  mutation,  name,  message,  changes);
  }

///////////////////////////////////////////////////////////////////////////////////
  Future<void> _addProjectDialog(context, eventId) async {
    const String mutation = """
      mutation CreateEventProject(
        \$title: String!,
        \$description: String!,
        \$eventId: String!,
        ){
        createEventProject(
          data:{
            title: \$title,
            description: \$description,
            eventId: \$eventId,
          }){
            _id
            title
            description
          }
        }
    """;
                
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Mutation(
          options: MutationOptions(
            documentNode:
                gql(mutation), // this is the mutation string you just created
            // you can update the cache based on results
            update: (Cache cache, QueryResult result) {
              return cache;
            },
            // or do something with the result.data on completion
            onCompleted: (dynamic resultData) {
              print(resultData);
            },
            onError: (error) {
              print(error);
            },
          ),
          builder: (
            RunMutation runMutation,
            QueryResult result,
          ) {
            return AlertDialog(
              title: Text('Add new project'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    TextField(
                      onChanged: (data) {
                        title = data;
                      },
                      decoration: InputDecoration(hintText: 'title'),
                    ),
                    TextField(
                      onChanged: (data) {
                        description = data;
                      },
                      decoration: InputDecoration(hintText: 'description'),
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                    child: Text('YES'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      runMutation(
                        {
                          'title':title,
                          'description':description,
                          'eventId':eventId,
                        }
                      );
                    }),
              ],
            );
          },
        );
      },
    );
  }


//////////////////////////////////////////////////////////////////////////////////
  Future<void> _gqlMutation(BuildContext context, String eventId, String mutation, String name, String message, Map changes) async {

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Mutation(
          options: MutationOptions(
            documentNode:
                gql(mutation), // this is the mutation string you just created
            // you can update the cache based on results
            update: (Cache cache, QueryResult result) {
              return cache;
            },
            // or do something with the result.data on completion
            onCompleted: (dynamic resultData) {
              print(resultData);
            },
            onError: (error) {
              print(error);
            },
          ),
          builder: (
            RunMutation runMutation,
            QueryResult result,
          ) {
            return AlertDialog(
              title: Text(name),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(message),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                FlatButton(
                    child: Text('YES'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      runMutation(changes);
                    }),
              ],
            );
          },
        );
      },
    );
  }


  Widget menueText(String text){
    return ListTile(
      title: Text(text,
    style: TextStyle(
      color: Colors.grey[700]

    ),
    ));
  }



  Future<void> _editEvent(context, eventId) async {
  }





  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final OrgController org = Provider.of<OrgController>(context);
    orgId = org.value;

    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            pushNewScreen(
              context,
              screen: AddEvent(),
            );
          }),
      body: eventList.isEmpty ? Center(child: CircularProgressIndicator()) : 
      RefreshIndicator(
        onRefresh: () async {
          gqlquerry();
        },
        child: (ListView.builder(
        itemCount: eventList.length,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              Container(
                width: width,
                child: Card(
                   child: Padding(
                     padding: EdgeInsets.only(left: 20, right: 0),
                     child: ExpansionTile(
                       
                  children: <Widget>[
                    eventList[index]['isPublic']?menueText('Public'): menueText('Private'),
                    eventList[index]['isRegisterable']?menueText('Registered'):menueText('Not Registered'),
                  ],
                  title: Text(eventList[index]['title']),
                  subtitle: Text(eventList[index]['description']),
                  trailing: popUpMenue(eventList[index]['_id']),
                ))),
              ),
            ],
          );
        },
      )),
    ));
  }

  Widget popUpMenue(eventId) {
    return PopupMenuButton<int>(
      onSelected: (val) async {
        if (val == 1) {
          return _registerDialog(context, eventId);
        } else if (val == 2) {
          return _addProjectDialog(context, eventId);
        } else if (val == 3) {
          return _editEvent(context, eventId);
        } else if (val == 4) {
          return _deleteEvent(context, eventId);
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        const PopupMenuItem<int>(
            value: 1,
            child: ListTile(
              leading: Icon(Icons.playlist_add_check),
              title: Text('Register For Event'),
            )),
        const PopupMenuItem<int>(
            value: 2,
            child: ListTile(
              leading: Icon(Icons.note_add),
              title: Text('Add a Project to this Event'),
            )),
        const PopupMenuItem<int>(
            value: 3,
            child: ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit this event'),
            )),
        const PopupMenuItem<int>(
            value: 4,
            child: ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete This Event'),
            ))
      ],
    );
  }
}
