//flutter packages are called here
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

// pages are called here
import 'package:provider/provider.dart';
import 'package:talawa/enums/image_from.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/validator.dart';
import 'package:talawa/view_models/vm_register.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/model/token.dart';
import 'package:talawa/views/pages/organization/join_organization.dart';
import 'package:graphql/utilities.dart' show multipartFileFrom;

//pubspec packages are called here
import 'package:image_picker/image_picker.dart';

import '../_pages.dart';

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _originalPasswordController = TextEditingController();
  FocusNode confirmPassField = FocusNode();
  RegisterViewModel model = RegisterViewModel();
  bool _progressBarState = false;
  final Queries _signupQuery = Queries();
  var _validate = AutovalidateMode.disabled;
  final Preferences _pref = Preferences();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  File _image;
  bool _obscureText = true;

  void toggleProgressBarState() {
    _progressBarState = !_progressBarState;
  }

  @override
  void initState() {
    super.initState();
    Provider.of<GraphQLConfiguration>(context, listen: false).getOrgUrl();
  }

  //function for registering user which gets called when sign up is press
  registerUser() async {
    final GraphQLClient _client = graphQLConfiguration.clientToQuery();
    final img = await multipartFileFrom(_image);
    print(_image);
    final QueryResult result = await _client.mutate(MutationOptions(
      documentNode: gql(_signupQuery.registerUser(
          model.firstName, model.lastName, model.email, model.password)),
      variables: {
        'file': img,
      },
    ));
    if (result.hasException) {
      print(result.exception);
      setState(() {
        _progressBarState = false;
      });
      CustomToast.exceptionToast(msg: result.hasException.toString());
    } else if (!result.hasException && !result.loading) {
      setState(() {
        _progressBarState = true;
      });

      final String userFName =
          result.data['signUp']['user']['firstName'].toString();
      await _pref.saveUserFName(userFName);
      final String userLName =
          result.data['signUp']['user']['lastName'].toString();
      await _pref.saveUserLName(userLName);

      final Token accessToken =
          Token(tokenString: result.data['signUp']['accessToken'].toString());
      await _pref.saveToken(accessToken);
      final Token refreshToken =
          Token(tokenString: result.data['signUp']['refreshToken'].toString());
      await _pref.saveRefreshToken(refreshToken);
      final String currentUserId =
          result.data['signUp']['user']['_id'].toString();
      await _pref.saveUserId(currentUserId);
      //Navigate user to join organization screen
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => const JoinOrganization(
                    fromProfile: false,
                  )),
          (route) => false);
    }
  }

  //function called when the user is called without the image
  registerUserWithoutImg() async {
    final GraphQLClient _client = graphQLConfiguration.clientToQuery();
    final QueryResult result = await _client.mutate(MutationOptions(
      documentNode: gql(_signupQuery.registerUserWithoutImg(
          model.firstName, model.lastName, model.email, model.password)),
    ));
    if (result.hasException) {
      print(result.exception);
      setState(() {
        _progressBarState = false;
      });
      CustomToast.exceptionToast(msg: result.exception.toString());
    } else if (!result.hasException && !result.loading) {
      setState(() {
        _progressBarState = true;
      });

      final String userFName =
          result.data['signUp']['user']['firstName'].toString();
      await _pref.saveUserFName(userFName);
      final String userLName =
          result.data['signUp']['user']['lastName'].toString();
      await _pref.saveUserLName(userLName);
      final Token accessToken =
          Token(tokenString: result.data['signUp']['accessToken'].toString());
      await _pref.saveToken(accessToken);
      final Token refreshToken =
          Token(tokenString: result.data['signUp']['refreshToken'].toString());
      await _pref.saveRefreshToken(refreshToken);
      final String currentUserId =
          result.data['signUp']['user']['_id'].toString();
      await _pref.saveUserId(currentUserId);

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => const JoinOrganization(
                    fromProfile: false,
                  )),
          (route) => false);
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
    return SingleChildScrollView(
        child: Form(
            key: _formKey,
            autovalidateMode: _validate,
            child: Column(
              children: <Widget>[
                addImage(),
                _image == null
                    ? const Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Add Profile Image',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white)),
                      )
                    : IconButton(
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
                      ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3.15,
                ),
                AutofillGroup(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        autofillHints: const <String>[AutofillHints.givenName],
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                        controller: _firstNameController,
                        validator: (value) =>
                            Validator.validateFirstName(value),
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.orange),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          prefixIcon:
                              const Icon(Icons.person, color: Colors.white),
                          labelText: "First Name",
                          labelStyle: const TextStyle(color: Colors.white),
                          alignLabelWithHint: true,
                          hintText: 'Earl',
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                        onSaved: (value) {
                          model.firstName = value;
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 2.5,
                      ),
                      TextFormField(
                        autofillHints: const [AutofillHints.familyName],
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                        controller: _lastNameController,
                        validator: Validator.validateLastName,
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.orange),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          prefixIcon:
                              const Icon(Icons.person, color: Colors.white),
                          labelText: "Last Name",
                          labelStyle: const TextStyle(color: Colors.white),
                          alignLabelWithHint: true,
                          hintText: 'John',
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                        onSaved: (value) {
                          model.lastName = value;
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 2.5,
                      ),
                      TextFormField(
                        autofillHints: const <String>[AutofillHints.email],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validator.validateEmail,
                        controller: _emailController,
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.orange),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          prefixIcon:
                              const Icon(Icons.email, color: Colors.white),
                          labelText: "Email",
                          labelStyle: const TextStyle(color: Colors.white),
                          alignLabelWithHint: true,
                          hintText: 'foo@bar.com',
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                        onSaved: (value) {
                          model.email = value;
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 2.5,
                      ),
                      TextFormField(
                        autofillHints: const <String>[AutofillHints.password],
                        textInputAction: TextInputAction.next,
                        obscureText: _obscureText,
                        controller: _originalPasswordController,
                        validator: Validator.validatePassword,
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.orange),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          prefixIcon:
                              const Icon(Icons.lock, color: Colors.white),
                          suffixIcon: TextButton(
                            onPressed: _toggle,
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                          ),
                          labelText: "Password",
                          labelStyle: const TextStyle(color: Colors.white),
                          focusColor: UIData.primaryColor,
                          alignLabelWithHint: true,
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).unfocus();
                          FocusScope.of(context).requestFocus(confirmPassField);
                        },
                        onChanged: (_) {
                          setState(() {});
                        },
                        onSaved: (value) {
                          model.password = value;
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 1.25,
                      ),
                      FlutterPwValidator(
                        width: 400,
                        height: 150,
                        minLength: 8,
                        uppercaseCharCount: 1,
                        specialCharCount: 1,
                        numericCharCount: 1,
                        onSuccess: (_) {
                          setState(() {});
                        },
                        controller: _originalPasswordController,
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 2.5,
                      ),
                      TextFormField(
                        autofillHints: const <String>[AutofillHints.password],
                        obscureText: true,
                        focusNode: confirmPassField,
                        validator: (value) => Validator.validatePasswordConfirm(
                          _originalPasswordController.text,
                          value,
                        ),
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.orange),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          prefixIcon:
                              const Icon(Icons.lock, color: Colors.white),
                          labelText: "Confirm Password",
                          labelStyle: const TextStyle(color: Colors.white),
                          focusColor: UIData.primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 2.5,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.safeBlockVertical * 2.5,
                      horizontal: SizeConfig.safeBlockHorizontal * 7.5),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.all(12.0)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          const StadiumBorder()),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      _validate = AutovalidateMode.always;
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        _image != null
                            ? registerUser()
                            : registerUserWithoutImg();
                        setState(() {
                          toggleProgressBarState();
                        });
                      }
                    },
                    child: _progressBarState
                        ? SizedBox(
                            width: SizeConfig.safeBlockHorizontal * 5,
                            height: SizeConfig.safeBlockVertical * 2.5,
                            child: const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.orange),
                              strokeWidth: 3,
                              backgroundColor: Colors.black,
                            ))
                        : const Text(
                            "SIGN UP",
                          ),
                  ),
                ),
              ],
            )));
  }

  //widget used to add the image
  Widget addImage() {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 32,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              _showPicker(context);
            },
            child: CircleAvatar(
              radius: 55,
              backgroundColor: UIData.secondaryColor,
              child: _image != null
                  ? CircleAvatar(
                      radius: 52,
                      backgroundImage: FileImage(
                        _image,
                      ),
                    )
                  : CircleAvatar(
                      radius: 52,
                      backgroundColor: Colors.lightBlue[50],
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
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
        builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              child: Wrap(
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
            ),
          );
        });
  }

  //function toggles _obscureText value
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
