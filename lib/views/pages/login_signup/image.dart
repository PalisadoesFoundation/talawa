import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/signup_login_controller.dart';
import 'package:talawa/enums/image_from.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/utils/uidata.dart';

class AddImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 32),
        Center(
          child: GestureDetector(
            onTap: () => _showPicker(context),
            child: CircleAvatar(
              radius: 55,
              backgroundColor: UIData.secondaryColor,
              child: Consumer<SignupLoginController>(
                builder: (context, signupController, _) =>
                    signupController.profileImage != null
                        ? CircleAvatar(
                            radius: 52,
                            backgroundImage: FileImage(
                              signupController.profileImage,
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
          ),
        )
      ],
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(
                    Icons.camera_alt_outlined,
                  ),
                  title: Text(
                    AppLocalizations.of(context).translate('Camera'),
                  ),
                  onTap: () {
                    _imgFrom(pickFrom: From.camera, context: context);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                    leading: const Icon(
                      Icons.photo_library,
                    ),
                    title: Text(
                      AppLocalizations.of(context).translate('Photo Library'),
                    ),
                    onTap: () {
                      _imgFrom(pickFrom: From.gallery, context: context);
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _imgFrom({
    From pickFrom = From.none,
    @required BuildContext context,
  }) async {
    File pickImageFile;
    if (pickFrom != From.none) {
      final PickedFile selectedImage = await ImagePicker().getImage(
        source:
            pickFrom == From.camera ? ImageSource.camera : ImageSource.gallery,
      );
      pickImageFile = File(selectedImage.path);
      await Provider.of<SignupLoginController>(
        context,
        listen: false,
      ).setProfileImage(pickImageFile);
    }
  }
}
