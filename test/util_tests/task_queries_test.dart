import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/task_queries.dart';

void main() {
  group("Testing Task Queries ", () {
    test("getPostsById should return proper query", () {
      expect(TaskQueries.eventTasks("eventId"), '''
    query {
      tasksByEvent(id: "eventId") {
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
  ''');
    });

    test("userTasks should return proper query", () {
      expect(TaskQueries.userTasks("userId"), '''
    query {
      tasksByUser(id: "userId") {
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
  ''');
    });
    test("addTask should return proper mutation", () {
      expect(
          TaskQueries.addTask(
              title: "title",
              description: "description",
              deadline: "deadline",
              eventId: 'eventId'),
          '''
        mutation {
          createTask(
            data: { title: "title", description: "description", deadline: "deadline" }
            eventId: "eventId"
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
      ''');
    });

    test("editTask should return proper mutation", () {
      expect(
          TaskQueries.editTask(
              title: "title",
              description: "description",
              deadline: "deadline",
              taskId: "taskId"),
          '''
        mutation {
          updateTask(
            data: { title: "title", description: "description", deadline: "deadline" }
            id: "taskId"
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
      ''');
    });

    test("deleteTask should return proper mutation", () {
      expect(TaskQueries.deleteTask("taskId"), '''
    mutation {
      removeTask(id: "taskId") {
        _id
      }
    }
  ''');
    });
  });
}
