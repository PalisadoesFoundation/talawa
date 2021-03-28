//flutter imported packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:fluttertoast/fluttertoast.dart';

//pages are called here
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/apiFuctions.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/widgets/toast_tile.dart';

class AddPost extends StatefulWidget {
  AddPost({Key key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final titleController = TextEditingController();
  final textController = TextEditingController();
  AutovalidateMode validate = AutovalidateMode.disabled;
  String id;
  String organizationId;
  Map result;
  FToast fToast;
  Preferences preferences = Preferences();

  //giving every variable its initial state
  initState() {
    super.initState();
    getCurrentOrgId();
    fToast = FToast();
    fToast.init(context);
  }

  //this method is getting the current org id
  getCurrentOrgId() async {
    final orgId = await preferences.getCurrentOrgId();
    setState(() {
      organizationId = orgId;
    });
    print(organizationId);
  }

  //creating post
  Future createPost() async {
    String description = textController.text.trim().replaceAll('\n', ' ');
    String title = titleController.text.trim().replaceAll('\n', ' ');
    String mutation = Queries().addPost(description, organizationId, title);
    ApiFunctions apiFunctions = ApiFunctions();
    try {
      result = await apiFunctions.gqlmutation(mutation);
      if (result != null) {
        Navigator.pop(context, true);
      } else {
        _exceptionToast(result.toString().substring(20, 35));
      }
      return result;
    } on Exception catch (e) {
      print(e.toString());
      _exceptionToast(e.toString().substring(28, 68));
    }
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
        autovalidateMode: validate,
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Container(
              child: TextFormField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30)
                ],
                key: Key('Title'),
                textInputAction: TextInputAction.next,
                validator: (String value) {
                  if (value.length > 30) {
                    return "Post title cannot be longer than 30 letters";
                  }

                  if (value.isEmpty) {
                    return "This field is Required";
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
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Container(
              child: TextFormField(
                maxLines: null,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10000)
                ],
                keyboardType: TextInputType.multiline,
                key: Key('Description'),
                controller: textController,
                validator: (String value) {
                  if (value.length > 10000) {
                    return "Post cannot be longer than 10000 letters";
                  }

                  if (value.isEmpty) {
                    return "This field is Required";
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
                //  'Give your post Description here....',
              ),
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
        key: Key('submit'),
        backgroundColor: UIData.secondaryColor,
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            createPost();
          }
        });
  }

  Widget inputField(String name, TextEditingController controller) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: TextField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(10),
          ],
          keyboardType: TextInputType.multiline,
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.teal)),
              hintText: name),
        ));
  }

  _exceptionToast(String msg) {
    fToast.showToast(
      child: ToastTile(
        msg: msg,
        success: false,
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }
}
