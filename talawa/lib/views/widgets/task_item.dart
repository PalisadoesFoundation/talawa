import 'package:flutter/material.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/model/responsibility.dart';
import 'package:talawa/views/widgets/_widgets.dart';

class TaskItem extends StatefulWidget {
  final Responsibility resp;

  const TaskItem({Key key, this.resp}) : super(key: key);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: selected
          ? new RoundedRectangleBorder(
              side: new BorderSide(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(4.0))
          : new RoundedRectangleBorder(
              side: new BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(4.0)),
      child: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: UserBubble(
                  user: 'S',
                )),
            Expanded(
              flex: 4,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, UIData.responsibilityPage,
                      arguments: widget.resp.id);
                },
                child: new Text(widget.resp.description),
              ),
            ),
            Expanded(
              flex: 3,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, UIData.responsibilityPage,
                      arguments: widget.resp.id);
                },
                child: new Text(widget.resp.date + '\n' + widget.resp.time,
                    textAlign: TextAlign.center),
              ),
            ),
            Expanded(
                flex: 2,
                child: new Checkbox(
                    value: selected,
                    onChanged: (value) {
                      setState(() {
                        selected = value;
                      });
                    })),
          ],
        ),
      ),
    );
  }
}
