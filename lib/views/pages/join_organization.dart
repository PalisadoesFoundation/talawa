import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/utils/uidata.dart';

class JoinOrganization extends StatefulWidget {
  @override
  _JoinOrganizationState createState() => _JoinOrganizationState();
}

class _JoinOrganizationState extends State<JoinOrganization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xffF3F6FF),
          elevation: 0.0,
          brightness: Brightness.light),
      body: Container(
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
                      child: Icon(
                        Icons.search,
                        color: Colors.black
                      ),
                    ),
                    hintText: "Search Organization Name"),
              ),
              SizedBox(height: 20),
              Divider(
                height: 0.1,
                color: Colors.black,
              ),
              Expanded(
                  child: Container(
                      color: Color(0xffF3F6FF),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                      child: ListView(
                        children: <Widget>[
                          Card(
                              child:
                                  ListTile(title: Text('One-line ListTile'))),
                          Card(
                            child: ListTile(
                              leading: FlutterLogo(),
                              title: Text('One-line with leading widget'),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text('One-line with trailing widget'),
                              trailing: Icon(Icons.more_vert),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: FlutterLogo(),
                              title: Text('One-line with both widgets'),
                              trailing: Icon(Icons.more_vert),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text('One-line dense ListTile'),
                              dense: true,
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: FlutterLogo(size: 56.0),
                              title: Text('Two-line ListTile'),
                              subtitle: Text('Here is a second line'),
                              trailing: Icon(Icons.more_vert),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: FlutterLogo(size: 72.0),
                              title: Text('Three-line ListTile'),
                              subtitle: Text(
                                  'A sufficiently long subtitle warrants three lines.'),
                              trailing: Icon(Icons.more_vert),
                              isThreeLine: true,
                            ),
                          ),
                          
                        ],
                      )))
            ],
          )),
    );
  }
}
