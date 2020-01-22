import 'package:flutter/material.dart';
import 'package:talawa/model/user.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/model/responsibility.dart';
import 'package:talawa/views/widgets/_widgets.dart';

class UserTile extends StatefulWidget {
  final User user;
  final List<int> userIds;
  const UserTile({Key key, this.user, this.userIds}) : super(key: key);

  @override
  _UserTileState createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
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
                  user: widget.user.firstName != null
                      ? widget.user.firstName.substring(0, 1).toUpperCase()
                      : widget.user.email.substring(0, 1).toUpperCase(),
                )),
            Expanded(
              flex: 8,
              child: new Text(widget.user.email),
            ),
            widget.user.id != null
                ? Expanded(
                    flex: 2,
                    child: new Checkbox(
                        value: selected,
                        onChanged: (value) {
                          setState(() {
                            selected = value;
                            if (value == true) {
                              print(widget.user.id);
                              widget.userIds.add(widget.user.id);
                            } else {
                              widget.userIds.removeWhere(
                                  (userId) => userId == widget.user.id);
                            }
                          });
                        }))
                : Expanded(
                    flex: 2,
                    child: new SizedBox(
                      height: 1,
                    ))
          ],
        ),
      ),
    );
  }
}
