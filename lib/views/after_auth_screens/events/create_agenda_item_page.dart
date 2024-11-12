import 'dart:io';

import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_agenda_category.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';

/// A page for creating a new agenda item for events.
class CreateAgendaItemPage extends StatefulWidget {
  /// Creates an instance of [CreateAgendaItemPage].
  ///
  /// **Params**:
  /// * `model`: An instance of [EventInfoViewModel] to manage agenda item data.
  const CreateAgendaItemPage({super.key, required this.model});

  /// The ViewModel associated with this page.
  final EventInfoViewModel model;

  @override
  _CreateAgendaItemPageState createState() => _CreateAgendaItemPageState();
}

/// State class for [CreateAgendaItemPage].
class _CreateAgendaItemPageState extends State<CreateAgendaItemPage> {
  /// Controller for the agenda item title input field.
  TextEditingController titleController = TextEditingController();

  /// Controller for the agenda item description input field.
  TextEditingController descController = TextEditingController();

  /// Controller for the URL input field.
  TextEditingController urlController = TextEditingController();

  /// Controller for the duration input field.
  TextEditingController durationController = TextEditingController();

  /// Focus node for the title input field.
  FocusNode titleFocus = FocusNode();

  /// Focus node for the description input field.
  FocusNode descFocus = FocusNode();

  /// Focus node for the URL input field.
  FocusNode urlFocus = FocusNode();

  /// Focus node for the duration input field.
  FocusNode durationFocus = FocusNode();

  /// List of selected categories for the agenda item.
  List<AgendaCategory> selectedCategories = [];

  /// List of URLs associated with the agenda item.
  List<String> urls = [];

  /// List of base64 encoded attachments associated with the agenda item.
  List<String> attachments = [];

  /// Service for picking multimedia files.
  late MultiMediaPickerService _multiMediaPickerService;

  @override
  void initState() {
    super.initState();
    // Initialize the multimedia picker service.
    _multiMediaPickerService = locator<MultiMediaPickerService>();
  }

  /// Handles the selection and deselection of categories.
  ///
  /// **params**:
  /// * `category`: The category selected or deselected.
  ///
  /// **returns**:
  ///   None
  void _onCategorySelected(AgendaCategory category) {
    setState(() {
      if (selectedCategories.contains(category)) {
        selectedCategories.remove(category);
      } else {
        selectedCategories.add(category);
      }
      widget.model.setSelectedCategories(
        selectedCategories,
      );
    });
  }

  /// Removes a category from the selected categories list.
  ///
  /// **params**:
  /// * `category`: The category to be removed.
  ///
  /// **returns**:
  ///   None
  void _removeCategory(AgendaCategory category) {
    setState(() {
      selectedCategories.remove(category);
      widget.model.setSelectedCategories(selectedCategories);
    });
  }

