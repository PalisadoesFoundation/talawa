import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/security_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final List<MethodCall> log = <MethodCall>[];

  setUp(() {
    log.clear();

    // Verify that the channel name matches what the plugin uses.
    // Looking at the plugin source or docs, it uses 'flutter_windowmanager'.
    const MethodChannel channel = MethodChannel('flutter_windowmanager');

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      log.add(methodCall);
      return true;
    });
  });

  tearDown(() {
    const MethodChannel channel = MethodChannel('flutter_windowmanager');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('enableSecure does not call addFlags on non-Android', () async {
    final service = SecurityService(isAndroid: false);

    await service.enableSecure();

    expect(log, isEmpty);
  });

  test('enableSecure calls addFlags on Android', () async {
    final service = SecurityService(isAndroid: true);
    await service.enableSecure();

    expect(log, hasLength(1));
    expect(log.first.method, 'addFlags');
    // FLAG_SECURE is 8192
    expect(log.first.arguments, {'flags': 8192});
  });

  test('disableSecure calls clearFlags on Android', () async {
    final service = SecurityService(isAndroid: true);
    await service.disableSecure();

    expect(log, hasLength(1));
    expect(log.first.method, 'clearFlags');
    expect(log.first.arguments, {'flags': 8192});
  });

  test('disableSecure does not throw on non-Android', () async {
    // Default isAndroid checks Platform.isAndroid, but we can force false to be safe/explicit if needed,
    // or rely on the default behavior which we assume is false in this env, or mock it.
    // Given the refactor, let's explicit test the "false" case via injection.
    final service = SecurityService(isAndroid: false);
    await service.disableSecure();
    expect(log, isEmpty);
  });
  test('enableSecure and disableSecure handle PlatformException gracefully',
      () async {
    const MethodChannel channel = MethodChannel('flutter_windowmanager');

    // Simulate PlatformException
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      throw PlatformException(code: 'ERROR', message: 'Test error');
    });

    final service = SecurityService(isAndroid: true);

    // Should not throw exception
    await service.enableSecure();
    await service.disableSecure();
  });
}
