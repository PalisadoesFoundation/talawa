import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql/utilities.dart' show multipartFileFrom;
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/globals.dart';
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
  FToast fToast;

  final _formKey = GlobalKey<FormState>();
  var _validate = AutovalidateMode.disabled;
  final AuthController _authController = AuthController();
  final Queries _updateProfileQuery = Queries();
  RegisterViewModel model = RegisterViewModel();
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
        _exceptionToast(result.exception.clientException.message);
      } else {
        _exceptionToast(result.exception.graphqlErrors.first.message);
      }
    } else if (!result.hasException && !result.loading) {
      setState(() {
        _progressBarState = false;
      });

      _successToast('Profile Updated');

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
        _exceptionToast(result.exception.clientException.message);
      } else {
        _exceptionToast(result.exception.graphqlErrors.first.message);
      }
    } else if (!result.hasException && !result.loading) {
      setState(() {
        _progressBarState = false;
      });

      _successToast('Profile Updated');

      //Navigate to home screen
      Navigator.of(context).popUntil(ModalRoute.withName("/"));

      //Push New Screen
      pushNewScreen(
        context,
        screen: const ProfilePage(),
      );
    }
  }

  //Get image using camera
  _imgFromCamera() async {
    final PickedFile selectedImage = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);
    final File image = File(selectedImage.path);

    setState(() {
      _image = image;
    });
  }

  //Get image using gallery
  _imgFromGallery() async {
    final FilePickerResult filePicker =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (filePicker != null) {
      final File image = File(filePicker.files.first.path);
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
                        icon: const Icon(
                          Icons.arrow_back,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(width: 10),
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
                const SizedBox(
                  height: 20,
                ),
                _image != null
                    ? IconButton(
                        icon: const Icon(
                          Icons.delete,
                          size: 30,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            _image = null;
                          });
                        },
                      )
                    : Container(),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 30,
                ),
                //First Name
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
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
                const SizedBox(
                  height: 20,
                ),
                //Last Name
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
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
                const SizedBox(
                  height: 20,
                ),
                //Email
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
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
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                        ? const SizedBox(
                            height: 14,
                            width: 14,
                            child: CircularProgressIndicator(
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
        const SizedBox(
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
              maxHeight: MediaQuery.of(context).size.height * 0.8,
              minHeight: MediaQuery.of(context).size.height * 0.1,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                const Icon(
                  Icons.maximize,
                  size: 30,
                ),
                const SizedBox(height: 5),
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
                const SizedBox(height: 5),
                const Divider(),
                Wrap(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.camera_alt_outlined),
                      title: const Text('Camera'),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                        leading: const Icon(Icons.photo_library),
                        title: const Text('Photo Library'),
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
  void _exceptionToast(String msg) {
    final Widget toast = Container(
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
              style: const TextStyle(fontSize: 15.0, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 5),
    );
  }

  //This method is called after complete mutation
  void _successToast(String msg) {
    final Widget toast = Container(
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
      toastDuration: const Duration(seconds: 3),
    );
  }
}
