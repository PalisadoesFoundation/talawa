import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/view_models/page_view_model/create_organization_page_view_model.dart';

Widget addImage(CreateOrganizationViewModel model, BuildContext context) {
  //function which is being called when the image is being add
  return Column(
    children: <Widget>[
      SizedBox(
        height: SizeConfig.safeBlockVertical * 4,
      ),
      Center(
        child: GestureDetector(
          onTap: () {
            _showPicker(context, model);
          },
          child: CircleAvatar(
            radius: SizeConfig.safeBlockVertical * 6.875,
            backgroundColor: UIData.secondaryColor,
            child: model.image != null
                ? CircleAvatar(
                    radius: SizeConfig.safeBlockVertical * 6.5,
                    backgroundImage: FileImage(
                      model.image,
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

void _showPicker(BuildContext context, CreateOrganizationViewModel model) {
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
                title: Text(AppLocalizations.of(context).translate('Camera')),
                onTap: () {
                  model.getImageFromCamera();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                  //taking picture from the library
                  leading: const Icon(Icons.photo_library),
                  title: Text(
                      AppLocalizations.of(context).translate('Photo Library')),
                  onTap: () {
                    model.getImageFromGallery();
                    Navigator.of(context).pop();
                  }),
            ],
          ),
        );
      });
}

Padding buildTextFormField(
  bool bigInput,
  String Function(String, BuildContext) validateFunction,
  IconData prefixIconData,
  TextEditingController controller,
  String labelText,
  String hintText,
  BuildContext context,
) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 2.5),
    child: TextFormField(
      keyboardType: TextInputType.multiline,
      inputFormatters: [LengthLimitingTextInputFormatter(bigInput ? 40 : 5000)],
      // autofillHints: const <String>[AutofillHints.organizationName],
      validator: (value) => validateFunction(value, context),
      textAlign: TextAlign.left,
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.next,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: UIData.secondaryColor),
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: Icon(
          prefixIconData,
          color: UIData.secondaryColor,
        ),
        labelText: AppLocalizations.of(context)
            .translate(labelText ?? "Organization Name"),
        labelStyle: const TextStyle(color: Colors.black),
        alignLabelWithHint: true,
        hintText: AppLocalizations.of(context)
            .translate(hintText ?? 'My Organization'),
        hintStyle: const TextStyle(color: Colors.grey),
      ),
      controller: controller,
    ),
  );
}
