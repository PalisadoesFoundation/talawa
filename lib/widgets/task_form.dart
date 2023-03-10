// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/after_auth_view_models/task_view_models/create_task_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';
import 'package:talawa/widgets/date_time_picker.dart';
import 'package:talawa/widgets/event_date_time_tile.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({
    required this.onSave,
    required this.title,
    required this.actionText,
    Key? key,
  }) : super(key: key);

  final Future<bool> Function() onSave;
  final String title;
  final String actionText;

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final model = context.read<CreateTaskViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 1,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            navigationService.pop();
          },
          child: const Icon(Icons.close),
        ),
        title: Text(
          AppLocalizations.of(context)!.strictTranslate(widget.title),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
        ),
        actions: [
          TextButton(
            key: const Key('task_form_text_button'),
            onPressed: () async {
              if (!_formKey.currentState!.validate()) return;
              FocusManager.instance.primaryFocus?.unfocus();
              navigationService.pushDialog(
                const CustomProgressDialog(
                  key: Key('EventTaskCreationProgress'),
                ),
              );
              final success = await widget.onSave();
              navigationService.pop();
              if (success) navigationService.pop();
            },
            child: Text(
              AppLocalizations.of(context)!.strictTranslate(widget.actionText),
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
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleField(),
                      SizedBox(height: SizeConfig.screenHeight! * 0.013),
                      SizedBox(height: SizeConfig.screenHeight! * 0.013),
                      const DescriptionField(),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.013),
                const Divider(),
                Text(
                  AppLocalizations.of(context)!
                      .strictTranslate('Select End Date and Time'),
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 16),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.013),
                DateTimeTile(
                  date: "${model.taskEndDate.toLocal()}".split(' ')[0],
                  time: model.taskEndTime.format(context),
                  setDate: () async {
                    final date =
                        await customDatePicker(initialDate: model.taskEndDate);
                    setState(() => model.taskEndDate = date);
                  },
                  setTime: () async {
                    final time =
                        await customTimePicker(initialTime: model.taskEndTime);
                    setState(() => model.taskEndTime = time);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TitleField extends StatelessWidget {
  const TitleField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskTitleTextController = context
        .select((CreateTaskViewModel model) => model.taskTitleTextController);
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: taskTitleTextController,
      keyboardType: TextInputType.name,
      maxLength: 100,
      validator: (value) => Validator.validateEventForm(value!, 'Title'),
      decoration: InputDecoration(
        labelText: 'Add Task Title',
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
    );
  }
}

class DescriptionField extends StatelessWidget {
  const DescriptionField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskDescriptionTextController = context.select(
      (CreateTaskViewModel model) => model.taskDescriptionTextController,
    );

    return TextFormField(
      keyboardType: TextInputType.multiline,
      controller: taskDescriptionTextController,
      validator: (value) => Validator.validateEventForm(value!, 'Description'),
      maxLines: 10,
      minLines: 1,
      decoration: InputDecoration(
        hintText: 'Describe the task',
        labelText: 'Add Description',
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
    );
  }
}
