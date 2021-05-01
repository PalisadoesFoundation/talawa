//flutter packages
import 'package:flutter/material.dart';
import 'package:talawa/utils/ui_scaling.dart';

//pages are called here
import 'package:talawa/utils/uidata.dart';

class Chat extends StatefulWidget {
  const Chat({Key key, this.groupName}) : super(key: key);
  final String groupName;

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
              padding:
                  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 2.5),
              child: Text(
                widget.groupName,
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: _textComposerWidget(),
      ),
    );
  }

  Widget _textComposerWidget() {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 1.25),
      child: IconTheme(
        data: const IconThemeData(color: Colors.blue),
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 2),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: "    Enter your message...."),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 2),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.send),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
