import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/edit_profile_view_model.dart';
import 'package:talawa/views/base_view.dart';

/// EditProfilePage returns a widget that has mutable state _EditProfilePageState.
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

/// _EditProfilePageState returns a widget for a Page to edit the user profile.
class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<EditProfilePageViewModel>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        return Scaffold(
          key: const Key('EditProfileScreenScaffold'),
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0.0,
            title: Text(
              AppLocalizations.of(context)!.strictTranslate('Profile'),
              key: const Key('ProfileText'),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.screenHeight! * 0.03,
                  ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.068,
                ),
                Center(
                  child: Stack(
                    children: [
                      // if the profile pic is not empty then render Circle Avatar with image as background image
                      // else render Circle Avatar with grey background color.
                      CircleAvatar(
                        key: const Key('profilepic'),
                        radius: SizeConfig.screenHeight! * 0.082,
                        backgroundImage: model.imageFile != null
                            ? Image.file(
                                model.imageFile!,
                                fit: BoxFit.fitWidth,
                              ).image
                            : model.user.image != null
                                ? NetworkImage(model.user.image!)
                                : null,
                        backgroundColor:
                            model.imageFile == null && model.user.image == null
                                ? Colors.grey.withOpacity(0.2)
                                : null,
                        child: model.imageFile == null
                            ? model.user.image == null
                                ? Text(
                                    '${model.user.firstName![0].toUpperCase()}${model.user.lastName![0].toUpperCase()}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  )
                                : null
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          key: const Key('AddRemoveImageButton'),
                          onTap: () {
                            // modal sheet for image selection from camera or gallery.
                            model.imageFile == null
                                ? showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height:
                                            SizeConfig.screenHeight! * 0.135,
                                        padding: const EdgeInsets.all(17),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            _createModalSheetButton(
                                              context,
                                              Icons.camera_alt,
                                              'Camera',
                                              () {
                                                Navigator.of(context).pop();
                                                model.selectImage(
                                                  camera: true,
                                                );
                                              },
                                            ),
                                            _createModalSheetButton(
                                              context,
                                              Icons.photo_library,
                                              'Gallery',
                                              () {
                                                Navigator.of(context).pop();
                                                model.selectImage();
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                : model.removeImage();
                          },
                          child: CircleAvatar(
                            radius: SizeConfig.screenHeight! * 0.034,
                            backgroundColor: model.imageFile == null
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.secondary,
                            child: model.imageFile == null
                                ? const Icon(
                                    Icons.photo_camera,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.068,
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          // Flexible is a widget that controls how a child of a Row, Column, or Flex flexes.
                          Flexible(
                            // Text field for first name with value text of user's first name.
                            child: TextFormField(
                              controller: model.firstNameTextController
                                ..text = model.user.firstName!,
                              focusNode: model.firstNameFocus,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!
                                    .strictTranslate('First Name'),
                                labelStyle:
                                    Theme.of(context).textTheme.titleMedium,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                prefixIcon: const Icon(Icons.person),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    FocusScope.of(context).requestFocus(
                                      model.firstNameFocus,
                                    );
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            // Text field for first name with value text of user's last name.
                            child: TextFormField(
                              controller: model.lastNameTextController
                                ..text = model.user.lastName!,
                              focusNode: model.lastNameFocus,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!
                                    .strictTranslate('Last Name'),
                                labelStyle:
                                    Theme.of(context).textTheme.titleMedium,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                prefixIcon: const Icon(Icons.person),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    FocusScope.of(context).requestFocus(
                                      model.lastNameFocus,
                                    );
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.027,
                        width: SizeConfig.screenWidth! * 0.055,
                        child: const Icon(Icons.email),
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth! * 0.045,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .strictTranslate('Email'),
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                          ),
                          // Text for first name with value text of user's first name.
                          Text(
                            model.user.email!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                TextButton(
                  key: const Key('updatebtn'),
                  onPressed: () {
                    model.updateUserProfile(
                      firstName: model.firstNameTextController.text,
                      newImage: model.imageFile,
                      lastName: model.lastNameTextController.text,
                    );
                    FocusScope.of(context).unfocus();
                  },
                  child: Text(
                    AppLocalizations.of(context)!.strictTranslate('Update'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Button for the different image selection methods.
  ///
  /// **params**:
  /// * `context`:context for the sheet
  /// * `icon`: icon for the method
  /// * `label`: label for the method
  /// * `onTap`: onTap funtionality for the method
  ///
  /// **returns**:
  /// * `Widget`: Icon Button for selecting different image selection method.
  Widget _createModalSheetButton(
    BuildContext context,
    IconData icon,
    String label,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      key: Key('select$label'),
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            size: SizeConfig.screenHeight! * 0.05,
          ),
          Text(AppLocalizations.of(context)!.strictTranslate(label)),
        ],
      ),
    );
  }
}
