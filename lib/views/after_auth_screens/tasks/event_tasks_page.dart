import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/view_model/after_auth_view_models/task_view_models/explore_tasks_view_model.dart';
import 'package:talawa/views/base_view.dart';

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
                : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      final deadline = task.deadline != null
                          ? DateTime.fromMicrosecondsSinceEpoch(
                              int.parse(task.deadline!),
                            ).toLocal()
                          : null;
                      return ListTile(
                        leading: Checkbox(
                          value: false,
                          onChanged: (_) {},
                        ),
                        title: Text(task.title),
                        subtitle: task.description != null
                            ? Text(task.description!)
                            : null,
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Creator: ${task.creator.firstName}"),
                            if (deadline != null)
                              Text(
                                "Deadline: ${DateFormat.yMd().add_jm().format(deadline)}",
                              ),
                          ],
                        ),
                        onLongPress: () {
                          locator<NavigationService>().pushDialog(
                            AlertDialog(
                              title: const Text('Delete Task'),
                              actions: [
                                TextButton(
                                  child: const Text('Delete'),
                                  onPressed: () {
                                    model.deleteTask(
                                      task.id,
                                      task.creator.id!,
                                    );
                                    locator<NavigationService>().pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Cancel'),
                                  onPressed: () => navigationService.pop(),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
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
