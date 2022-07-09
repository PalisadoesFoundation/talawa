import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/after_auth_view_models/task_view_models/create_task_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';
import 'package:talawa/widgets/date_time_picker.dart';
import 'package:talawa/widgets/event_date_time_tile.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({required this.eventId, Key? key}) : super(key: key);

  final String eventId;

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BaseView<CreateTaskViewModel>(
      builder: (context, model, _) {
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
              AppLocalizations.of(context)!.strictTranslate('Add Task'),
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;
                  FocusManager.instance.primaryFocus?.unfocus();
                  navigationService.pushDialog(
                    const CustomProgressDialog(
                      key: Key('EventTaskCreationProgress'),
                    ),
                  );
                  final success = await model.createTask(widget.eventId);
                  navigationService.pop();
                  if (success) navigationService.pop();
                },
                child: Text(
                  AppLocalizations.of(context)!.strictTranslate('Add'),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: model.taskTitleTextController,
                            keyboardType: TextInputType.name,
                            maxLength: 20,
                            validator: (value) =>
                                Validator.validateEventForm(value!, 'Title'),
                            decoration: InputDecoration(
                              labelText: 'Add Task Title',
                              isDense: true,
                              labelStyle: Theme.of(context).textTheme.subtitle1,
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
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.013,
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.013,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            controller: model.taskDescriptionTextController,
                            validator: (value) => Validator.validateEventForm(
                                value!, 'Description'),
                            maxLines: 10,
                            minLines: 1,
                            decoration: InputDecoration(
                              hintText: 'Describe the event',
                              labelText: 'Add Description',
                              labelStyle: Theme.of(context).textTheme.subtitle1,
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.013,
                    ),
                    const Divider(),
                    Text(
                      AppLocalizations.of(context)!
                          .strictTranslate('Select End Date and Time'),
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.013,
                    ),
                    DateTimeTile(
                      date: "${model.taskEndDate.toLocal()}".split(' ')[0],
                      time: model.taskEndTime.format(context),
                      setDate: () async {
                        final _date = await customDatePicker(
                          initialDate: model.taskEndDate,
                        );
                        setState(() {
                          model.taskEndDate = _date;
                        });
                      },
                      setTime: () async {
                        final _time = await customTimePicker(
                          initialTime: model.taskEndTime,
                        );
                        setState(() {
                          model.taskEndTime = _time;
                        });
                      },
                    ),
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
