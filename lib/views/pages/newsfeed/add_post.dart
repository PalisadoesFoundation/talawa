//flutter imported packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:talawa/services/post_provider.dart';

//pages are called here
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/uidata.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key key}) : super(key: key);

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
  Preferences preferences = Preferences();

  //giving every variable its initial state
  @override
  initState() {
    super.initState();
    getCurrentOrgId();
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
    final String description = textController.text.trim().replaceAll('\n', ' ');
    final String title = titleController.text.trim().replaceAll('\n', ' ');
    if (organizationId == null) {
      CustomToast.exceptionToast(msg: "Please join an organization");
      return;
    }
    result = await Queries().addPost(description, organizationId, title) as Map;
    print(result);
    if (result != null) {
      Provider.of<PostProvider>(context, listen: false).getPosts();
      Navigator.pop(context, true);
    } else {
      CustomToast.exceptionToast(msg: result.toString());
    }
    return result;
  }

  @override
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
        key: const Key('ADD_POST_APP_BAR'),
        title: const Text(
          'New Post',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                      inputFormatters: [LengthLimitingTextInputFormatter(30)],
                      key: const Key('Title'),
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
                      decoration: const InputDecoration(
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
                      key: const Key('Description'),
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
                      decoration: const InputDecoration(
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
          ),
        ),
      ),
      floatingActionButton: addPostFab(),
    );
  }

  //this method adds the post
  Widget addPostFab() {
    return FloatingActionButton(
      heroTag: "btn1",
      key: const Key('submit'),
      backgroundColor: UIData.secondaryColor,
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          createPost();
        }
      },
      child: const Icon(
        Icons.check,
        color: Colors.white,
      ),
    );
  }

  Widget inputField(String name, TextEditingController controller) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(10),
          ],
          keyboardType: TextInputType.multiline,
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: Colors.teal)),
              hintText: name),
        ));
  }
}
