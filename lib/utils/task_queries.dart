class TaskQueries {
  static String eventTasks(String eventId) => '''
    query {
      tasksByEvent(id: "$eventId") {
        _id
        title
        description
        createdAt
        deadline
        creator {
          _id
          firstName
        }
      }
    }
  ''';

  static String addTask({
    required String title,
    required String description,
    required String deadline,
    required String eventId,
  }) =>
      '''
        mutation {
          createTask(
            data: { title: "$title", description: "$description", deadline: "$deadline" }
            eventId: "$eventId"
          ) {
            _id
            title
            description
            createdAt
            deadline
            creator {
              _id
              firstName
            }
          }
        }
      ''';

  static String deleteTask(String taskId) => '''
    mutation {
      removeTask(id: "$taskId") {
        _id
      }
    }
  ''';
}
