// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/edit_profile_view_model.dart';
import 'package:talawa/views/base_view.dart';

/// EditProfilePage returns a widget that has mutable state _EditProfilePageState.
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

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
            // returns a header for the page.
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0.0,
            title: Text(
              // Title of the app bar(header).
              AppLocalizations.of(context)!.strictTranslate('Profile'),
              key: const Key('ProfileText'),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
            ),
          ),
          body: SingleChildScrollView(
            // SingleChildScrollView is a box in which a single widget can be scrolled.
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
                      model.imageFile != null
                          ? CircleAvatar(
                              radius: SizeConfig.screenHeight! * 0.082,
                              backgroundImage: Image.file(
                                model.imageFile!,
                                fit: BoxFit.fitWidth,
                              ).image,
                            )
                          : model.user.image != null
                              ? CircleAvatar(
                                  key: const Key('UserImageInDb'),
                                  radius: SizeConfig.screenHeight! * 0.082,
                                  backgroundImage:
                                      NetworkImage(model.user.image!),
                                )
                              : CircleAvatar(
                                  key: const Key('UserImageNotInDb'),
                                  radius: SizeConfig.screenHeight! * 0.082,
                                  backgroundColor: Colors.grey.withOpacity(0.2),
                                  child: Text(
                                    model.user.firstName!
                                            .substring(0, 1)
                                            .toUpperCase() +
                                        model.user.lastName!
                                            .substring(0, 1)
                                            .toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          // button to remove or set the profile image.
                          key: const Key('AddRemoveImageButton'),
                          onTap: () {
                            // if image is null the function will be get getImageFromGallery()
                            // else removeImage()
                            model.imageFile == null
                                ? model.getImageFromGallery()
                                : model.removeImage();
                          },
                          child: model.imageFile == null
                              ? CircleAvatar(
                                  radius: SizeConfig.screenHeight! * 0.034,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  child: const Icon(
                                    Icons.photo_camera,
                                    color: Colors.white,
                                  ),
                                )
                              : CircleAvatar(
                                  radius: SizeConfig.screenHeight! * 0.02,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      )
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
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                // button to update the profile.
                TextButton(
                  onPressed: () async {},
                  child: Text(
                    AppLocalizations.of(context)!.strictTranslate('Update'),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
