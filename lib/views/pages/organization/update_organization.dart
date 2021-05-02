//flutter packages
import 'package:flutter/material.dart';

//pages called are here
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/validator.dart';
import 'package:talawa/views/pages/organization/profile_page.dart';
import 'package:talawa/views/widgets/text_field_decoration.dart';

class UpdateOrganization extends StatefulWidget {
  const UpdateOrganization(
      {this.isPublic, this.description, this.isVisible, this.name});

  final String description;
  final String name;
  final int isPublic;
  final int isVisible;
  @override
  _UpdateOrganizationState createState() => _UpdateOrganizationState();
}

class _UpdateOrganizationState extends State<UpdateOrganization> {
  final orgNameController = TextEditingController();
  final orgDescController = TextEditingController();
  final orgMemberDescController = TextEditingController();
  final Queries _queries = Queries();
  bool _progressBarState = false;
  final AutovalidateMode _validate = AutovalidateMode.disabled;
  final _formKey = GlobalKey<FormState>();
  int radioValue = -1;
  int radioValue1 = -1;
  bool isPublic = true;
  bool isVisible = true;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  final Preferences _preferences = Preferences();
  final AuthController _authController = AuthController();

  //providing with the initial states to the variables
  @override
  void initState() {
    super.initState();
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
    final GraphQLClient _client = graphQLConfiguration.authClient();
    final QueryResult result = await _client.mutate(MutationOptions(
        documentNode: gql(_queries.updateOrg(
      currentOrgId,
      orgNameController.text,
      orgDescController.text,
      isPublic: isPublic,
      visibleInSearch: isVisible,
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
      CustomToast.exceptionToast(msg: result.exception.toString());
    } else if (!result.hasException && !result.loading) {
      setState(() {
        _progressBarState = true;
      });
      CustomToast.sucessToast(msg: "Success!");
      pushNewScreen(
        context,
        screen: const ProfilePage(),
      );
    }
  }

  Widget getRadioButton(int group, int count, {bool public}) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        count,
        (index) => RadioListTile(
          groupValue: group,
          title: Text(index == 0 ? 'Yes' : 'No'),
          value: index,
          activeColor: UIData.secondaryColor,
          onChanged: (int val) {
            FocusScope.of(context).unfocus();
            // ignore: void_checks
            setState(() {
              public ? radioValue = val : radioValue1 = val;
              if (radioValue == 0) {
                return public ? isPublic : isVisible;
              } else if (radioValue == 1) {
                if (public) {
                  isPublic = false;
                } else {
                  isVisible = false;
                }
                return public ? isPublic : isVisible;
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
          title: const Text(
            'Update Organization',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: radioValue == null
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  scrollDirection: Axis.vertical,
                  child: Form(
                    key: _formKey,
                    autovalidateMode: _validate,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Column(
                        children: <Widget>[
                          const Image(
                              image: AssetImage('assets/images/team.png')),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) =>
                                Validator.validateOrgName(value),
                            textAlign: TextAlign.left,
                            textCapitalization: TextCapitalization.words,
                            style: const TextStyle(color: Colors.black),
                            decoration: FormFieldFormatting.formFieldFormatting(
                              hintText: "Organization Name",
                              labelText: 'My Organization',
                              prefixIcon: Icons.group,
                            ),
                            controller: orgNameController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            textCapitalization: TextCapitalization.words,
                            validator: (value) =>
                                Validator.validateOrgDesc(value),
                            textAlign: TextAlign.left,
                            style: const TextStyle(color: Colors.black),
                            decoration: FormFieldFormatting.formFieldFormatting(
                                hintText: "My Description",
                                labelText: "Organization Description",
                                prefixIcon: Icons.note_sharp),
                            controller: orgDescController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            autofillHints: const <String>[AutofillHints.impp],
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            textCapitalization: TextCapitalization.words,
                            validator: (value) =>
                                Validator.validateOrgAttendeesDesc(value),
                            textAlign: TextAlign.left,
                            style: const TextStyle(color: Colors.black),
                            decoration: FormFieldFormatting.formFieldFormatting(
                                hintText: "Member Description",
                                labelText: "Member Description",
                                prefixIcon: Icons.note_sharp),
                            controller: orgMemberDescController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                              'Do you want your organization to be public?',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                          getRadioButton(radioValue, 2, public: true),
                          const Text(
                              'Do you want others to be able to find your organization from the search page?',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                          getRadioButton(radioValue1, 2, public: false),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 30.0),
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
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
                                  CustomToast.exceptionToast(
                                      msg: "A choice must be selected");
                                }
                              },
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
                                  : const Text(
                                      "UPDATE ORGANIZATION",
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ));
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
