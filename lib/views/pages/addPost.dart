import 'package:flutter/material.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/utils/apiFuctions.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/views/pages/events.dart';
import 'package:talawa/views/pages/newsfeed.dart';
class AddPost extends StatefulWidget {
  AddPost({Key key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final textController = TextEditingController();
  String id;
  String oranizationId;

createPost() async {
    String mutation = Queries().addPost( 
      textController.text,
      '5f24b2e94a83535c1b0d886b'    
    );
    ApiFunctions apiFunctions = ApiFunctions();
    Map result = await apiFunctions.gqlmutation( mutation);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('New Post',
        style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          inputField('Write Your post here....', textController),
        ],
      )),
      floatingActionButton: addPostFab(),
    );
  }


    Widget addPostFab() {
    return FloatingActionButton(
      backgroundColor: UIData.secondaryColor,
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
        onPressed: () {
          createPost();
        });
  }

  Widget inputField(String name, TextEditingController controller) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: TextField(
          maxLines: null,
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.teal)),
              hintText: name),
        ));
  }
}