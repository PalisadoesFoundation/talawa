import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:talawa/services/Queries.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/validator.dart';
import 'package:talawa/views/pages/nav_page.dart';
import 'package:talawa/views/pages/join_organization.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateOrganization extends StatefulWidget {
  @override
  _CreateOrganizationState createState() => _CreateOrganizationState();
}

class _CreateOrganizationState extends State<CreateOrganization> {
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

  @override
  void initState() {
    super.initState();
    fToast = FToast(context);
    graphQLConfiguration.getToken();

  }

  void toggleProgressBarState() {
    _progressBarState = !_progressBarState;
  }

  createOrg() async {
    GraphQLClient _client = graphQLConfiguration.authClient();

    QueryResult result = await _client.mutate(MutationOptions(
        documentNode: gql(_queries.createOrg(
           orgNameController.text,
          orgDescController.text,
          orgMemberDescController.text,
          isPublic,
          isVisible,
    ))));
    if (result.hasException) {
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
      //Navigate user to join organization screen
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => new HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xffF3F6FF),
          elevation: 0.0,
          brightness: Brightness.light),
      body: Container(
        color: Color(0xffF3F6FF),
        child: SingleChildScrollView(
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
                    height: 10,
                  ),
                  Text('Setup Your Organization',
                      style: TextStyle(fontSize: 20, color: Colors.blue)),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) => Validator.validateOrgName(value),
                    textAlign: TextAlign.left,
                    textCapitalization: TextCapitalization.words,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(20.0)),
                      prefixIcon: Icon(
                        Icons.group,
                        color: Colors.blueAccent,
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
                    validator: (value) => Validator.validateOrgDesc(value),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(20.0)),
                      prefixIcon: Icon(Icons.note, color: Colors.blueAccent),
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
                          borderSide: new BorderSide(color: Colors.blueAccent)),
                      prefixIcon: Icon(Icons.note, color: Colors.blueAccent),
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
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  RadioListTile(
                    groupValue: radioValue,
                    title: Text('Yes'),
                    value: 0,
                    onChanged: (val) {
                      setState(() {
                        radioValue = val;
                         if (radioValue == 0){
                         return isPublic;
                       }
                      });
                    },
                  ),
                  RadioListTile(
                    groupValue: radioValue,
                    title: Text('No'),
                    value: 1,
                    onChanged: (val) {
                      setState(() {
                        radioValue = val;
                         if (radioValue == 1){
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
                    groupValue: radioValue1,
                    title: Text('Yes'),
                    value: 0,
                    onChanged: (val) {
                      setState(() {
                        radioValue1 = val;
                       if (radioValue1 == 0){
                         return isVisible;
                       }
                      });
                    },
                  ),
                  RadioListTile(
                    groupValue: radioValue1,
                    title: Text('No'),
                    value: 1,
                    onChanged: (val) {
                      setState(() {
                        radioValue1 = val;
                         if (radioValue1 == 1){
                           isVisible = false;
                         return isVisible;
                       }
                      });
                    },
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                    width: double.infinity,
                    child: RaisedButton(
                      padding: EdgeInsets.all(16.0),
                      shape: StadiumBorder(),
                      child: _progressBarState
                          ? const CircularProgressIndicator()
                          : Text(
                              "CREATE ORGANIZATION",
                              style: TextStyle(color: Colors.white),
                            ),
                      color: Colors.blueAccent,
                      onPressed: () async {
                        if (_formKey.currentState.validate() && radioValue >= 0 && radioValue1 >= 0) {
                          _formKey.currentState.save();
                          createOrg();
                          setState(() {
                            toggleProgressBarState();
                          });
                        } else if ( radioValue < 0 || radioValue1 < 0) {
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
      ),
    );
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
      toastDuration: Duration(seconds: 3),
    );
  }
}
