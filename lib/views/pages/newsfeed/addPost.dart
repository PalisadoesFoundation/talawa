
//flutter imported packages
import 'package:flutter/material.dart';

//pages are called here
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/apiFuctions.dart';
import 'package:talawa/utils/uidata.dart';

class AddPost extends StatefulWidget {
  AddPost({Key key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final titleController = TextEditingController();
  final textController = TextEditingController();
  String id;
  String oranizationId;
  Preferences preferences = Preferences();

  //giving every variable its initial state
  initState() {
    super.initState();
    getCurrentOrgId();
  }

  //this method is getting the current org id
  getCurrentOrgId() async {
    final orgId = await preferences.getCurrentOrgId();
    setState(() {
      oranizationId = orgId;
    });
    print(oranizationId);
  }

  //creating post
  createPost() async {
    String mutation = Queries()
        .addPost(textController.text, oranizationId, titleController.text);
    ApiFunctions apiFunctions = ApiFunctions();
    Map result = await apiFunctions.gqlmutation(mutation);
  }

  void dispose() {
    titleController.dispose();
    textController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  //main build starts from here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Post',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
          child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: TextFormField(
                validator: (String value) {
                  if (value.isEmpty) {
                    return "This field is Required";
                  }
                  if (value.length > 20) {
                    return "Title cannot be longer than 20 letters";
                  }
                  return null;
                },
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  labelText: 'Give your post a title....',
                ),
                //  'Give your post a title....',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: TextFormField(
                controller: textController,
                validator: (String value) {
                  if (value.isEmpty) {
                    return "This field is Required";
                  }
                  if (value.length > 500) {
                    return "Post cannot be longer than 500 letters";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  labelText: 'Write Your post here....',
                ),
                //  'Give your post a title....',
              ),
            ),
          ],
        ),
      )),
      floatingActionButton: addPostFab(),
    );
  }

  //this method adds the post
  Widget addPostFab() {
    return FloatingActionButton(
        backgroundColor: UIData.secondaryColor,
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            createPost();
            Navigator.pop(context, true);
          }
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
