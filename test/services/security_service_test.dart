import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_windowmanager_plus/flutter_windowmanager_plus.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/services/security_service.dart';

class MockWindowManagerWrapper extends Mock implements WindowManagerWrapper {
  @override
  Future<bool> addFlags(int? flags) =>
      super.noSuchMethod(Invocation.method(#addFlags, [flags]),
          returnValue: Future.value(true),
          returnValueForMissingStub: Future.value(true)) as Future<bool>;

  @override
  Future<bool> clearFlags(int? flags) =>
      super.noSuchMethod(Invocation.method(#clearFlags, [flags]),
          returnValue: Future.value(true),
          returnValueForMissingStub: Future.value(true)) as Future<bool>;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockWindowManagerWrapper mockWindowManager;

  setUp(() {
    mockWindowManager = MockWindowManagerWrapper();
  });

  test('enableSecure does not call addFlags on non-Android', () async {
    final service = SecurityService(
      isAndroid: false,
      windowManager: mockWindowManager,
    );

    await service.enableSecure();

    verifyNever(mockWindowManager.addFlags(any));
  });

  test('enableSecure calls addFlags on Android', () async {
    final service = SecurityService(
      isAndroid: true,
      windowManager: mockWindowManager,
    );
    await service.enableSecure();

    verify(mockWindowManager.addFlags(FlutterWindowManagerPlus.FLAG_SECURE))
        .called(1);
  });

  test('disableSecure calls clearFlags on Android', () async {
    final service = SecurityService(
      isAndroid: true,
      windowManager: mockWindowManager,
    );
    await service.disableSecure();

    verify(mockWindowManager.clearFlags(FlutterWindowManagerPlus.FLAG_SECURE))
        .called(1);
  });

  test('disableSecure does not throw on non-Android', () async {
    final service = SecurityService(
      isAndroid: false,
      windowManager: mockWindowManager,
    );
    await service.disableSecure();
    verifyNever(mockWindowManager.clearFlags(any));
  });

  test('enableSecure and disableSecure handle exceptions gracefully', () async {
    // Arrange to throw exception
    when(mockWindowManager.addFlags(any)).thenThrow(Exception('Test error'));
    when(mockWindowManager.clearFlags(any)).thenThrow(Exception('Test error'));

    final service = SecurityService(
      isAndroid: true,
      windowManager: mockWindowManager,
    );

    // Should not throw exception
    await service.enableSecure();
    await service.disableSecure();

    // Calls happened but were caught
    verify(mockWindowManager.addFlags(any)).called(1);
    verify(mockWindowManager.clearFlags(any)).called(1);
  });
}