  /// method to add urls.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void _addUrl() {
    if (urlController.text.isNotEmpty) {
      setState(() {
        urls.add(urlController.text);
        urlController.clear();
      });
    }
  }

  /// Adds a URL to the list of URLs.
  ///
  /// **params**:
  /// * `url`: url that is to be removed.
  ///
  /// **returns**:
  ///   None
  void _removeUrl(String url) {
    setState(() {
      urls.remove(url);
    });
  }

  /// Picks an attachment using the multimedia picker service.
  ///
  /// **params**:
  /// * `fromCamera`: Indicates if the photo should be picked from the camera.
  ///
  /// **returns**:
  ///   None
  Future<void> _pickAttachment({bool fromCamera = false}) async {
    final File? pickedFile =
        await _multiMediaPickerService.getPhotoFromGallery(camera: fromCamera);
    if (pickedFile != null) {
      final base64PickedFile = await imageService
          .convertToBase64(pickedFile); // Convert the file to base64.
      setState(() {
        attachments
            .add(base64PickedFile); // Add the base64 string to attachments.
      });
    }
  }

  /// Removes an attachment from the list of attachments.
  ///
  /// **params**:
  /// * `image`: The base64 string of the attachment to be removed.
  ///
  /// **returns**:
  ///   None
  void _removeAttachment(String image) {
    setState(() {
      attachments.remove(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    final navigationServiceLocal = locator<NavigationService>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 1,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => navigationServiceLocal.pop(),
          child: const Icon(Icons.close),
        ),
        title: Text(
          AppLocalizations.of(context)!.strictTranslate('Add Agenda Item'),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
        ),
        actions: [
          TextButton(
            key: const Key('addButton'),
            onPressed: () {
              final List<String> categoryIds =
                  selectedCategories.map((category) => category.id!).toList();

              widget.model.createAgendaItem(
                title: titleController.text,
                duration: durationController.text,
                description: descController.text,
                urls: urls,
                categories: categoryIds,
                attachments: attachments,
              );
              Navigator.of(context).pop();
            },
            child: Text(
              key: const Key('add_agenda'),
              AppLocalizations.of(context)!.strictTranslate('Add'),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
          ),
        ],
      ),
      body: Scrollbar(
        thickness: 2,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<AgendaCategory>(
                  key: const Key('create_agenda_item_category_dropdown'),
                  value: selectedCategories.isNotEmpty
                      ? selectedCategories.first
                      : null,
                  onChanged: (AgendaCategory? category) {
                    if (category != null) {
                      _onCategorySelected(category);
                    }
                  },
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!
                        .strictTranslate('Select Categories'),
                    border: const OutlineInputBorder(),
                  ),
                  items: widget.model.categories
                      .map<DropdownMenuItem<AgendaCategory>>(
                          (AgendaCategory category) {
                    return DropdownMenuItem<AgendaCategory>(
                      value: category,
                      child: Text(category.name!),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: selectedCategories.map((category) {
                    return Chip(
                      label: Text(category.name!),
                      onDeleted: () => _removeCategory(category),
                      deleteIconColor: Colors.redAccent,
                    );
                  }).toList(),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.013),
                TextFormField(
                  key: const Key('create_event_agenda_tf1'),
                  textInputAction: TextInputAction.next,
                  controller: titleController,
                  keyboardType: TextInputType.name,
                  maxLength: 20,
                  focusNode: titleFocus,
                  validator: (value) =>
                      Validator.validateEventForm(value!, 'Title'),
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!
                        .strictTranslate('Add Agenda Item Title'),
                    isDense: true,
                    labelStyle: Theme.of(context).textTheme.titleMedium,
                    focusedBorder: InputBorder.none,
                    counterText: "",
                    enabledBorder: InputBorder.none,
                    prefixIcon: Container(
                      transform: Matrix4.translationValues(
                        -SizeConfig.screenWidth! * 0.027,
                        0.0,
                        0.0,
                      ),
                      child: const Icon(
                        Icons.title,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.013),
                TextFormField(
                  key: const Key('create_event_agenda_tf2'),
                  keyboardType: TextInputType.multiline,
                  controller: descController,
                  focusNode: descFocus,
                  validator: (value) =>
                      Validator.validateEventForm(value!, 'Description'),
                  maxLines: 10,
                  minLines: 1,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!
                        .strictTranslate('Describe the event'),
                    labelText: AppLocalizations.of(context)!
                        .strictTranslate('Add Description'),
                    labelStyle: Theme.of(context).textTheme.titleMedium,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    prefixIcon: Container(
                      transform: Matrix4.translationValues(
                        -SizeConfig.screenWidth! * 0.027,
                        0.0,
                        0.0,
                      ),
                      child: const Icon(
                        Icons.view_headline,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.013),
                TextFormField(
                  key: const Key('create_event_agenda_duration'),
                  controller: durationController,
                  focusNode: durationFocus,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!
                        .strictTranslate('Duration (mm:ss)'),
                    hintText: '00:00',
                    labelStyle: Theme.of(context).textTheme.titleMedium,
                    border: const OutlineInputBorder(),
                    prefixIcon: Container(
                      transform: Matrix4.translationValues(
                        -SizeConfig.screenWidth! * 0.027,
                        0.0,
                        0.0,
                      ),
                      child: const Icon(
                        Icons.timer,
                        size: 25,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!
                          .strictTranslate('Please enter a duration');
                    }
                    // Add additional validation for mm:ss format if needed
                    return null;
                  },
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.013),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: urlController,
                        focusNode: urlFocus,
                        maxLines: 5,
                        minLines: 1,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!
                              .strictTranslate('Add URL'),
                          labelStyle: Theme.of(context).textTheme.titleMedium,
                          border: const OutlineInputBorder(),
                          prefixIcon: Container(
                            transform: Matrix4.translationValues(
                              -SizeConfig.screenWidth! * 0.027,
                              0.0,
                              0.0,
                            ),
                            child: const Icon(
                              Icons.add_link_outlined,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: _addUrl,
                      child: Text(
                        key: const Key('add_url'),
                        AppLocalizations.of(context)!.strictTranslate('Add'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: urls.map((url) {
                    return Chip(
                      label: Text(url),
                      onDeleted: () => _removeUrl(url),
                      deleteIconColor: Colors.redAccent,
                    );
                  }).toList(),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.013),
                ElevatedButton.icon(
                  onPressed: () => _pickAttachment(fromCamera: false),
                  icon: const Icon(Icons.attach_file),
                  label: Text(
                    AppLocalizations.of(context)!
                        .strictTranslate('Add Attachments'),
                  ),
                ),
                const Divider(),
                const SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: attachments.length,
                  itemBuilder: (context, index) {
                    final base64String = attachments[index];
                    final imageData = imageService.decodeBase64(base64String);
                    if (imageData == null) {
                      return const Center(
                        child: Icon(Icons.broken_image, color: Colors.red),
                      );
                    }
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.memory(
                            imageData,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () => _removeAttachment(base64String),
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.013),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
