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
        event {
          _id
          title
        }
      }
    }
  ''';

  static String userTasks(String userId) => '''
    query {
      tasksByUser(id: "$userId") {
        _id
        title
        description
        createdAt
        deadline
        creator {
          _id
          firstName
        }
        event {
          _id
          title
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
            event {
              _id
              title
            }
          }
        }
      ''';

  static String editTask({
    required String title,
    required String description,
    required String deadline,
    required String taskId,
  }) =>
      '''
        mutation {
          updateTask(
            data: { title: "$title", description: "$description", deadline: "$deadline" }
            id: "$taskId"
          ) {
            _id
            title
            description
            createdAt
            deadline
            creator {
              _id
            }
            event {
              _id
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
