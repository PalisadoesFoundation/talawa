import 'package:flutter/material.dart';
import 'package:flutter_quito/model/project.dart';
import 'package:flutter_quito/views/widgets/_widgets.dart';

class ProjectDetails extends StatefulWidget {
  ProjectDetails({
    Key key,
    Colors color,
  }) : super(key: key);

  @override
  _ProjectDetailsState createState() => new _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails>
    with SingleTickerProviderStateMixin {
  final TextEditingController _chatController = new TextEditingController();
  var deviceSize;
  Project project;
  TabController _controller;
  final List<ChatMessage> _messages = <ChatMessage>[];

  ChatMessage message = new ChatMessage(text: 'This is a test message');

  @override
  void initState() {
    super.initState();
    _messages.insert(0, message);
    _messages.insert(1, message);
    _messages.insert(2, message);
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
        padding: EdgeInsets.only(top: 20),
        child: FittedBox(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ProfileTile(
                  title: project.name,
                  subtitle: project.time,
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
                          backgroundImage: AssetImage(project.image),
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

  Widget _scaffold() => CommonScaffold(
        appTitle: project.name,
        bodyData: bodyData(),
        // showFAB: true,
        // showDrawer: true,
        // floatingIcon: Icons.person_add,
      );

  @override
  Widget build(BuildContext context) {
    project = ModalRoute.of(context).settings.arguments;
    deviceSize = MediaQuery.of(context).size;
    return _scaffold();
  }
}
