//flutter packages are called here
import 'package:flutter/material.dart';

//pages are called here
import 'package:talawa/utils/uidata.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/views/pages/chat/chat.dart';

class Groups extends StatefulWidget {
  Groups({Key key}) : super(key: key);

  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chats',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            String groupName = 'Event ${index + 1}';
            return Card(
              child: ListTile(
                title: Text(groupName),
                leading: CircleAvatar(
                  backgroundColor: UIData.secondaryColor,
                  child: Image.asset(UIData.talawaLogo),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  pushNewScreen(
                    context,
                    screen: Chat(
                      groupName: groupName,
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
