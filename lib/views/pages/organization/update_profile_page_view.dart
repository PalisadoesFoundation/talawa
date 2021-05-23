import 'package:flutter/material.dart';
import 'package:talawa/enums/viewstate.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/validator.dart';
import 'package:talawa/view_models/page_view_model/update_profile_page_view_model.dart';
import 'package:talawa/views/base_view.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({Key key, this.userDetails}) : super(key: key);
  final List userDetails;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var _validate = AutovalidateMode.disabled;
    return BaseView<UpdateProfilePageViewModel>(
      onModelReady: (model) => model.initialise(userDetails, context),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              AppLocalizations.of(context).translate('Update Profile'),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            subtitle: Text(
              AppLocalizations.of(context)
                  .translate('Keep your profile upto date'),
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          autovalidateMode: _validate,
          child: ListView(
            children: <Widget>[
              addImage(context, model),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 2.5,
              ),
              model.userProfileImage != null
                  ? IconButton(
                      icon: Icon(
                        Icons.delete,
                        size: SizeConfig.safeBlockVertical * 3.75,
                        color: Colors.red,
                      ),
                      onPressed: () => model.setProfileImage(null))
                  : Container(),
              _buildTextField(
                "First Name",
                model.userDetails[0].firstName.toString(),
                model.setUserFirstName,
                context,
              ),
              _buildTextField(
                "Last Name",
                model.userDetails[0].lastName.toString(),
                model.setUserLastname,
                context,
              ),
              _buildTextField(
                "Email",
                model.userDetails[0].email.toString(),
                model.setUserEmail,
                context,
              ),
              Container(
                margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
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
                      model.updateProfile();
                    }
                  },
                  icon: model.state == ViewState.busy
                      ? SizedBox(
                          height: SizeConfig.safeBlockVertical * 1.75,
                          width: SizeConfig.safeBlockHorizontal * 3.5,
                          child: const CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),
                        )
                      : const Icon(
                          Icons.update,
                          color: Colors.white,
                        ),
                  label: Text(
                    AppLocalizations.of(context).translate('Update Profile'),
                    style: const TextStyle(
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
    );
  }

  Container _buildTextField(String labelText, String initialValue,
      Function function, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockVertical * 2.5,
          vertical: SizeConfig.safeBlockVertical),
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockVertical * 2.5,
          vertical: SizeConfig.safeBlockVertical * 2.0),
      child: TextFormField(
        style: const TextStyle(fontSize: 20),
        keyboardType: TextInputType.name,
        validator: (value) => Validator.validateLastName(value, context),
        enableSuggestions: true,
        cursorRadius: const Radius.circular(10),
        cursorColor: Colors.blue[800],
        textCapitalization: TextCapitalization.words,
        initialValue: initialValue,
        onSaved: (firstName) {
          function(firstName);
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          labelText: AppLocalizations.of(context).translate(labelText),
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
    );
  }

  //widget used to add the image
  Widget addImage(BuildContext context, UpdateProfilePageViewModel model) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 2),
      child: Center(
        child: GestureDetector(
          onTap: () {
            _showPicker(context, model);
          },
          child: CircleAvatar(
            radius: SizeConfig.safeBlockVertical * 6.875,
            backgroundColor: model.userProfileImage != null
                ? UIData.secondaryColor
                : Colors.grey[300],
            child: model.userProfileImage != null
                ? CircleAvatar(
                    radius: SizeConfig.safeBlockVertical * 6.5,
                    backgroundImage: FileImage(
                      model.userProfileImage,
                    ),
                  )
                : CircleAvatar(
                    radius: SizeConfig.safeBlockVertical * 6.5,
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.grey[800],
                      size: SizeConfig.safeBlockVertical * 5.625,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  //used to show the method user want to choose their pictures
  void _showPicker(BuildContext context, UpdateProfilePageViewModel model) {
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
              maxHeight: SizeConfig.screenHeight * 0.8,
              minHeight: SizeConfig.screenHeight * 0.1,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: SizeConfig.safeBlockVertical * 1.25),
                const Icon(
                  Icons.maximize,
                  size: 30,
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 0.75),
                Center(
                  child: Text(
                    AppLocalizations.of(context)
                        .translate('Update your profile picture'),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 0.75),
                const Divider(),
                Wrap(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.camera_alt_outlined),
                      title: Text(
                          AppLocalizations.of(context).translate('Camera')),
                      onTap: () {
                        model.getImageFromCamera();
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                        leading: const Icon(Icons.photo_library),
                        title: Text(AppLocalizations.of(context)
                            .translate('Photo Library')),
                        onTap: () {
                          model.getImageFromGallery();
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
