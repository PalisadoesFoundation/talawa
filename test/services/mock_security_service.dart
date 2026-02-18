import 'package:mockito/mockito.dart';
import 'package:talawa/services/security_service.dart';

/// Mock implementation of [SecurityService] for testing purposes.
class MockSecurityService extends Mock implements SecurityService {
  @override
  Future<void> enableSecure() async => super.noSuchMethod(
        Invocation.method(#enableSecure, []),
        returnValue: Future.value(null),
        returnValueForMissingStub: Future.value(null),
      );

  @override
  Future<void> disableSecure() async => super.noSuchMethod(
        Invocation.method(#disableSecure, []),
        returnValue: Future.value(null),
        returnValueForMissingStub: Future.value(null),
      );
}
