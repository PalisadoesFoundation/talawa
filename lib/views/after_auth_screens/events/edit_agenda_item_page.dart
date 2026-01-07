import 'dart:convert';

import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/agendaItems/event_agenda_item.dart';
import 'package:talawa/models/events/event_agenda_category.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/edit_agenda_view_model.dart';
import 'package:talawa/views/base_view.dart';

/// Screen for edit agenda item.
class EditAgendaItemPage extends StatefulWidget {
  const EditAgendaItemPage({
    super.key,
    required this.agendaItem,
    required this.categories,
  });

  /// agenda item that is going to be be updated.
  final EventAgendaItem agendaItem;

  /// list of categories in that organisation.
  final List<AgendaCategory> categories;

  @override
  _EditAgendaItemPageState createState() => _EditAgendaItemPageState();
}

class _EditAgendaItemPageState extends State<EditAgendaItemPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<EditAgendaItemViewModel>(
      onModelReady: (model) =>
          model.initialize(widget.agendaItem, widget.categories),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 1,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () => locator<NavigationService>().pop(),
              child: const Icon(Icons.close),
            ),
            title: Text(
              AppLocalizations.of(context)!.strictTranslate('Edit Agenda Item'),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
            ),
            actions: [
              TextButton(
                key: const Key('updateButton'),
                onPressed: () async {
                  if (model.checkForChanges()) {
                    await model.updateAgendaItem();
                    if (context.mounted) {
                      Navigator.of(context).pop(true);
                    }
                  } else {
                    DelightToastBar(
                      snackbarDuration: const Duration(seconds: 2),
                      builder: (context) {
                        return ToastCard(
                          title: const Text(
                            "No changes made",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          leading: const Icon(
                            Icons.error_outline,
                            color: Colors.redAccent,
                          ),
                          color: Colors.black.withAlpha((0.8 * 255).toInt()),
                        );
                      },
                    ).show(context);
                  }
                },
                child: Text(
                  AppLocalizations.of(context)!.strictTranslate('Update'),
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
                      key: const Key('edit_agenda_item_category_dropdown'),
                      value: model.selectedCategories.isNotEmpty
                          ? model.selectedCategories.first
                          : null,
                      onChanged: (AgendaCategory? category) {
                        if (category != null) {
                          final updatedCategories = List<AgendaCategory>.from(
                            model.selectedCategories,
                          );
                          if (updatedCategories.contains(category)) {
                            updatedCategories.remove(category);
                          } else {
                            updatedCategories.add(category);
                          }
                          model.setSelectedCategories(updatedCategories);
                        }
                      },
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!
                            .strictTranslate('Select Categories'),
                        border: const OutlineInputBorder(),
                      ),
                      items: model.categories
                          .map<DropdownMenuItem<AgendaCategory>>(
                              (AgendaCategory category) {
                        return DropdownMenuItem<AgendaCategory>(
                          value: category,
                          child: Text(category.name!),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.013),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: model.selectedCategories.map((category) {
                        return Chip(
                          key: Key(category.name!),
                          label: Text(category.name!),
                          onDeleted: () {
                            final updatedCategories = List<AgendaCategory>.from(
                              model.selectedCategories,
                            );
                            updatedCategories.remove(category);
                            model.setSelectedCategories(updatedCategories);
                          },
                          deleteIconColor: Colors.redAccent,
                        );
                      }).toList(),
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.013),
                    TextFormField(
                      key: const Key('edit_event_agenda_tf1'),
                      textInputAction: TextInputAction.next,
                      controller: model.titleController,
                      keyboardType: TextInputType.name,
                      maxLength: 20,
                      validator: (value) =>
                          Validator.validateEventForm(value!, 'Title'),
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!
                            .strictTranslate('Agenda Item Title'),
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
                      key: const Key('edit_event_agenda_tf2'),
                      keyboardType: TextInputType.multiline,
                      controller: model.descriptionController,
                      validator: (value) =>
                          Validator.validateEventForm(value!, 'Description'),
                      maxLines: 10,
                      minLines: 1,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!
                            .strictTranslate('Describe the agenda item'),
                        labelText: AppLocalizations.of(context)!
                            .strictTranslate('Description'),
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
                      key: const Key('edit_event_agenda_duration'),
                      controller: model.durationController,
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
                            key: const Key('urlTextField'),
                            controller: model.urlController,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!
                                  .strictTranslate('Add URL'),
                              labelStyle:
                                  Theme.of(context).textTheme.titleMedium,
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
                        SizedBox(height: SizeConfig.screenHeight! * 0.013),
                        ElevatedButton(
                          onPressed: () {
                            model.addUrl(model.urlController.text);
                            model.urlController.clear();
                          },
                          child: Text(
                            AppLocalizations.of(context)!
                                .strictTranslate('Add'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: model.urls.map((url) {
                        return Chip(
                          key: Key(url),
                          label: Text(url),
                          onDeleted: () => model.removeUrl(url),
                          deleteIconColor: Colors.redAccent,
                        );
                      }).toList(),
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.013),
                    ElevatedButton.icon(
                      onPressed: () => model.pickAttachment(fromCamera: false),
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: model.attachments.length,
                      itemBuilder: (context, index) {
                        final base64String = model.attachments[index];
                        final imageData = base64Decode(base64String);
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
                                onTap: () =>
                                    model.removeAttachment(base64String),
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
      },
    );
  }
}
