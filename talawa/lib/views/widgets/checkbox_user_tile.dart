import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/model/user.dart';

class CheckboxUserTile extends StatefulWidget {
  final User user;
  final List<int> userList;
  @override
  CheckboxUserTile({Key key, this.user, this.userList});
  _CheckboxUserTileState createState() => _CheckboxUserTileState();
}

class _CheckboxUserTileState extends State<CheckboxUserTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.user.email),
      value: widget.user.selected,
      onChanged: (bool value) {
        print('user added');
        setState(() {
          
        widget.user.selected = value;
        if (value == true) {
          widget.userList.add(widget.user.id);
        } else {
          widget.userList.removeWhere((userId) => userId == widget.user.id);
        }
        });
      },
    );
  }
}
