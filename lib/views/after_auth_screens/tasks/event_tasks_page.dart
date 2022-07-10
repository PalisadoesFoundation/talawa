import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/task_view_models/explore_tasks_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/task_card.dart';

class EventTasksPage extends StatelessWidget {
  const EventTasksPage({Key? key, required this.eventId}) : super(key: key);

  final String eventId;

  @override
  Widget build(BuildContext context) {
    return BaseView<ExploreTasksViewModel>(
      onModelReady: (model) => model.fetchTasks(eventId),
      builder: (_, model, __) {
        final tasks = model.tasks;
        return RefreshIndicator(
          onRefresh: () => model.fetchTasks(eventId),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Event Tasks'),
            ),
            body: model.isBusy
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth! * 0.027,
                      vertical: 4,
                    ),
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return TaskCard(task: task);
                      },
                    ),
                  ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await navigationService.pushScreen(Routes.addTask,
                    arguments: eventId);
              },
              child: const Icon(Icons.add),
            ),
          ),
        );
      },
    );
  }
}
