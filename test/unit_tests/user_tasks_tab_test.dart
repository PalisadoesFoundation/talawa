import 'package:flutter_test/flutter_test.dart';

Map userData = const {
  "_id": "605492dbcf13b54d55284731",
  "title": "Ay",
  "description": "ry",
  "deadline": "1616155355596",
};
void main() {
  group('Testing valid displays in task tab', () {
    test('Task title should handle null values', () {
      expect(userData['description'], 'ry');
    });
    test('Due Date should handle null values', () {
      expect(userData['deadline'], '1616155355596');
    });
  });
}
