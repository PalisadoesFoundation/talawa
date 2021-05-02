//flutter packages
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//pages are imported here
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/enums/image_from.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/validator.dart';
import 'package:graphql/utilities.dart' show multipartFileFrom;
import 'package:talawa/views/pages/_pages.dart';
import 'package:image_picker/image_picker.dart';

class CreateOrganization extends StatefulWidget {
  const CreateOrganization({this.isFromProfile = false});
  final bool isFromProfile;

  @override
  _CreateOrganizationState createState() => _CreateOrganizationState();
}

class _CreateOrganizationState extends State<CreateOrganization> {
  //defining the Organization creation state
  final orgNameController = TextEditingController();
  final orgDescController = TextEditingController();
  final orgMemberDescController = TextEditingController();
  final Queries _queries = Queries();
  bool _progressBarState = false;
  final _validate = AutovalidateMode.disabled;
  final _formKey = GlobalKey<FormState>();
  int radioValue = -1;
  int radioValue1 = -1;
  bool isPublic = true;
  bool isVisible = true;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  final AuthController _authController = AuthController();
  File _image;

  void toggleProgressBarState() {
    _progressBarState = !_progressBarState;
  }

  createOrg() async {
    //this is the function which will be called when the organization is created
    final GraphQLClient _client = graphQLConfiguration.authClient();
    orgNameController.text =
        orgNameController.text.trim().replaceAll('\n', ' ');
    orgDescController.text =
        orgDescController.text.trim().replaceAll('\n', ' ');
    orgMemberDescController.text =
        orgMemberDescController.text.trim().replaceAll('\n', ' ');
    final img = await multipartFileFrom(_image);
    orgNameController.text =
        orgNameController.text.trim().replaceAll('\n', ' ');
    orgDescController.text =
        orgDescController.text.trim().replaceAll('\n', ' ');
    orgMemberDescController.text =
        orgMemberDescController.text.trim().replaceAll('\n', ' ');
    final QueryResult result = await _client.mutate(MutationOptions(
      documentNode: gql(_queries.createOrg(
        orgNameController.text,
        orgDescController.text,
        orgMemberDescController.text,
        isPublic: isPublic,
        visibleInSearch: isVisible,
      )),
      variables: {
        'file': img,
      },
    ));

    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      return createOrg();
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      print(result.exception);
      setState(() {
        _progressBarState = false;
      });
      CustomToast.exceptionToast(msg: result.exception.toString());
    } else if (!result.hasException && !result.loading) {
      setState(() {
        _progressBarState = true;
      });
      CustomToast.sucessToast(msg: "Success!");
      print(result.data);

      if (widget.isFromProfile) {
        Navigator.pop(context);
        Navigator.pop(context);
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomePage(
                  openPageIndex: 4,
                )));
      }
    }
  }

  createOrgWithoutImg() async {
    //the function is called when we are creating the organization without the display picture
    final GraphQLClient _client = graphQLConfiguration.authClient();
    orgNameController.text =
        orgNameController.text.trim().replaceAll('\n', ' ');
    orgDescController.text =
        orgDescController.text.trim().replaceAll('\n', ' ');
    orgMemberDescController.text =
        orgMemberDescController.text.trim().replaceAll('\n', ' ');
    final QueryResult result = await _client.mutate(MutationOptions(
      documentNode: gql(_queries.createOrgWithoutImg(
        orgNameController.text,
        orgDescController.text,
        orgMemberDescController.text,
        isPublic: isPublic,
        visibleInSearch: isVisible,
      )),
    ));

    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      return createOrgWithoutImg();
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      print(result.exception);
      setState(() {
        _progressBarState = false;
      });
      CustomToast.exceptionToast(msg: result.exception.toString());
    } else if (!result.hasException && !result.loading) {
      setState(() {
        _progressBarState = true;
      });
      CustomToast.sucessToast(msg: "Sucess!");
      print(result.data);
      if (widget.isFromProfile) {
        Navigator.pop(context);
        Navigator.pop(context);
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomePage(
                  openPageIndex: 4,
                )));
      }
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Create Organization'),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 1.25),
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              addImage(),
              const Text(
                'Upload Organization Image',
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              Form(
                key: _formKey,
                autovalidateMode: _validate,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 7.5,
                      right: SizeConfig.safeBlockHorizontal * 7.5),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 3.75,
                      ),
                      AutofillGroup(
                          child: Column(
                        children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(40)
                            ],
                            autofillHints: const <String>[
                              AutofillHints.organizationName
                            ],
                            validator: (value) =>
                                Validator.validateOrgName(value),
                            textAlign: TextAlign.left,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: UIData.secondaryColor),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              prefixIcon: const Icon(
                                Icons.group,
                                color: UIData.secondaryColor,
                              ),
                              labelText: "Organization Name",
                              labelStyle: const TextStyle(color: Colors.black),
                              alignLabelWithHint: true,
                              hintText: 'My Organization',
                              hintStyle: const TextStyle(color: Colors.grey),
                            ),
                            controller: orgNameController,
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 2.5,
                          ),
                          TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(5000),
                            ],
                            autofillHints: const <String>[AutofillHints.impp],
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            textCapitalization: TextCapitalization.words,
                            validator: (value) =>
                                Validator.validateOrgDesc(value),
                            textAlign: TextAlign.left,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: UIData.secondaryColor),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              prefixIcon: const Icon(
                                Icons.note,
                                color: UIData.secondaryColor,
                              ),
                              labelText: "Organization Description",
                              labelStyle: const TextStyle(color: Colors.black),
                              alignLabelWithHint: true,
                              hintText: 'My Description',
                              hintStyle: const TextStyle(color: Colors.grey),
                            ),
                            controller: orgDescController,
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 2.5,
                          ),
                          TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(5000)
                            ],
                            autofillHints: const <String>[AutofillHints.impp],
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            textCapitalization: TextCapitalization.words,
                            validator: (value) =>
                                Validator.validateOrgAttendeesDesc(value),
                            textAlign: TextAlign.left,
                            style: const TextStyle(color: Colors.black),
                            decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                                borderSide: new BorderSide(
                                    color: UIData.secondaryColor),
                              ),
                              prefixIcon: const Icon(
                                Icons.note,
                                color: UIData.secondaryColor,
                              ),
                              labelText: "Member Description",
                              labelStyle: const TextStyle(color: Colors.black),
                              alignLabelWithHint: true,
                              hintText: 'Member Description',
                              hintStyle: const TextStyle(color: Colors.grey),
                            ),
                            controller: orgMemberDescController,
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 2.5,
                          ),
                        ],
                      )),
                      const Text(
                        'Do you want your organization to be public?',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      RadioListTile(
                        groupValue: radioValue,
                        title: const Text('Yes'),
                        value: 0,
                        activeColor: UIData.secondaryColor,
                        onChanged: (int val) {
                          FocusScope.of(context).unfocus();
                          // ignore: void_checks
                          setState(() {
                            radioValue = val;
                            if (radioValue == 0) {
                              return isPublic;
                            }
                          });
                        },
                      ),
                      RadioListTile(
                        activeColor: UIData.secondaryColor,
                        groupValue: radioValue,
                        title: const Text('No'),
                        value: 1,
                        onChanged: (int val) {
                          FocusScope.of(context).unfocus();
                          // ignore: void_checks
                          setState(() {
                            radioValue = val;
                            if (radioValue == 1) {
                              isPublic = false;
                              return isPublic;
                            }
                          });
                        },
                      ),
                      const Text(
                        'Do you want others to be able to find your organization from the search page?',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      RadioListTile(
                        activeColor: UIData.secondaryColor,
                        groupValue: radioValue1,
                        title: const Text('Yes'),
                        value: 0,
                        onChanged: (int val) {
                          FocusScope.of(context).unfocus();
                          // ignore: void_checks
                          setState(() {
                            radioValue1 = val;
                            if (radioValue1 == 0) {
                              return isVisible;
                            }
                          });
                        },
                      ),
                      RadioListTile(
                        activeColor: UIData.secondaryColor,
                        groupValue: radioValue1,
                        title: const Text('No'),
                        value: 1,
                        onChanged: (int val) {
                          FocusScope.of(context).unfocus();
                          // ignore: void_checks
                          setState(() {
                            radioValue1 = val;
                            if (radioValue1 == 1) {
                              isVisible = false;
                              return isVisible;
                            }
                          });
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 30.0,
                        ),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: _progressBarState
                              ? const Center(
                                  child: const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: const CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                      strokeWidth: 3,
                                      backgroundColor: Colors.black,
                                    ),
                                  ),
                                )
                              : const Text(
                                  "CREATE ORGANIZATION",
                                  style: const TextStyle(color: Colors.white),
                                ),
                          onPressed: _progressBarState
                              ? () {
                                  CustomToast.exceptionToast(
                                      msg: 'Request in Progress');
                                }
                              : () async {
                                  if (_formKey.currentState.validate() &&
                                      radioValue >= 0 &&
                                      radioValue1 >= 0) {
                                    _formKey.currentState.save();
                                    if (_image != null) {
                                      createOrg();
                                    } else {
                                      createOrgWithoutImg();
                                    }
                                    setState(() {
                                      toggleProgressBarState();
                                    });
                                  } else if (radioValue < 0 ||
                                      radioValue1 < 0) {
                                    CustomToast.exceptionToast(
                                        msg: "A choice must be selected");
                                  }
                                },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget addImage() {
    //function which is being called when the image is being add
    return Column(
      children: <Widget>[
        SizedBox(
          height: SizeConfig.safeBlockVertical * 4,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              _showPicker(context);
            },
            child: CircleAvatar(
              radius: SizeConfig.safeBlockVertical * 6.875,
              backgroundColor: UIData.secondaryColor,
              child: _image != null
                  ? CircleAvatar(
                      radius: SizeConfig.safeBlockVertical * 6.5,
                      backgroundImage: FileImage(
                        _image,
                      ),
                    )
                  : CircleAvatar(
                      radius: SizeConfig.safeBlockVertical * 6.5,
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

  void _showPicker(BuildContext context) {
    //this is called when the image is clicked and it shows the options that can be used to take the picture
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  //taking picture from the camera
                  leading: const Icon(Icons.camera_alt_outlined),
                  title: const Text('Camera'),
                  onTap: () {
                    _imgFrom(pickFrom: From.camera);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                    //taking picture from the library
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      _imgFrom(pickFrom: From.gallery);
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          );
        });
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
