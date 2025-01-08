import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
// Assuming your model imports
import 'package:talawa/models/event_model.dart';
import 'package:talawa/models/user_model.dart';
import 'package:talawa/models/org_info_model.dart';

class MockBinaryReader extends Mock implements BinaryReader {}
class MockBinaryWriter extends Mock implements BinaryWriter {}

void main() {
  group('EventAdapter Tests', () {
    late EventAdapter adapter;
    late MockBinaryReader reader;
    late MockBinaryWriter writer;
    late Event testEvent;
    late Attendee testAttendee;
    late User testCreator;
    late OrgInfo testOrg;

    setUp(() {
      adapter = EventAdapter();
      reader = MockBinaryReader();
      writer = MockBinaryWriter();
      
      testAttendee = Attendee(
        id: '123',
        firstName: 'John',
        lastName: 'Doe',
        image: 'image.jpg'
      );

      testCreator = User(
        id: 'creator123',
        name: 'Creator Name'
      );

      testOrg = OrgInfo(
        id: 'org123',
        name: 'Test Org'
      );

      testEvent = Event(
        id: '1',
        title: 'Test Event',
        description: 'Test Description',
        attendees: [testAttendee],
        location: 'Test Location',
        recurring: true,
        allDay: false,
        startDate: '2025-01-08',
        endDate: '2025-01-09',
        startTime: '09:00',
        endTime: '17:00',
        isPublic: true,
        isRegistered: false,
        isRegisterable: true,
        creator: testCreator,
        organization: testOrg,
        admins: [testCreator]
      );
    });

    test('typeId should be 10', () {
      expect(adapter.typeId, 10);
    });

    group('write tests', () {
      test('should write all fields correctly', () {
        adapter.write(writer, testEvent);

        verifyInOrder([
          writer.writeByte(17),  // Total number of fields
          writer.writeByte(0),
          writer.write(testEvent.id),
          writer.writeByte(1),
          writer.write(testEvent.title),
          writer.writeByte(2),
          writer.write(testEvent.description),
          writer.writeByte(3),
          writer.write(testEvent.location),
          writer.writeByte(4),
          writer.write(testEvent.recurring),
          writer.writeByte(5),
          writer.write(testEvent.allDay),
          writer.writeByte(6),
          writer.write(testEvent.startDate),
          writer.writeByte(7),
          writer.write(testEvent.endDate),
          writer.writeByte(8),
          writer.write(testEvent.startTime),
          writer.writeByte(9),
          writer.write(testEvent.endTime),
          writer.writeByte(10),
          writer.write(testEvent.isPublic),
          writer.writeByte(11),
          writer.write(testEvent.isRegistered),
          writer.writeByte(12),
          writer.write(testEvent.isRegisterable),
          writer.writeByte(13),
          writer.write(testEvent.creator),
          writer.writeByte(14),
          writer.write(testEvent.organization),
          writer.writeByte(15),
          writer.write(testEvent.admins),
          writer.writeByte(16),
          writer.write(testEvent.attendees),
        ]);
      });

      test('should write null values correctly', () {
        final nullEvent = Event();
        adapter.write(writer, nullEvent);

        verify(writer.writeByte(17)).called(1);
        verify(writer.write(null)).called(17);  // All fields are null
      });
    });

    group('read tests', () {
      setUp(() {
        when(reader.readByte()).thenReturn(17);  // Number of fields
        final fields = {
          0: '1',
          1: 'Test Event',
          2: 'Test Description',
          3: 'Test Location',
          4: true,
          5: false,
          6: '2025-01-08',
          7: '2025-01-09',
          8: '09:00',
          9: '17:00',
          10: true,
          11: false,
          12: true,
          13: testCreator,
          14: testOrg,
          15: [testCreator],
          16: [testAttendee]
        };
        
        when(reader.readByte()).thenReturn(17);
        when(reader.read()).thenAnswer((invocation) {
          final currentCallCount = (invocation.callCount - 1) % fields.length;
          return fields[currentCallCount];
        });
      });

      test('should read all fields correctly', () {
        final event = adapter.read(reader);
        
        expect(event.id, '1');
        expect(event.title, 'Test Event');
        expect(event.description, 'Test Description');
        expect(event.location, 'Test Location');
        expect(event.recurring, true);
        expect(event.allDay, false);
        expect(event.startDate, '2025-01-08');
        expect(event.endDate, '2025-01-09');
        expect(event.startTime, '09:00');
        expect(event.endTime, '17:00');
        expect(event.isPublic, true);
        expect(event.isRegistered, false);
        expect(event.isRegisterable, true);
        expect(event.creator, testCreator);
        expect(event.organization, testOrg);
        expect(event.admins?.length, 1);
        expect(event.admins?.first, testCreator);
        expect(event.attendees?.length, 1);
        expect(event.attendees?.first, testAttendee);
      });

      test('should handle null values', () {
        when(reader.read()).thenReturn(null);
        
        final event = adapter.read(reader);
        
        expect(event.id, null);
        expect(event.title, null);
        expect(event.description, null);
        expect(event.attendees, null);
        // ... verify all other fields are null
      });
    });

    test('equality test', () {
      final adapter1 = EventAdapter();
      final adapter2 = EventAdapter();
      final differentAdapter = AttendeeAdapter();

      expect(adapter1 == adapter2, true);
      expect(adapter1 == differentAdapter, false);
      expect(adapter1 == Object(), false);
    });

    test('hashCode test', () {
      expect(adapter.hashCode, adapter.typeId.hashCode);
    });
  });

  group('AttendeeAdapter Tests', () {
    late AttendeeAdapter adapter;
    late MockBinaryReader reader;
    late MockBinaryWriter writer;
    late Attendee testAttendee;

    setUp(() {
      adapter = AttendeeAdapter();
      reader = MockBinaryReader();
      writer = MockBinaryWriter();
      
      testAttendee = Attendee(
        id: '123',
        firstName: 'John',
        lastName: 'Doe',
        image: 'image.jpg'
      );
    });

    test('typeId should be 11', () {
      expect(adapter.typeId, 11);
    });

    group('write tests', () {
      test('should write all fields correctly', () {
        adapter.write(writer, testAttendee);

        verifyInOrder([
          writer.writeByte(4),  // Total number of fields
          writer.writeByte(0),
          writer.write(testAttendee.id),
          writer.writeByte(1),
          writer.write(testAttendee.firstName),
          writer.writeByte(2),
          writer.write(testAttendee.lastName),
          writer.writeByte(3),
          writer.write(testAttendee.image),
        ]);
      });

      test('should write null values correctly', () {
        final nullAttendee = Attendee();
        adapter.write(writer, nullAttendee);

        verify(writer.writeByte(4)).called(1);
        verify(writer.write(null)).called(4);  // All fields are null
      });
    });

    group('read tests', () {
      setUp(() {
        when(reader.readByte()).thenReturn(4);  // Number of fields
        final fields = {
          0: '123',
          1: 'John',
          2: 'Doe',
          3: 'image.jpg'
        };
        
        when(reader.readByte()).thenReturn(4);
        when(reader.read()).thenAnswer((invocation) {
          final currentCallCount = (invocation.callCount - 1) % fields.length;
          return fields[currentCallCount];
        });
      });

      test('should read all fields correctly', () {
        final attendee = adapter.read(reader);
        
        expect(attendee.id, '123');
        expect(attendee.firstName, 'John');
        expect(attendee.lastName, 'Doe');
        expect(attendee.image, 'image.jpg');
      });

      test('should handle null values', () {
        when(reader.read()).thenReturn(null);
        
        final attendee = adapter.read(reader);
        
        expect(attendee.id, null);
        expect(attendee.firstName, null);
        expect(attendee.lastName, null);
        expect(attendee.image, null);
      });
    });

    test('equality test', () {
      final adapter1 = AttendeeAdapter();
      final adapter2 = AttendeeAdapter();
      final differentAdapter = EventAdapter();

      expect(adapter1 == adapter2, true);
      expect(adapter1 == differentAdapter, false);
      expect(adapter1 == Object(), false);
    });

    test('hashCode test', () {
      expect(adapter.hashCode, adapter.typeId.hashCode);
    });
  });
}