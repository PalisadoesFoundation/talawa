import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/note_controller.dart';
import 'package:talawa/controllers/responsibility_controller.dart';
import 'package:talawa/model/activity.dart';
import 'package:talawa/model/note.dart';
import 'package:talawa/model/responsibility.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/widgets/_widgets.dart';
import 'package:talawa/views/widgets/forms/edit_activity_form.dart';

class ActivityDetails extends StatefulWidget {
  final Activity activity;
  ActivityDetails(
    this.activity, {
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
  BuildContext _context;
  List<Note> notes = [];

  final List<ChatMessage> _messages = <ChatMessage>[];

  @override
  void initState() {
    // _messages.insert(0, message);
    // _messages.insert(0, message);
    // _messages.insert(0, message);
    // fetchNotes(activity.title);
    super.initState();
  }

  void _handleSubmit(String text) {
    _chatController.clear();
    // ChatMessage message = new ChatMessage(text: text);
    setState(() {
      // _messages.insert(1, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    deviceSize = MediaQuery.of(context).size;
    return _scaffold();
  }

  Widget _scaffold() => MainCollapsingToolbar(
      activity: widget.activity,
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
              new Flexible(child: Consumer<NoteController>(
                  builder: (context, controller, child) {
                return FutureBuilder<List<Note>>(
                    future: controller.getNotes(widget.activity.id),
                    builder: (_context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          padding: new EdgeInsets.all(8.0),
                          itemBuilder: (_context, index) {
                            Note note = snapshot.data[index];
                            return Column(
                              children: <Widget>[ChatMessage(note: note)],
                            );
                          },
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    });
              })),
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
                    future:
                        responsibilityController.getResponsibilitiesByActivity(
                            context, widget.activity.id),
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
                        arguments: widget.activity.id);
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
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Provider.of<NoteController>(context, listen: false)
                      .sendMessage(widget.activity.title, _chatController.text);
                  _chatController.clear();
                },
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
          return EditActivityForm(
            activityId: widget.activity.id,
          );
        });
  }
}
