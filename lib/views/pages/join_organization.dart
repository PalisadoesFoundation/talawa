import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/utils/uidata.dart';

class JoinOrganization extends StatefulWidget {
  @override
  _JoinOrganizationState createState() => _JoinOrganizationState();
}

class _JoinOrganizationState extends State<JoinOrganization> {
  Queries organizationQuery = Queries();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xffF3F6FF),
          elevation: 0.0,
          brightness: Brightness.light),
      body: Query(
          options: QueryOptions(
            documentNode: gql(organizationQuery.fetchOrganizations),
          ),
          builder: (QueryResult result,
              {VoidCallback refetch, FetchMore fetchMore}) {
            if (result.hasException) {
              return Center(
                child: Text(
                  result.exception.toString(),
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              );
            } else if (result.loading) {
              return Center(child: CircularProgressIndicator());
            }
            List organizationInfo = result.data['organizations'];
            return Container(
                color: Color(0xffF3F6FF),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Welcome, \nFind your organization to get started",
                      style: TextStyle(
                          color: Colors.black87.withOpacity(0.8),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          fillColor: Color.fromRGBO(255, 255, 255, 1),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(Icons.search, color: Colors.black),
                          ),
                          hintText: "Search Organization Name"),
                    ),
                    SizedBox(height: 30),
                    Expanded(
                        child: Container(
                            color: Color(0xffF3F6FF),
                            child: ListView.builder(
                                itemCount: organizationInfo.length,
                                itemBuilder: (context, index) {
                                  final organization = organizationInfo[index];
                                  return Card(
                                    child: ListTile(
                                      leading: FlutterLogo(size: 56.0),
                                      title:
                                          Text(organization['name'].toString()),
                                      subtitle: Text(organization['description']
                                              .toString() +
                                          '\nCreated by: ' +
                                          organization['creator']['firstName']
                                              .toString() +
                                          ' ' +
                                          organization['creator']['lastName']
                                              .toString()),
                                      trailing: new RaisedButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        "Join Organization"),
                                                    content: Text(
                                                        "Are you sure you want to join this organization?"),
                                                    actions: [
                                                      FlatButton(
                                                        child: Text("Close"),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      FlatButton(
                                                        child: Text("Accept"),
                                                        onPressed: () {

                                                        },
                                                      )
                                                    ],
                                                  );
                                                });
                                          },
                                          color: Colors.orangeAccent,
                                          child: new Text("JOIN"),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(14.0),
                                          )),
                                      isThreeLine: true,
                                    ),
                                  );
                                })))
                  ],
                ));
          }),
    );
  }
}
