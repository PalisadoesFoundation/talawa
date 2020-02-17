// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
import 'package:talawa/controllers/responsibility_controller.dart';
import 'package:talawa/model/activity.dart';
import 'package:talawa/model/responsibility.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/widgets/_widgets.dart';
import 'package:talawa/views/widgets/forms/edit_activity_form.dart';
import 'package:talawa/utils/globals.dart';

class ActivityDetails extends StatefulWidget {
  ActivityDetails({
    Key key,
    Colors color,
  }) : super(key: key);

  @override
  _ActivityDetailsState createState() => new _ActivityDetailsState();
}

class _ActivityDetailsState extends State<ActivityDetails>
    with SingleTickerProviderStateMixin {
  SocketIO socketIO;
  ResponsibilityController responsibilityController =
      new ResponsibilityController();
  final TextEditingController _chatController = new TextEditingController();
  var deviceSize;
  Activity activity;
  BuildContext _context;
  final List<ChatMessage> _messages = <ChatMessage>[];

  ChatMessage message = new ChatMessage(text: 'This is a test message');

  @override
  void initState() {
    socketIO = SocketIOManager().createSocketIO(
        baseRoute,
      '/',
    );
    // socketIO.init();
    // socketIO.subscribe('receive_message', (jsonData) {
    //   //Convert the JSON data received into a Map
    //   Map<String, dynamic> data = json.decode(jsonData);
    //   this.setState(() => _messages.insert(0, data['message']));
    // });
    // socketIO.connect();
    // _messages.insert(0, message);
    // _messages.insert(0, message);
    // _messages.insert(0, message);
    super.initState();
  }

  void _handleSubmit(String text) {
    _chatController.clear();
    ChatMessage message = new ChatMessage(text: text);
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    activity = ModalRoute.of(context).settings.arguments;
    deviceSize = MediaQuery.of(context).size;
    return _scaffold();
  }

  Widget _scaffold() => MainCollapsingToolbar(
      activity: activity,
      actions: <Widget>[
        PopupMenuButton<int>(
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: Text("Edit"),
            ),
          ],
          onSelected: (result) {
            if (result == 1) {}
            {
              editUserForm();
            }
          },
        )
      ],
      bodyData: TabBarView(
        children: <Widget>[
          new Column(
            children: <Widget>[
              new Flexible(
                child: ListView.builder(
                  padding: new EdgeInsets.all(8.0),
                  reverse: true,
                  itemBuilder: (_, int index) => _messages[index],
                  itemCount: _messages.length,
                ),
              ),
              new Divider(
                height: 1.0,
              ),
              new Container(
                decoration: new BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                child: _chatEnvironment(),
              )
            ],
          ),
          new Column(
            children: <Widget>[
              new Flexible(
                child: FutureBuilder<List<Responsibility>>(
                    future: responsibilityController
                        .getResponsibilitiesByActivity(context, activity.id),
                    builder: (_context, snapshot) {
                      return snapshot.hasData
                          ? ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (_context, index) {
                                Responsibility resp = snapshot.data[index];
                                return Column(
                                  children: <Widget>[TaskItem(resp: resp)],
                                );
                              },
                            )
                          : Center(child: CircularProgressIndicator());
                    }),
              ),
              new Container(
                margin: EdgeInsets.all(15),
                child: new FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    Navigator.pushNamed(context, UIData.addResponsibilityPage,
                        arguments: activity.id);
                  },
                ),
              )
            ],
          )
        ],
      ));

  Widget _chatEnvironment() {
    return IconTheme(
      data: new IconThemeData(color: Colors.blue),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(
                    hintText: "Starts typing ..."),
                controller: _chatController,
                onSubmitted: _handleSubmit,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmit(_chatController.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  editUserForm() {
    showDialog(
        context: _context,
        builder: (BuildContext context) {
          return EditActivityForm(activityId: activity.id,);
        });
  }
}
