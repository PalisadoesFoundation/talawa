import 'package:flutter/material.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/views/pages/addEventPage.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

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
  Future<void> _registerDialog(context, eventid) async {
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
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Mutation(
          options: MutationOptions(
            documentNode: gql(
                readRepositories), // this is the mutation string you just created
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
              title: Text('Register For Event?'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Would You like to register for this event?'),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                    child: Text('YES'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      runMutation({'id': eventid});
                    }),
              ],
            );
          },
        );
      },
    );
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
                      runMutation({
                        'title': title,
                        'description': description,
                        'eventId': eventId,
                      });
                    }),
              ],
            );
          },
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

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
      body: ListView.builder(
        itemCount: eventList.length,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              // RotatedBox(
              //   quarterTurns: 3,
              //   child: Container(
              //     width: 100.0,
              //     height: 50,
              //     child: OverflowBox(
              //       maxWidth: 150,
              //       child:
              //           // SliderTheme(
              //           //   data: SliderThemeData(
              //           //   ),
              //           //  child:
              //           Slider(
              //         activeColor: index == 3
              //             ? Colors.blue
              //             : index > 3 ? UIData.quitoThemeColor : Colors.grey,
              //         inactiveColor: index == 4
              //             ? UIData.quitoThemeColor
              //             : index > 4 ? UIData.quitoThemeColor : Colors.grey,
              //         value: 50,
              //         onChanged: (val) {},
              //         min: 0.0,
              //         max: 100,
              //       ),
              //       // ),
              //     ),
              //   ),
              // ),

              Container(
                  height: 110,
                  width: width,
                  child: Card(
                      semanticContainer: false,
                      child: Column(children: [
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(eventList[index]['title'])),
                        Text(eventList[index]['description']),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  String eventId = eventList[index]['_id'];
                                  _registerDialog(context, eventId);
                                },
                                child: Text('Register',
                                    style: TextStyle(color: Colors.blue[700])),
                              ),
                              FlatButton(
                                onPressed: () {
                                  String eventId = eventList[index]['_id'];
                                  _addProjectDialog(context, eventId);
                                },
                                child: Text('Add Project',
                                    style: TextStyle(color: Colors.blue[700])),
                              ),
                            ]),
                      ])),
                ),
            ],
          );
        },
      ),
    );
  }
}
