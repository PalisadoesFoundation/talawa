//flutter packages
import 'package:flutter/material.dart';

//pages called are here
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talawa/views/pages/organization/profile_page.dart';
import 'package:talawa/views/widgets/text_field_decoration.dart';
import 'package:talawa/views/widgets/toast_tile.dart';

class UpdateOrganization extends StatefulWidget {
  final String description;
  final String name;
  final int isPublic;
  final int isVisible;
  UpdateOrganization(
      {this.isPublic, this.description, this.isVisible, this.name});
  @override
  _UpdateOrganizationState createState() => _UpdateOrganizationState();
}

class _UpdateOrganizationState extends State<UpdateOrganization> {
  final orgNameController = TextEditingController();
  final orgDescController = TextEditingController();
  final orgMemberDescController = TextEditingController();
  Queries _queries = Queries();
  bool _progressBarState = false;
  AutovalidateMode _validate = AutovalidateMode.disabled;
  final _formKey = GlobalKey<FormState>();
  int radioValue = -1;
  int radioValue1 = -1;
  bool isPublic = true;
  bool isVisible = true;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  FToast fToast;
  Preferences _preferences = Preferences();
  AuthController _authController = AuthController();

  //providing with the initial states to the variables
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    orgNameController.text = widget.name;
    orgDescController.text = widget.description;
    radioValue = widget.isPublic;
    radioValue1 = widget.isVisible;
  }

  //this method shows the toggle bar
  void toggleProgressBarState() {
    _progressBarState = !_progressBarState;
  }

  //this method is used if we want to update the organization
  updateOrg() async {
    final String currentOrgId = await _preferences.getCurrentOrgId();
    orgNameController.text =
        orgNameController.text.trim().replaceAll('\n', ' ');
    orgDescController.text =
        orgDescController.text.trim().replaceAll('\n', ' ');
    orgMemberDescController.text =
        orgMemberDescController.text.trim().replaceAll('\n', ' ');
    GraphQLClient _client = graphQLConfiguration.authClient();
    QueryResult result = await _client.mutate(MutationOptions(
        documentNode: gql(_queries.updateOrg(
      currentOrgId,
      orgNameController.text,
      orgDescController.text,
      isPublic,
      isVisible,
    ))));

    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      return updateOrg();
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      print(result.exception);
      setState(() {
        _progressBarState = false;
      });
      _exceptionToast(result.exception.toString().substring(16));
    } else if (!result.hasException && !result.loading) {
      setState(() {
        _progressBarState = true;
      });
      _successToast("Success!");
      pushNewScreen(
        context,
        screen: ProfilePage(),
      );
    }
  }

  Widget getRadioButton(int group, int count,bool public) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(
        count,
        (index) => RadioListTile(
          groupValue: group,
          title: Text(index==0?'Yes':'No'),
          value: index,
          activeColor: UIData.secondaryColor,
          onChanged: (val) {
            FocusScope.of(context).unfocus();
            setState(() {
              public?radioValue = val:radioValue1=val;
              if (radioValue == 0) {
                return public?isPublic:isVisible;
              }else if (radioValue == 1) {
                if (public) {
                  isPublic = false;
                }else{
                  isVisible = false;
                }
                return public?isPublic:isVisible;
              }
            });
          },
        ),
      ),
    );
  }

  //the main build starts here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Update Organization',
                style: TextStyle(color: Colors.white))),
        body: Container(
          color: Colors.white,
          child: radioValue == null
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 10.0),
                  scrollDirection: Axis.vertical,
                  child: Form(
                    key: _formKey,
                    autovalidateMode: _validate,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Column(
                        children: <Widget>[
                          Image(image: AssetImage('assets/images/team.png')),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) =>
                                Validator.validateOrgName(value),
                            textAlign: TextAlign.left,
                            textCapitalization: TextCapitalization.words,
                            style: TextStyle(color: Colors.black),
                            decoration: FormFieldFormatting.formFieldFormatting(
                              hintText: "Organization Name",
                              labelText: 'My Organization',
                              prefixIcon: Icons.group,
                            ),
                            controller: orgNameController,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            textCapitalization: TextCapitalization.words,
                            validator: (value) =>
                                Validator.validateOrgDesc(value),
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black),
                            decoration: FormFieldFormatting.formFieldFormatting(
                                hintText: "My Description",
                                labelText: "Organization Description",
                                prefixIcon: Icons.note_sharp),
                            controller: orgDescController,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            autofillHints: <String>[AutofillHints.impp],
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            textCapitalization: TextCapitalization.words,
                            validator: (value) =>
                                Validator.validateOrgAttendeesDesc(value),
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black),
                            decoration: FormFieldFormatting.formFieldFormatting(
                                hintText: "Member Description",
                                labelText: "Member Description",
                                prefixIcon: Icons.note_sharp),
                            controller: orgMemberDescController,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Do you want your organization to be public?',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                          getRadioButton(radioValue,2,true),
                          Text(
                              'Do you want others to be able to find your organization from the search page?',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                          getRadioButton(radioValue1,2,false),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 30.0),
                            width: double.infinity,
                            child:ElevatedButton(
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
                                      "UPDATE ORGANIZATION",
                                      style: TextStyle(color: Colors.white),
                                    ),
                              onPressed: () async {
                                if (_formKey.currentState.validate() &&
                                    radioValue >= 0 &&
                                    radioValue1 >= 0) {
                                  _formKey.currentState.save();
                                  updateOrg();
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
                ),
        ));
  }

  //a message if the result is successful
  _successToast(String msg) {
    fToast.showToast(
      child: ToastTile(msg: msg, success: true),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 1),
    );
  }

  //a method which is called when the result is an exception
  _exceptionToast(String msg) {
    fToast.showToast(
      child: ToastTile(msg: msg, success: false),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }
}
