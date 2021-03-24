import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql/utilities.dart' show multipartFileFrom;
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/validator.dart';
import 'package:talawa/view_models/vm_register.dart';
import 'package:talawa/views/pages/organization/profile_page.dart';

class UpdateProfilePage extends StatefulWidget {
  final List userDetails;
  const UpdateProfilePage({Key key, @required this.userDetails})
      : super(key: key);

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  File _image;
  FToast fToast;

  final _formKey = GlobalKey<FormState>();
  var _validate = AutovalidateMode.disabled;
  AuthController _authController = AuthController();
  Queries _updateProfileQuery = Queries();
  RegisterViewModel model = new RegisterViewModel();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  bool _progressBarState = false;

  //providing initial states to the variables
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  //Function called when the user update without the image
  updateProfileWithoutImg() async {
    setState(() {
      _progressBarState = true;
    });

    GraphQLClient _client = graphQLConfiguration.authClient();
    QueryResult result;

    if (widget.userDetails[0]['email'] == model.email) {
      result = await _client.mutate(
        MutationOptions(
          documentNode: gql(_updateProfileQuery.updateUserProfile()),
          variables: {
            "firstName": model.firstName,
            "lastName": model.lastName,
          },
        ),
      );
    } else {
      result = await _client.mutate(
        MutationOptions(
          documentNode: gql(_updateProfileQuery.updateUserProfile()),
          variables: {
            "firstName": model.firstName,
            "lastName": model.lastName,
            "email": widget.userDetails[0]['email'] == model.email
                ? null
                : model.email,
          },
        ),
      );
    }

    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      return updateProfileWithoutImg();
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      print(result.exception);
      setState(() {
        _progressBarState = false;
      });
      if (result.exception.clientException != null) {
        _exceptionToast(result.exception.clientException.message);
      } else {
        _exceptionToast(result.exception.graphqlErrors.first.message);
      }
    } else if (!result.hasException && !result.loading) {
      setState(() {
        _progressBarState = false;
      });

      await _successToast('Profile Updated');

      pushNewScreen(
        context,
        screen: ProfilePage(),
      );
    }
  }

  //function called when the user is called without the image
  updateProfileWithImg() async {
    setState(() {
      _progressBarState = true;
    });

    GraphQLClient _client = graphQLConfiguration.authClient();
    final img = await multipartFileFrom(_image);
    QueryResult result;
    if (widget.userDetails[0]['email'] == model.email) {
      result = await _client.mutate(
        MutationOptions(
          documentNode: gql(_updateProfileQuery.updateUserProfile()),
          variables: {
            'file': img,
            "firstName": model.firstName,
            "lastName": model.lastName,
          },
        ),
      );
    } else {
      result = await _client.mutate(
        MutationOptions(
          documentNode: gql(_updateProfileQuery.updateUserProfile()),
          variables: {
            'file': img,
            "firstName": model.firstName,
            "lastName": model.lastName,
            "email": widget.userDetails[0]['email'] == model.email
                ? null
                : model.email,
          },
        ),
      );
    }

    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      return updateProfileWithImg();
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      print(result.exception);
      setState(() {
        _progressBarState = false;
      });
      if (result.exception.clientException != null) {
        _exceptionToast(result.exception.clientException.message);
      } else {
        _exceptionToast(result.exception.graphqlErrors.first.message);
      }
    } else if (!result.hasException && !result.loading) {
      setState(() {
        _progressBarState = false;
      });

      _successToast('Profile Updated');

      pushNewScreen(
        context,
        screen: ProfilePage(),
      );
    }
  }

  //Get image using camera
  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  //Get image using gallery
  _imgFromGallery() async {
    FilePickerResult filePicker =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (filePicker != null) {
      File image = File(filePicker.files.first.path);
      setState(() {
        _image = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: _formKey,
            autovalidateMode: _validate,
            child: ListView(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Text(
                            'Update Profile',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          subtitle: Text(
                            'Keep your profile upto date',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                addImage(),
                SizedBox(
                  height: 30,
                ),
                //First Name
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: TextFormField(
                    style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.name,
                    validator: (value) => Validator.validateLastName(value),
                    enableSuggestions: true,
                    cursorRadius: Radius.circular(10),
                    cursorColor: Colors.blue[800],
                    textCapitalization: TextCapitalization.words,
                    initialValue: widget.userDetails[0]['firstName'].toString(),
                    onSaved: (firstName) {
                      model.firstName = firstName;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      labelText: 'First Name',
                      counterText: '',
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //Last Name
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: TextFormField(
                    style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.name,
                    validator: (value) => Validator.validateLastName(value),
                    enableSuggestions: true,
                    cursorRadius: Radius.circular(10),
                    cursorColor: Colors.blue[800],
                    textCapitalization: TextCapitalization.words,
                    initialValue: widget.userDetails[0]['lastName'].toString(),
                    onSaved: (lastName) {
                      model.lastName = lastName;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      labelText: 'Last Name',
                      counterText: '',
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //Email
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: TextFormField(
                    style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => Validator.validateEmail(value),
                    enableSuggestions: true,
                    cursorRadius: Radius.circular(10),
                    cursorColor: Colors.blue[800],
                    initialValue: widget.userDetails[0]['email'].toString(),
                    textCapitalization: TextCapitalization.words,
                    onSaved: (email) {
                      model.email = email;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      labelText: 'Email',
                      counterText: '',
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: RaisedButton.icon(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      _validate = AutovalidateMode.always;

                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        _image == null
                            ? updateProfileWithoutImg()
                            : updateProfileWithImg();
                      }
                    },
                    padding: EdgeInsets.all(15),
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    icon: _progressBarState
                        ? SizedBox(
                            height: 14,
                            width: 14,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            ),
                          )
                        : Icon(
                            Icons.update,
                            color: Colors.white,
                          ),
                    label: Text(
                      'Update Profile',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //widget used to add the image
  Widget addImage() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              _showPicker(context);
            },
            child: CircleAvatar(
              radius: 55,
              backgroundColor:
                  _image != null ? UIData.secondaryColor : Colors.grey[300],
              child: _image != null
                  ? CircleAvatar(
                      radius: 52,
                      backgroundImage: FileImage(
                        _image,
                      ),
                    )
                  : CircleAvatar(
                      radius: 52,
                      backgroundColor: Colors.grey[300],
                      child: Icon(
                        Icons.add_a_photo,
                        color: Colors.grey[800],
                        size: 45,
                      ),
                    ),
            ),
          ),
        )
      ],
    );
  }

  //used to show the method user want to choose their pictures
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
            ),
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
              minHeight: MediaQuery.of(context).size.height * 0.1,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                Icon(
                  Icons.maximize,
                  size: 30,
                ),
                SizedBox(height: 5),
                Center(
                  child: Text(
                    'Update your profile picture',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Divider(),
                Wrap(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.camera_alt_outlined),
                      title: Text('Camera'),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                        leading: Icon(Icons.photo_library),
                        title: Text('Photo Library'),
                        onTap: () {
                          _imgFromGallery();
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
              ],
            ),
          );
        });
  }

  //This method is called when the result is an exception
  _exceptionToast(String msg) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.red,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              msg,
              style: TextStyle(fontSize: 15.0, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 5),
    );
  }

  //This method is called after complete mutation
  _successToast(String msg) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      child: Text(
        msg,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }
}
