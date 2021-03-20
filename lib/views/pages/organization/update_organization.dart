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

class UpdateOrganization extends StatefulWidget {
  @override
  _UpdateOrganizationState createState() => _UpdateOrganizationState();
}

class _UpdateOrganizationState extends State<UpdateOrganization> {
  final orgNameController = TextEditingController();
  final orgDescController = TextEditingController();
  final orgMemberDescController = TextEditingController();
  Queries _queries = Queries();
  bool _progressBarState = false;
  bool _validate = false;
  final _formKey = GlobalKey<FormState>();
  int radioValue = -1;
  int radioValue1 = -1;
  bool isPublic = true;
  bool isVisible = true;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  FToast fToast;
  Preferences _preferences = Preferences();
  AuthController _authController = AuthController();
  Queries _query = Queries();

  //providing with the initial states to the variables
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    fetchOrg();
  }

  Future fetchOrg() async {
    final String orgId = await _preferences.getCurrentOrgId();
    if (orgId != null) {
      GraphQLClient _client = graphQLConfiguration.authClient();
      QueryResult result = await _client
          .query(QueryOptions(documentNode: gql(_query.fetchOrgById(orgId))));
      if (result.hasException) {
        print(result.exception);
      } else if (!result.hasException) {
        orgDescController.text = result.data['organizations'][0]['description'];
        orgNameController.text = result.data['organizations'][0]['name'];
        radioValue = result.data['organizations'][0]['isPublic'] ? 0 : 1;
        radioValue1 = result.data['organizations'][0]['visibleInSearch'] == null
            ? -1
            : result.data['organizations'][0]['visibleInSearch']
                ? 0
                : 1;
        setState(() {});
        //radioValue1 = result.data['organizations'][0]['name'];
      }
    }
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
                    autovalidate: _validate,
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
                          Text('Do you want your organization to be public?',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
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
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
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
                            child: RaisedButton(
                              padding: EdgeInsets.all(16.0),
                              shape: StadiumBorder(),
                              child: _progressBarState
                                  ? const CircularProgressIndicator()
                                  : Text(
                                      "UPDATE ORGANIZATION",
                                      style: TextStyle(color: Colors.white),
                                    ),
                              color: UIData.secondaryColor,
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

  //a method which is called when the result is an exception
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
      toastDuration: Duration(seconds: 3),
    );
  }
}
