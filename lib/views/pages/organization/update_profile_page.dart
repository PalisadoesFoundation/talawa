import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql/utilities.dart' show multipartFileFrom;
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/enums/image_from.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/validator.dart';
import 'package:talawa/view_models/vm_register.dart';
import 'package:talawa/views/pages/organization/profile_page.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({Key key, @required this.userDetails})
      : super(key: key);
  final List userDetails;

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  File _image;

  final _formKey = GlobalKey<FormState>();
  var _validate = AutovalidateMode.disabled;
  final AuthController _authController = AuthController();
  final Queries _updateProfileQuery = Queries();
  RegisterViewModel model = RegisterViewModel();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  bool _progressBarState = false;

  //Function called when the user update without the image
  updateProfileWithoutImg() async {
    setState(() {
      _progressBarState = true;
    });

    final GraphQLClient _client = graphQLConfiguration.authClient();
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
        CustomToast.exceptionToast(
            msg: result.exception.clientException.message);
      } else {
        CustomToast.exceptionToast(
            msg: result.exception.graphqlErrors.first.message);
      }
    } else if (!result.hasException && !result.loading) {
      setState(() {
        _progressBarState = false;
      });

      CustomToast.sucessToast(msg: 'Profile Updated');

      Navigator.of(context).popUntil(ModalRoute.withName("/"));

      pushNewScreen(
        context,
        screen: const ProfilePage(),
      );
    }
  }

  //function called when the user is called without the image
  updateProfileWithImg() async {
    setState(() {
      _progressBarState = true;
    });

    final GraphQLClient _client = graphQLConfiguration.authClient();
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
        CustomToast.exceptionToast(
            msg: result.exception.clientException.message);
      } else {
        CustomToast.exceptionToast(
            msg: result.exception.graphqlErrors.first.message);
      }
    } else if (!result.hasException && !result.loading) {
      setState(() {
        _progressBarState = false;
      });

      CustomToast.sucessToast(msg: 'Profile Updated');

      //Navigate to home screen
      Navigator.of(context).popUntil(ModalRoute.withName("/"));

      //Push New Screen
      pushNewScreen(
        context,
        screen: const ProfilePage(),
      );
    }
  }

  //get image from camera and gallery based on the enum passed
  _imgFrom({From pickFrom = From.none}) async {
    File pickImageFile;
    if (pickFrom != From.none) {
      final PickedFile selectedImage = await ImagePicker().getImage(
          source: pickFrom == From.camera
              ? ImageSource.camera
              : ImageSource.gallery);
      pickImageFile = File(selectedImage.path);
      setState(() {
        _image = pickImageFile;
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
                        icon: const Icon(
                          Icons.arrow_back,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(width: SizeConfig.safeBlockHorizontal * 2.5),
                      const Expanded(
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
                  height: SizeConfig.safeBlockVertical * 2.5,
                ),
                _image != null
                    ? IconButton(
                        icon: Icon(
                          Icons.delete,
                          size: SizeConfig.safeBlockVertical * 3.75,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            _image = null;
                          });
                        },
                      )
                    : Container(),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2.5,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3.75,
                ),
                //First Name
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.fromLTRB(
                      SizeConfig.safeBlockHorizontal * 5,
                      0,
                      SizeConfig.safeBlockHorizontal * 5,
                      0),
                  padding: EdgeInsets.fromLTRB(
                      SizeConfig.safeBlockHorizontal * 4,
                      SizeConfig.safeBlockVertical * 2,
                      SizeConfig.safeBlockHorizontal * 4,
                      SizeConfig.safeBlockVertical * 2),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 20),
                    keyboardType: TextInputType.name,
                    validator: (value) => Validator.validateLastName(value),
                    enableSuggestions: true,
                    cursorRadius: const Radius.circular(10),
                    cursorColor: Colors.blue[800],
                    textCapitalization: TextCapitalization.words,
                    initialValue: widget.userDetails[0]['firstName'].toString(),
                    onSaved: (firstName) {
                      model.firstName = firstName;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      labelText: 'First Name',
                      counterText: '',
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2.5,
                ),
                //Last Name
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.fromLTRB(
                      SizeConfig.safeBlockHorizontal * 5,
                      0,
                      SizeConfig.safeBlockHorizontal * 5,
                      0),
                  padding: EdgeInsets.fromLTRB(
                      SizeConfig.safeBlockHorizontal * 4,
                      SizeConfig.safeBlockVertical * 2,
                      SizeConfig.safeBlockHorizontal * 4,
                      SizeConfig.safeBlockVertical * 2),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 20),
                    keyboardType: TextInputType.name,
                    validator: (value) => Validator.validateLastName(value),
                    enableSuggestions: true,
                    cursorRadius: const Radius.circular(10),
                    cursorColor: Colors.blue[800],
                    textCapitalization: TextCapitalization.words,
                    initialValue: widget.userDetails[0]['lastName'].toString(),
                    onSaved: (lastName) {
                      model.lastName = lastName;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      labelText: 'Last Name',
                      counterText: '',
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2.5,
                ),
                //Email
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.fromLTRB(
                      SizeConfig.safeBlockHorizontal * 5,
                      0,
                      SizeConfig.safeBlockHorizontal * 5,
                      0),
                  padding: EdgeInsets.fromLTRB(
                      SizeConfig.safeBlockHorizontal * 4,
                      SizeConfig.safeBlockVertical * 2,
                      SizeConfig.safeBlockHorizontal * 4,
                      SizeConfig.safeBlockVertical * 2),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 20),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => Validator.validateEmail(value),
                    enableSuggestions: true,
                    cursorRadius: const Radius.circular(10),
                    cursorColor: Colors.blue[800],
                    initialValue: widget.userDetails[0]['email'].toString(),
                    textCapitalization: TextCapitalization.words,
                    onSaved: (email) {
                      model.email = email;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      labelText: 'Email',
                      counterText: '',
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3.75,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      SizeConfig.safeBlockHorizontal * 5,
                      0,
                      SizeConfig.safeBlockHorizontal * 5,
                      0),
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.all(15.0)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          const StadiumBorder()),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
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
                    icon: _progressBarState
                        ? SizedBox(
                            height: SizeConfig.safeBlockVertical * 1.75,
                            width: SizeConfig.safeBlockHorizontal * 3.5,
                            child: const CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            ),
                          )
                        : const Icon(
                            Icons.update,
                            color: Colors.white,
                          ),
                    label: const Text(
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
          height: SizeConfig.safeBlockVertical * 1.25,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              _showPicker(context);
            },
            child: CircleAvatar(
              radius: SizeConfig.safeBlockVertical * 6.875,
              backgroundColor:
                  _image != null ? UIData.secondaryColor : Colors.grey[300],
              child: _image != null
                  ? CircleAvatar(
                      radius: SizeConfig.safeBlockVertical * 6.5,
                      backgroundImage: FileImage(
                        _image,
                      ),
                    )
                  : CircleAvatar(
                      radius: SizeConfig.safeBlockVertical * 6.5,
                      backgroundColor: Colors.grey[300],
                      child: Icon(
                        Icons.add_a_photo,
                        color: Colors.grey[800],
                        size: SizeConfig.safeBlockVertical * 5.625,
                      ),
                    ),
            ),
          ),
        )
      ],
    );
  }

  //used to show the method user want to choose their pictures
  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        elevation: 5.0,
        shape: const RoundedRectangleBorder(
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
              maxHeight: SizeConfig.screenHeight * 0.8,
              minHeight: SizeConfig.screenHeight * 0.1,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: SizeConfig.safeBlockVertical * 1.25),
                const Icon(
                  Icons.maximize,
                  size: 30,
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 0.75),
                const Center(
                  child: Text(
                    'Update your profile picture',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 0.75),
                const Divider(),
                Wrap(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.camera_alt_outlined),
                      title: const Text('Camera'),
                      onTap: () {
                        _imgFrom(pickFrom: From.camera);
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                        leading: const Icon(Icons.photo_library),
                        title: const Text('Photo Library'),
                        onTap: () {
                          _imgFrom(pickFrom: From.gallery);
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
