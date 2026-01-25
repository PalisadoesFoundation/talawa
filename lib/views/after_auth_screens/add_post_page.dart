import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
=======
import 'package:talawa/locator.dart';
>>>>>>> upstream/develop
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/add_post_view_models/add_post_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_avatar.dart';

<<<<<<< HEAD
/// Add Post View Model.
late AddPostViewModel model;

=======
>>>>>>> upstream/develop
/// AddPost returns a widget to add(upload) the post.
class AddPost extends StatefulWidget {
  const AddPost({super.key, this.drawerKey});

  /// DrawerKey.
  final GlobalKey<ScaffoldState>? drawerKey;
<<<<<<< HEAD

=======
>>>>>>> upstream/develop
  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    // final Uint8List imageBytes = base64Decode(sampleBase64Image);
    // final Uint8List bytes = BASE64.decode(_base64);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // header for the widget
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.9,
        centerTitle: true,
        // header title
        title: Text(
          AppLocalizations.of(context)!.strictTranslate('Share News'),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
        ),
        leading: IconButton(
          //TODO: showing the null pointer exception
          key: const Key('add_post_icon_button1'),
          color: Theme.of(context).iconTheme.color,
          icon: const Icon(
            Icons.arrow_back,
            size: 36,
          ),
          onPressed: () {
            navigationService.pop();
          },
        ),
        // button to upload the post.
        actions: [
          TextButton(
            key: const Key('add_post_text_btn1'),
            onPressed: () async {
              await model.uploadPost();
              navigationService.pop();
              // convertImageToBase64(sampleBase64Image);
            },
            child: Text(
              AppLocalizations.of(context)!.strictTranslate("Post"),
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
          ),
          // Image.memory(imageBytes)
        ],
      ),
      body: BaseView<AddPostViewModel>(
        onModelReady: (m) {
          m.initialise();
          model = m;
        },
        builder: (context, model, child) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CustomAvatar(
                    isImageNull: model.userPic == null,
                    firstAlphabet: model.userName.substring(0, 1).toUpperCase(),
                    imageUrl: model.userPic,
                    fontSize: SizeConfig.screenHeight! * 0.018,
                  ),
                  title: Text(model.userName),
                  subtitle: Text(
                    AppLocalizations.of(context)!
                        .strictTranslate(model.orgName),
                  ),
                ),
                // renders icon button to upload post files.
                Row(
                  children: <Widget>[
                    // button to select the photo from gallery.
                    IconButton(
                      key: const Key('add_post_icon_button2'),
                      onPressed: () => model.getImageFromGallery(),
                      icon: const Icon(Icons.photo),
                    ),
                    // button to capture the image.
                    IconButton(
                      key: const Key('add_post_icon_button3'),
                      onPressed: () => model.getImageFromGallery(camera: true),
                      icon: const Icon(Icons.camera_alt),
                    ),
                    // button to add hastags to the post.
                    TextButton(
                      key: const Key('add_post_text_btn2'),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                AppLocalizations.of(context)!
                                    .strictTranslate("Enter the Tag"),
                              ),
                              content: TextField(
                                controller: model.textHashTagController,
                              ),
                              actions: [
                                TextButton(
                                  key: const Key("add_hashtag_button"),
                                  onPressed: () {
                                    navigationService.showTalawaErrorSnackBar(
                                      "The tag was added",
                                      MessageType.info,
                                    );
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .strictTranslate("Add"),
                                  ),
                                ),
                                TextButton(
                                  key: const Key("cancel_hashtag_button"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .strictTranslate("Cancel"),
=======
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BaseView<AddPostViewModel>(
      onModelReady: (model) {
        model.initialise();
      },
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: colorScheme.surface,
          appBar: AppBar(
            backgroundColor: colorScheme.surface,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
              key: const Key('add_post_back_button'),
              onPressed: () => navigationService.pop(),
              icon: Icon(
                Icons.close,
                color: colorScheme.onSurface,
                size: 28,
              ),
            ),
            title: Text(
              AppLocalizations.of(context)!.strictTranslate('New Post'),
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            centerTitle: true,
            actions: [
              TextButton(
                key: const Key('add_post_share_button'),
                onPressed: model.canUploadPost()
                    ? () async {
                        await model.uploadPost();
                        navigationService.pop();
                      }
                    : null,
                child: Text(
                  AppLocalizations.of(context)!.strictTranslate("Share"),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: model.canUploadPost()
                        ? colorScheme.primary
                        : theme.disabledColor,
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CustomAvatar(
                      isImageNull: model.userPic == null,
                      firstAlphabet:
                          model.userName.substring(0, 1).toUpperCase(),
                      imageUrl: model.userPic,
                      fontSize: 16,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.userName,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .strictTranslate(model.orgName),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.outline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: colorScheme.outline),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Caption text field
                      TextField(
                        key: const Key('caption_text_field'),
                        controller: model.captionController,
                        maxLines: null,
                        minLines: 3,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                        decoration: InputDecoration(
                          hintText:
                              AppLocalizations.of(context)!.strictTranslate(
                            "Write a caption...",
                          ),
                          hintStyle: theme.textTheme.bodyLarge?.copyWith(
                            color: colorScheme.outline,
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        onChanged: (_) => setState(() {}),
                      ),

                      const SizedBox(height: 20),

                      // Images section
                      if (model.imageFiles.isNotEmpty) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .strictTranslate("Photos"),
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              "${model.imageCount}/${AddPostViewModel.maxImages}",
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.outline,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 1,
                          ),
                          itemCount: model.imageFiles.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    model.imageFiles[index],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: GestureDetector(
                                    onTap: () => model.removeImageAt(index),
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
>>>>>>> upstream/develop
                                  ),
                                ),
                              ],
                            );
                          },
<<<<<<< HEAD
                        );
                      },
                      child: Text(
                        model.textHashTagController.text == ""
                            ? '# ${AppLocalizations.of(context)!.strictTranslate("Add tag")}'
                            : model.textHashTagController.text,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: model.titleController,
                    // input field to write the description of the post.
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: AppLocalizations.of(context)!.strictTranslate(
                        "Enter the title of your post",
                      ),
                      label: Text(
                        AppLocalizations.of(context)!.strictTranslate(
                          "Title",
                        ),
                      ),
                    ),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: model.controller,
                    maxLines: null,
                    // input field to write the description of the post.
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: AppLocalizations.of(context)!.strictTranslate(
                        "Write here what do you want to share",
                      ),
                    ),
                  ),
                ),
                // if the image for the post is added then render button to remove it.
                model.imageFile != null
                    // ignore: sized_box_for_whitespace
                    ? Container(
                        height: 230,
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            // Image.file(
                            //   model.imageFile!,
                            //   fit: BoxFit.cover,
                            //   width: MediaQuery.of(context).size.width,
                            // ),
                            Image.file(model.imageFile!),
                            Positioned(
                              right: 5,
                              top: 5,
                              child: IconButton(
                                key: const Key("remove_icon"),
                                onPressed: () {
                                  model.removeImage();
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          );
        },
      ),
=======
                        ),
                        const SizedBox(height: 20),
                      ],

                      // Add photos section
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: colorScheme.outline),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: model.imageCount <
                                              AddPostViewModel.maxImages
                                          ? () => model.getImageFromGallery()
                                          : null,
                                      borderRadius: BorderRadius.circular(8),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 16,
                                          horizontal: 12,
                                        ),
                                        decoration: BoxDecoration(
                                          color: model.imageCount <
                                                  AddPostViewModel.maxImages
                                              ? colorScheme.primaryContainer
                                              : colorScheme.surfaceContainer,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.photo_library_outlined,
                                              color: model.imageCount <
                                                      AddPostViewModel.maxImages
                                                  ? colorScheme.primary
                                                  : colorScheme.outline,
                                              size: 32,
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .strictTranslate("Gallery"),
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                color: model.imageCount <
                                                        AddPostViewModel
                                                            .maxImages
                                                    ? colorScheme.onSurface
                                                    : colorScheme.outline,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                // Camera button
                                Expanded(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: model.imageCount <
                                              AddPostViewModel.maxImages
                                          ? () => model.getImageFromGallery(
                                                camera: true,
                                              )
                                          : null,
                                      borderRadius: BorderRadius.circular(8),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 16,
                                          horizontal: 12,
                                        ),
                                        decoration: BoxDecoration(
                                          color: model.imageCount <
                                                  AddPostViewModel.maxImages
                                              ? colorScheme.primaryContainer
                                              : colorScheme.surfaceContainer,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.camera_alt_outlined,
                                              color: model.imageCount <
                                                      AddPostViewModel.maxImages
                                                  ? colorScheme.primary
                                                  : colorScheme.outline,
                                              size: 32,
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .strictTranslate("Camera"),
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                color: model.imageCount <
                                                        AddPostViewModel
                                                            .maxImages
                                                    ? colorScheme.onSurface
                                                    : colorScheme.outline,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (model.imageCount >=
                                AddPostViewModel.maxImages) ...[
                              const SizedBox(height: 12),
                              Text(
                                AppLocalizations.of(context)!.strictTranslate(
                                  "Maximum ${AddPostViewModel.maxImages} photos allowed",
                                ),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.outline,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Required image notice
                      if (model.imageFiles.isEmpty)
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: colorScheme.errorContainer,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: colorScheme.error),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: colorScheme.error,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context)!.strictTranslate(
                                    "At least one image is required to create a post",
                                  ),
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onErrorContainer,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
>>>>>>> upstream/develop
    );
  }
}
