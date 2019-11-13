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

  //Column1
  Widget profileColumn() => Container(
        height: deviceSize.height * 0.2,
        margin: EdgeInsets.only(top: 20),
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
                      IconButton(
                        icon: Icon(Icons.chat),
                        color: Colors.black,
                        onPressed: () {},
                      ),
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
                      IconButton(
                        icon: Icon(Icons.call),
                        color: Colors.black,
                        onPressed: () {},
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
      height: deviceSize.height * 0.6,
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

  Widget bodyData() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          profileColumn(),
          // CommonDivider(),
          // followColumn(deviceSize),
          // CommonDivider(),
          descColumn(),
          // CommonDivider(),
          // accountColumn()
        ],
      ),
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

Widget followColumn(Size deviceSize) => Container(
      height: deviceSize.height * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ProfileTile(
            title: "1.5K",
            subtitle: "Posts",
          ),
          ProfileTile(
            title: "2.5K",
            subtitle: "Followers",
          ),
          ProfileTile(
            title: "10K",
            subtitle: "Comments",
          ),
          ProfileTile(
            title: "1.2K",
            subtitle: "Following",
          )
        ],
      ),
    );
