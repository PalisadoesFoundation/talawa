import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/task_view_models/explore_tasks_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/task_card.dart';

class UserTasksPage extends StatelessWidget {
  const UserTasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ExploreTasksViewModel>(
      onModelReady: (model) => model.fetchTasksByUser(),
      builder: (_, model, __) {
        final tasks = model.tasks;
        return RefreshIndicator(
          onRefresh: () => model.fetchTasksByUser(),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('User Tasks'),
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
                        return TaskCard(
                          task: task,
                          onMoreOptions: () {
                            navigationService.pushDialog(
                              AlertDialog(
                                title: const Text('User Actions'),
                                actions: [
                                  TextButton(
                                    child: const Text('Delete'),
                                    onPressed: () {
                                      context
                                          .read<ExploreTasksViewModel>()
                                          .deleteTask(
                                            task.id,
                                            task.creator.id!,
                                          );
                                      navigationService.pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Edit'),
                                    onPressed: () {
                                      navigationService.pop();
                                      navigationService.pushScreen(
                                        Routes.editTask,
                                        arguments: task,
                                      );
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
                  ),
          ),
        );
      },
    );
  }
}
