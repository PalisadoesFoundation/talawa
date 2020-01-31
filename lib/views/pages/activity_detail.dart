import 'package:flutter/material.dart';
import 'package:talawa/controllers/responsibility_controller.dart';
import 'package:talawa/model/activity.dart';
import 'package:talawa/model/responsibility.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/widgets/_widgets.dart';

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

  @override
  Widget build(BuildContext context) {
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
              // editUserForm();
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
          return AlertDialog(
              content: SingleChildScrollView(
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Edit',
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            initialValue: controller.currentUser.firstName,
                            validator: (value) {
                              return validateFirstName(value);
                            },
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              prefixIcon: Icon(Icons.person),
                              labelText: "FirstName",
                              alignLabelWithHint: true,
                              hintText: 'Earl',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onSaved: (value) {
                              model.firstName = value;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            initialValue: controller.currentUser.lastName,
                            validator: (value) {
                              return validateLastName(value);
                            },
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              prefixIcon: Icon(Icons.person),
                              labelText: "Last Name",
                              alignLabelWithHint: true,
                              hintText: 'John',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onSaved: (value) {
                              model.lastName = value;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) {
                              return _validateEmail(value);
                            },
                            controller: emailController,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              prefixIcon: Icon(Icons.person),
                              labelText: "Email",
                              alignLabelWithHint: true,
                              hintText: 'test@test.com',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onSaved: (value) {
                              model.email = value;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 30.0),
                            width: double.infinity,
                            child: RaisedButton(
                              padding: EdgeInsets.all(12.0),
                              shape: StadiumBorder(),
                              child: _progressBarState
                                  ? const CircularProgressIndicator()
                                  : Text(
                                      "Submit",
                                    ),
                              color: Colors.white,
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  await Provider.of<UserController>(context,
                                          listen: false)
                                      .updateUser(
                                          context,
                                          Provider.of<AuthController>(context,
                                                  listen: false)
                                              .currentUser,
                                          model);
                                }
                              },
                            ),
                          ),
                        ],
                      ))));
        });
  }
}
