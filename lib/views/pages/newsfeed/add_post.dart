//flutter imported packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/post_controller.dart';
import 'package:talawa/services/app_localization.dart';

import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/uidata.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  AutovalidateMode validate = AutovalidateMode.disabled;
  String id;
  String organizationId;
  Map result;
  Preferences preferences = Preferences();

  @override
  initState() {
    super.initState();
    Provider.of<PostController>(context, listen: false).getCurrentOrgId();
  }

  @override
  void dispose() {
    titleController.dispose();
    textController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: const Key(
          'ADD_POST_APP_BAR',
        ),
        title: Text(
          AppLocalizations.of(context).translate('New Post'),
          style: const TextStyle(
            color: Colors.white,
          ),
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
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(30),
                      ],
                      key: const Key('Title'),
                      textInputAction: TextInputAction.next,
                      validator: (String value) {
                        if (value.length > 30) {
                          return AppLocalizations.of(context).translate(
                              "Post title cannot be longer than 30 letters");
                        }

                        if (value.isEmpty) {
                          return AppLocalizations.of(context)
                              .translate("This field is Required");
                        }
                        return null;
                      },
                      controller: titleController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        labelText:
                            '${AppLocalizations.of(context).translate("Give your post a title")}....',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Container(
                    child: TextFormField(
                      maxLines: null,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10000),
                      ],
                      keyboardType: TextInputType.multiline,
                      key: const Key(
                        'Description',
                      ),
                      controller: textController,
                      validator: (String value) {
                        if (value.length > 10000) {
                          return AppLocalizations.of(context).translate(
                              "Post cannot be longer than 10000 letters");
                        }

                        if (value.isEmpty) {
                          return "This field is Required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        labelText:
                            '${AppLocalizations.of(context).translate("Write Your post here")}....',
                      ), //  'Give your post Description here....',
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
          Provider.of<PostController>(context, listen: false).createPost(
            textController.text.trim().replaceAll('\n', ' '),
            titleController.text.trim().replaceAll('\n', ' '),
            context,
          );
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
      padding: const EdgeInsets.all(
        10,
      ),
      child: TextField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(
            10,
          ),
        ],
        keyboardType: TextInputType.multiline,
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                20.0,
              ),
              borderSide: const BorderSide(
                color: Colors.teal,
              ),
            ),
            hintText: name),
      ),
    );
  }
}
