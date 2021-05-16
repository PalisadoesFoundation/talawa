//flutter packages
import 'package:flutter/material.dart';
//pages are imported here
import 'package:talawa/enums/viewstate.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/validator.dart';
import 'package:talawa/view_models/page_view_model/create_organization_page_viewModel.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/views/pages/organization/Create%20Organization/create_organization_UI_Helper.dart';

class CreateOrganization extends StatefulWidget {
  const CreateOrganization({this.isFromProfile = false});
  final bool isFromProfile;

  @override
  _CreateOrganizationState createState() => _CreateOrganizationState();
}

class _CreateOrganizationState extends State<CreateOrganization> {
  final _validate = AutovalidateMode.disabled;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<CreateOrganizationViewModel>(
      onModelReady: (model) => model.initialise(context, widget.isFromProfile),
      builder: (context, model, child) => Scaffold(
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
            padding:
                EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 1.25),
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                addImage(model, context),
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
                            buildTextFormField(
                                false,
                                Validator.validateOrgName,
                                Icons.group,
                                model.orgNameController,
                                "Organization Name",
                                "My Organization"),
                            buildTextFormField(
                                true,
                                Validator.validateOrgName,
                                Icons.note,
                                model.orgDescController,
                                "Organization Description",
                                "My Description"),
                            buildTextFormField(
                                true,
                                Validator.validateOrgAttendeesDesc,
                                Icons.note,
                                model.orgMemberDescController,
                                "Member Description",
                                "Member Description"),
                          ],
                        )),
                        const Text(
                          'Do you want your organization to be public?',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                        RadioListTile(
                          groupValue: model.radioValue,
                          title: const Text('Yes'),
                          value: 0,
                          activeColor: UIData.secondaryColor,
                          onChanged: (int val) {
                            FocusScope.of(context).unfocus();
                            model.setRadioValue(val);
                          },
                        ),
                        RadioListTile(
                          activeColor: UIData.secondaryColor,
                          groupValue: model.radioValue,
                          title: const Text('No'),
                          value: 1,
                          onChanged: (int val) {
                            model.setRadioValue(val);
                            model.setIsPublic(false);
                          },
                        ),
                        const Text(
                          'Do you want others to be able to find your organization from the search page?',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                        RadioListTile(
                          activeColor: UIData.secondaryColor,
                          groupValue: model.radioValue1,
                          title: const Text('Yes'),
                          value: 0,
                          onChanged: (int val) {
                            FocusScope.of(context).unfocus();
                            // ignore: void_checks
                            model.setRadioValue1(val);
                          },
                        ),
                        RadioListTile(
                          activeColor: UIData.secondaryColor,
                          groupValue: model.radioValue1,
                          title: const Text('No'),
                          value: 1,
                          onChanged: (int val) {
                            FocusScope.of(context).unfocus();
                            // ignore: void_checks
                            model.setRadioValue1(val);
                            model.setIsVisible(false);
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
                            child: model.state == ViewState.busy
                                ? const Center(
                                    child: const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: const CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
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
                            onPressed: model.state == ViewState.busy
                                ? () {
                                    CustomToast.exceptionToast(
                                        msg: 'Request in Progress');
                                  }
                                : () async {
                                    if (_formKey.currentState.validate() &&
                                        model.radioValue >= 0 &&
                                        model.radioValue1 >= 0) {
                                      _formKey.currentState.save();
                                      if (model.image != null) {
                                        model.createOrg(true);
                                      } else {
                                        model.createOrg(false);
                                      }
                                      model.toggleProgressBarState();
                                    } else if (model.radioValue < 0 ||
                                        model.radioValue1 < 0) {
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
      ),
    );
  }
}
