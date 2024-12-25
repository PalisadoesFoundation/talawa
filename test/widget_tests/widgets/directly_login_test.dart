import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/pre_auth_view_models/login_view_model.dart';
import 'package:talawa/widgets/directly_login.dart';

/// This is a mock class for LoginViewModel to test diretly Login widget.
class MockLoginViewModel extends LoginViewModel {
  /// Mock email for testing.
  String? mockEmail;

  /// Mock email for testing.
  String? mockPassword;

  /// To verify if model's login function called.
  bool isLoginCalled = false;

  @override
  Future<void> fetchPrevUser() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  String? get prevUserEmail => mockEmail;

  @override
  String? get prevUserPassword => mockPassword;

  @override
  Future<void> login() async {
    isLoginCalled = true;
    await Future.delayed(const Duration(milliseconds: 500));
  }
}

void main() {
  late MockLoginViewModel mockLoginViewModel;

  setUp(() {
    mockLoginViewModel = MockLoginViewModel();
    mockLoginViewModel.isLoginCalled = false;
  });

  testWidgets('Displays email and triggers login on tap',
      (WidgetTester tester) async {
    const testEmail = 'test@example.com';
    const testPassword = 'password123';
    mockLoginViewModel.mockEmail = testEmail;
    mockLoginViewModel.mockPassword = testPassword;

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('es', 'ES'),
          const Locale('fr', 'FR'),
          const Locale('hi', 'IN'),
          const Locale('zh', 'CN'),
          const Locale('de', 'DE'),
          const Locale('ja', 'JP'),
          const Locale('pt', 'PT'),
        ],
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(
          body: DirectlyLogin(model: mockLoginViewModel),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final translatedText =
        AppLocalizations.of(tester.element(find.byType(Scaffold)))!
            .translate("Login directly with");
    final futureBuilderFinder = find.byType(FutureBuilder<void>);
    expect(futureBuilderFinder, findsOneWidget);

    await tester.pump(const Duration(milliseconds: 500));

    final visibilityFinder = find.descendant(
      of: futureBuilderFinder,
      matching: find.byType(Visibility),
    );

    expect(visibilityFinder, findsOneWidget);
    final centerFinder = find.descendant(
      of: visibilityFinder,
      matching: find.byType(Center),
    );

    expect(centerFinder, findsOneWidget);
    final richTextFinder = find.descendant(
      of: centerFinder,
      matching: find.byType(RichText),
    );

    expect(richTextFinder, findsOneWidget);
    final richTextWidget = tester.widget<RichText>(richTextFinder);
    final textSpan = richTextWidget.text as TextSpan;
    expect(
      textSpan.toPlainText(),
      contains("$translatedText ${mockLoginViewModel.email.text}"),
    );
    await tester.pump();
    expect(mockLoginViewModel.prevUserEmail, equals(testEmail));
    expect(mockLoginViewModel.prevUserPassword, equals(testPassword));
  });
  testWidgets(
      'Displays nothing while waiting for data or when there is an error',
      (WidgetTester tester) async {
    mockLoginViewModel.mockEmail = null;
    mockLoginViewModel.mockPassword = null;

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('es', 'ES'),
          const Locale('fr', 'FR'),
          const Locale('hi', 'IN'),
          const Locale('zh', 'CN'),
          const Locale('de', 'DE'),
          const Locale('ja', 'JP'),
          const Locale('pt', 'PT'),
        ],
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(
          body: DirectlyLogin(model: mockLoginViewModel),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(mockLoginViewModel.email.text, "");
    expect(mockLoginViewModel.password.text, "");
    expect(find.byType(SizedBox), findsOneWidget);
  });
  test(
      "test to check if login and instantiated and value of prev credential is set to current data when email inside gesture detector is tapped",
      () async {
    final model = MockLoginViewModel();
    final directLogin = DirectlyLogin(model: model);
    await model.fetchPrevUser();
    model.mockEmail = "test@gmail.com";
    model.mockPassword = "Test@1234";
    await directLogin.loginUsingPrevCredentials();
    expect(model.email.text, "test@gmail.com");
    expect(model.password.text, "Test@1234");
    expect(model.isLoginCalled, true);
  });
}
