import 'package:flutter/material.dart';
import 'package:flutter_quito/controllers/responsibility_controller.dart';
import 'package:flutter_quito/model/activity.dart';
import 'package:flutter_quito/model/responsibility.dart';
import 'package:flutter_quito/utils/uidata.dart';
import 'package:flutter_quito/views/widgets/_widgets.dart';

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
  ResponsibilityController responsibilityController =
      new ResponsibilityController();
  final TextEditingController _chatController = new TextEditingController();
  var deviceSize;
  Activity activity;
  TabController _controller;
  final List<ChatMessage> _messages = <ChatMessage>[];

  ChatMessage message = new ChatMessage(text: 'This is a test message');

  @override
  void initState() {
    super.initState();
    // _messages.insert(0, message);
    // _messages.insert(0, message);
    // _messages.insert(0, message);
    _controller = new TabController(length: 2, vsync: this);
  }

  void _handleSubmit(String text) {
    _chatController.clear();
    ChatMessage message = new ChatMessage(text: text);
    setState(() {
      _messages.insert(0, message);
    });
  }

  //Column1
  Widget profileColumn() => Container(
        height: deviceSize.height * 0.3,
        child: FittedBox(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ProfileTile(
                  title: activity.name,
                  subtitle: activity.date,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(40.0)),
                          border: new Border.all(
                            color: Colors.greenAccent,
                            width: 0.5,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(activity.image),
                          foregroundColor: Colors.black,
                          radius: 30.0,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );

  //column2

  //column3
  Widget descColumn() => Container(
      height: deviceSize.height * 0.564882,
      child: Column(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(color: Colors.transparent),
            child: new TabBar(
              controller: _controller,
              tabs: [
                new Tab(
                  icon: const Icon(Icons.question_answer, color: Colors.black),
                  child: Text(
                    'Discussion',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                new Tab(
                  icon: const Icon(Icons.list, color: Colors.black),
                  child: Text(
                    'Roles & Responsibilities',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          new Expanded(
            child: new TabBarView(
              controller: _controller,
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
                    new Card(
                      child: new ListTile(
                        leading: const Icon(Icons.location_on),
                        title:
                            new Text('Latitude: 48.09342\nLongitude: 11.23403'),
                        trailing: new IconButton(
                            icon: const Icon(Icons.my_location),
                            onPressed: () {}),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
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

  Widget bodyData() {
    return Column(
      children: <Widget>[
        profileColumn(),
        descColumn(),
      ],
    );
  }

  Widget _scaffold() => MainCollapsingToolbar(
      activity: activity,
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
                        .getResponsibilitiesByActivity(activity.id),
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
                    Navigator.pushNamed(context, UIData.addResponsibilityPage, arguments: activity.id);
                  },
                ),
              )
            ],
          )
        ],
      ));

  @override
  Widget build(BuildContext context) {
    activity = ModalRoute.of(context).settings.arguments;
    deviceSize = MediaQuery.of(context).size;
    return _scaffold();
  }
}
