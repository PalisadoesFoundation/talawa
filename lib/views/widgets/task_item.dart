import 'package:flutter/material.dart';
import 'package:flutter_quito/utils/uidata.dart';
import 'package:flutter_quito/views/widgets/_widgets.dart';

class TaskItem extends StatefulWidget {
  final String date;
  final String descriptor;

  const TaskItem({Key key, this.date, this.descriptor}) : super(key: key);

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
                  Navigator.pushNamed(context, UIData.responsibilityPage);
                },
                child: new Text(widget.descriptor),
              ),
            ),
            Expanded(
              flex: 3,
              child: new Text(widget.date, textAlign: TextAlign.center),
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
