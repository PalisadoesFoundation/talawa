import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/utils/uidata.dart';


import 'package:provider/provider.dart';
import 'package:talawa/controllers/organisation_controller.dart';

class AddEvent extends StatefulWidget {
  AddEvent({Key key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  String orgId = '';
  Map switchVals = {
    'Make Public': true,
    'Make Registerable': true,
    'Recurring': true
  };
  var recurranceList = ['DAILY', 'WEEKLY', 'MONTHLY', 'YEARLY'];
  String recurrance = 'DAILY';

  Future<void> gqlmutation() async {
    const String readRepositories = """
      mutation CreateEvent(
        \$organizationId: ID!,
        \$title: String!,
        \$description: String!,
        \$isPublic: Boolean!,
        \$isRegisterable: Boolean!,
        \$recurring: Boolean!,
        \$recurrance: String,
        ){
        createEvent(
          data:{
           organizationId: \$organizationId,
           title: \$title,
           description: \$description,
           isPublic: \$isPublic,
           isRegisterable: \$isRegisterable,
           recurring: \$recurring,
           recurrance: \$recurrance,
          }){
            _id
            title
            description
          }
        }
    """;
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Mutation(
          options: MutationOptions(
            documentNode: gql(readRepositories),
            update: (Cache cache, QueryResult result) {
              return cache;
            },
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
              title: Text('Add new Event'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[Text('Create new Event?')],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                    child: Text('YES'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      runMutation({
                        'organizationId': orgId,
                        'title': titleController.text,
                        'description': descriptionController.text,
                        'isPublic': switchVals['Make Public'],
                        'isRegisterable': switchVals['Make Registerable'],
                        'recurring': switchVals['Recurring'],
                        'recurrance': recurrance,
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
    final OrgController org = Provider.of<OrgController>(context);
    orgId = org.value;

    return Scaffold(
      appBar: AppBar(
        title: Text('New Event'),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          inputField('Title', descriptionController),
          inputField('Description', titleController),
          switchTile('Make Public'),
          switchTile('Make Registerable'),
          switchTile('Recurring'),
          recurrencedropdown(),
        ],
      )),
      floatingActionButton: addEventFab(),
    );
  }

  Widget addEventFab() {
    return FloatingActionButton(
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
        onPressed: () {
          gqlmutation();
        });
  }

  Widget inputField(String name, TextEditingController controller) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: TextField(
          maxLines: name == 'Description' ? null: 1,
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal)),
              hintText: name),
        ));
  }

  Widget switchTile(String name) {
    return SwitchListTile(
        value: switchVals[name],
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        title: Text(
          name,
          style: TextStyle(color: Colors.grey[600]),
        ),
        onChanged: (val) {
          setState(() {
            switchVals[name] = val;
          });
        });
  }

  Widget recurrencedropdown() {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      leading: Text(
          'Recurrence',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600]),
        ),
      trailing:
      AbsorbPointer(
        absorbing: !switchVals['Recurring'],
        child: DropdownButton<String>(
        style: TextStyle(color: switchVals['Recurring'] ? UIData.quitoThemeColor: Colors.grey),
      value: recurrance,
      icon: Icon(Icons.arrow_drop_down),
      onChanged: (String newValue) {
        setState(() {
          recurrance = newValue;
        });
      },
      items: recurranceList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
      ),
    );
    
  }
}
