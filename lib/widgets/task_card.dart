import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/models/task/task_model.dart';
import 'package:talawa/services/size_config.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
    required this.task,
    this.onMoreOptions,
  }) : super(key: key);

  final Task task;
  final void Function()? onMoreOptions;

  @override
  Widget build(BuildContext context) {
    final deadline = task.deadline != null
        ? DateTime.fromMicrosecondsSinceEpoch(
            int.parse(task.deadline!),
          ).toLocal()
        : null;
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth! * 0.027,
          vertical: 6,
        ),
        title: Text(task.title, style: Theme.of(context).textTheme.headline5),
        trailing: onMoreOptions != null
            ? IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: onMoreOptions,
              )
            : null,
        subtitle: task.description != null
            ? Text(
                '\nDescription: ${task.description!} \n\nDeadline:  ${DateFormat.yMd().add_jm().format(deadline ?? DateTime.now())}')
            : null,
      ),
    );
  }
}
