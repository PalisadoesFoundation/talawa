
//flutter packages
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//pages are imported here
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql/utilities.dart' show multipartFileFrom;
import 'package:file_picker/file_picker.dart';
import 'package:talawa/views/pages/_pages.dart';
import 'package:image_picker/image_picker.dart';

class CreateOrganization extends StatefulWidget {
  final bool isFromProfile;
  CreateOrganization({this.isFromProfile=false});
  @override
  _CreateOrganizationState createState() => _CreateOrganizationState();
}

class _CreateOrganizationState extends State<CreateOrganization> { //defining the Organization creation state
  final orgNameController = TextEditingController();
  final orgDescController = TextEditingController();
  final orgMemberDescController = TextEditingController();
  Queries _queries = Queries();
  bool _progressBarState = false;
  var _validate = AutovalidateMode.disabled;
  final _formKey = GlobalKey<FormState>();
  int radioValue = -1;
  int radioValue1 = -1;
  bool isPublic = true;
  bool isVisible = true;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  FToast fToast;
  AuthController _authController = AuthController();
  File _image;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  void toggleProgressBarState() {
    _progressBarState = !_progressBarState;
  }

  createOrg() async { //this is the function which will be called when the organization is created
    GraphQLClient _client = graphQLConfiguration.authClient();
    orgNameController.text = orgNameController.text.trim().replaceAll('\n', ' ');
    orgDescController.text = orgDescController.text.trim().replaceAll('\n', ' ');
    orgMemberDescController.text = orgMemberDescController.text.trim().replaceAll('\n', ' ');
    final img = await multipartFileFrom(_image);
    QueryResult result = await _client.mutate(MutationOptions(
      documentNode: gql(_queries.createOrg(
        orgNameController.text,
        orgDescController.text,
        orgMemberDescController.text,
        isPublic,
        isVisible,
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
      _exceptionToast(result.exception.toString());
    } else if (!result.hasException && !result.loading) {
      setState(() {
        _progressBarState = true;
      });
      _successToast("Sucess!");
      print(result.data);

      if(widget.isFromProfile){
        Navigator.pop(context);
        Navigator.pop(context);
      }else {
        Navigator.of(
            context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomePage(openPageIndex: 2,)));
      }
    }
  }

  createOrgWithoutImg() async { //the function is called when we are creating the organization without the display picture
    GraphQLClient _client = graphQLConfiguration.authClient();
    orgNameController.text = orgNameController.text.trim().replaceAll('\n', ' ');
    orgDescController.text = orgDescController.text.trim().replaceAll('\n', ' ');
    orgMemberDescController.text = orgMemberDescController.text.trim().replaceAll('\n', ' ');
    QueryResult result = await _client.mutate(MutationOptions(
      documentNode: gql(_queries.createOrgWithoutImg(
        orgNameController.text,
        orgDescController.text,
        orgMemberDescController.text,
        isPublic,
        isVisible,
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
      _exceptionToast(result.exception.toString());
    } else if (!result.hasException && !result.loading) {
      setState(() {
        _progressBarState = true;
      });
      _successToast("Sucess!");
      print(result.data);
      if(widget.isFromProfile){
        Navigator.pop(context);
        Navigator.pop(context);
      }else {
        Navigator.of(
            context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomePage(openPageIndex: 2,)));
      }
    }
  }

  _imgFromCamera() async { //this is the function when the user want to capture the image from the camera
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }


  _imgFromGallery() async { //this is the function when the user want to take the picture from the gallery
    File image = File(
        (await FilePicker.platform.pickFiles(type: FileType.image))
            .files
            .first
            .path);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Create Organization'),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 10.0),
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              addImage(),
              Text('Upload Organization Image',
                  style: TextStyle(fontSize: 16, color: Colors.black)),
              Form(
                key: _formKey,
                autovalidateMode: _validate,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      AutofillGroup(
                          child: Column(
                        children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(40)
                            ],
                            autofillHints: <String>[
                              AutofillHints.organizationName
                            ],
                            validator: (value) =>
                                Validator.validateOrgName(value),
                            textAlign: TextAlign.left,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: UIData.secondaryColor),
                                  borderRadius: BorderRadius.circular(20.0)),
                              prefixIcon: Icon(
                                Icons.group,
                                color: UIData.secondaryColor,
                              ),
                              labelText: "Organization Name",
                              labelStyle: TextStyle(color: Colors.black),
                              alignLabelWithHint: true,
                              hintText: 'My Organization',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            controller: orgNameController,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(5000)
                            ],
                            autofillHints: <String>[AutofillHints.impp],
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            textCapitalization: TextCapitalization.words,
                            validator: (value) =>
                                Validator.validateOrgDesc(value),
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: UIData.secondaryColor),
                                  borderRadius: BorderRadius.circular(20.0)),
                              prefixIcon: Icon(Icons.note,
                                  color: UIData.secondaryColor),
                              labelText: "Organization Description",
                              labelStyle: TextStyle(color: Colors.black),
                              alignLabelWithHint: true,
                              hintText: 'My Description',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            controller: orgDescController,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(5000)
                            ],
                            autofillHints: <String>[AutofillHints.impp],
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            textCapitalization: TextCapitalization.words,
                            validator: (value) =>
                                Validator.validateOrgAttendeesDesc(value),
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black),
                            decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  borderSide: new BorderSide(
                                      color: UIData.secondaryColor)),
                              prefixIcon: Icon(Icons.note,
                                  color: UIData.secondaryColor),
                              labelText: "Member Description",
                              labelStyle: TextStyle(color: Colors.black),
                              alignLabelWithHint: true,
                              hintText: 'Member Description',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            controller: orgMemberDescController,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )),
                      Text('Do you want your organization to be public?',
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                      RadioListTile(
                        groupValue: radioValue,
                        title: Text('Yes'),
                        value: 0,
                        activeColor: UIData.secondaryColor,
                        onChanged: (val) {
                          FocusScope.of(context).unfocus();
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
                        title: Text('No'),
                        value: 1,
                        onChanged: (val) {
                          FocusScope.of(context).unfocus();
                          setState(() {
                            radioValue = val;
                            if (radioValue == 1) {
                              isPublic = false;
                              return isPublic;
                            }
                          });
                        },
                      ),
                      Text(
                          'Do you want others to be able to find your organization from the search page?',
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                      RadioListTile(
                        activeColor: UIData.secondaryColor,
                        groupValue: radioValue1,
                        title: Text('Yes'),
                        value: 0,
                        onChanged: (val) {
                          FocusScope.of(context).unfocus();
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
                        title: Text('No'),
                        value: 1,
                        onChanged: (val) {
                          FocusScope.of(context).unfocus();
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
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 30.0),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),),
                          child: _progressBarState
                              ? const Center(
                                  child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                        strokeWidth: 3,
                                        backgroundColor: Colors.black,
                                      )))
                              : Text(
                                  "CREATE ORGANIZATION",
                                  style: TextStyle(color: Colors.white),
                                ),
                          onPressed: _progressBarState?(){
                            _exceptionToast('Request in Progress');
                          }:() async {
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
                            } else if (radioValue < 0 || radioValue1 < 0) {
                              _exceptionToast("A choice must be selected");
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

  Widget addImage() { //function which is being called when the image is being add
    return Column(
      children: <Widget>[
        SizedBox(
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

  void _showPicker(context) { //this is called when the image is clicked and it shows the options that can be used to take the picture
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile( //taking picture from the camera
                    leading: Icon(Icons.camera_alt_outlined),
                    title: Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile( //taking picture from the library
                      leading: Icon(Icons.photo_library),
                      title: Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
          );
        });
  }

  _successToast(String msg) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(msg),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 1),
    );
  }

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
          Text(msg),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 1),
    );
  }
}
