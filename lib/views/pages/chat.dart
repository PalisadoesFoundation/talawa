import 'package:flutter/material.dart';
import 'package:talawa/utils/uidata.dart';

class Chat extends StatefulWidget {
  Chat({Key key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: UIData.secondaryColor,
              child: Image.asset(UIData.talawaLogo),
            ),
            Padding(
              padding: EdgeInsets.only(left:10),
              child: Text('Event', style: TextStyle(color: Colors.white)))
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: _textComposerWidget()),
    );
  }
    Widget _textComposerWidget() {
    return Padding(
      padding: EdgeInsets.only(bottom:10),
      child: IconTheme(
      data: IconThemeData(color: Colors.blue),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),),
                    hintText: "    Enter your message...."),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.send),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
