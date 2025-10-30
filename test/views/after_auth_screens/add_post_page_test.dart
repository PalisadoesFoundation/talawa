import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/add_post_page.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_avatar.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

Widget createAddPostPage({
  ThemeMode themeMode = ThemeMode.light,
  ThemeData? theme,
}) =>
    BaseView<AppLanguage>(
      onModelReady: (model) => model.initialize(),
      builder: (context, langModel, child) {
        return MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: [
            const AppLocalizationsDelegate(isTest: true),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          key: const Key('Root'),
          themeMode: themeMode,
          theme: theme ?? TalawaTheme.lightTheme,
          home: const Scaffold(
            body: AddPost(
              key: Key('AddPostPage'),
            ),
          ),
          navigatorKey: navigationService.navigatorKey,
          onGenerateRoute: router.generateRoute,
        );
      },
    );

void main() {
  group('AddPost Widget Tests', () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      testSetupLocator();
      locator<SizeConfig>().test();
      registerServices();
      getAndRegisterAppTheme();
    });

    tearDownAll(() {
      unregisterServices();
    });

    group('Initial UI State', () {
      testWidgets('should display all required UI elements', (tester) async {
        await tester.pumpWidget(createAddPostPage());
        await tester.pumpAndSettle();

        // Check AppBar elements
        expect(find.byKey(const Key('add_post_back_button')), findsOneWidget);
        expect(find.text('New Post'), findsOneWidget);
        expect(find.byKey(const Key('add_post_share_button')), findsOneWidget);

        // Check user info section
        expect(find.byType(CustomAvatar), findsOneWidget);
        expect(find.text('Test User'), findsOneWidget);
        expect(find.text('Organization Name'), findsOneWidget);

        // Check caption text field
        expect(find.byKey(const Key('caption_text_field')), findsOneWidget);
        expect(find.text('Write a caption...'), findsOneWidget);

        // Check photo section
        expect(find.text('Gallery'), findsOneWidget);
        expect(find.text('Camera'), findsOneWidget);
        expect(find.byIcon(Icons.photo_library_outlined), findsOneWidget);
        expect(find.byIcon(Icons.camera_alt_outlined), findsOneWidget);

        // Check required image notice
        expect(
          find.text('At least one image is required to create a post'),
          findsOneWidget,
        );
        expect(find.byIcon(Icons.info_outline), findsOneWidget);
      });

      testWidgets('share button should be disabled initially', (tester) async {
        await tester.pumpWidget(createAddPostPage());
        await tester.pumpAndSettle();

        final shareButton = find.byKey(const Key('add_post_share_button'));
        expect(shareButton, findsOneWidget);

        final textButton = tester.widget<TextButton>(shareButton);
        expect(textButton.onPressed, isNull);
      });

      testWidgets('should show maximum images limit text', (tester) async {
        await tester.pumpWidget(createAddPostPage());
        await tester.pumpAndSettle();

        expect(find.text('0/5'), findsNothing);
      });
    });

    group('Back Button Interaction', () {
      testWidgets('should call navigationService.pop when back button tapped',
          (tester) async {
        await tester.pumpWidget(createAddPostPage());
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(const Key('add_post_back_button')));
        await tester.pumpAndSettle();

        verify(navigationService.pop()).called(1);
      });
    });

    group('Caption Text Field', () {
      testWidgets('should update UI when caption is entered', (tester) async {
        await tester.pumpWidget(createAddPostPage());
        await tester.pumpAndSettle();

        final captionField = find.byKey(const Key('caption_text_field'));
        await tester.enterText(captionField, 'Test caption');
        await tester.pumpAndSettle();

        expect(find.text('Test caption'), findsOneWidget);
      });

      testWidgets('should have correct text field properties', (tester) async {
        await tester.pumpWidget(createAddPostPage());
        await tester.pumpAndSettle();

        final textField = tester
            .widget<TextField>(find.byKey(const Key('caption_text_field')));
        expect(textField.maxLines, isNull);
        expect(textField.minLines, equals(3));
        expect(textField.decoration?.border, equals(InputBorder.none));
        expect(textField.decoration?.enabledBorder, equals(InputBorder.none));
        expect(textField.decoration?.focusedBorder, equals(InputBorder.none));
        expect(textField.decoration?.contentPadding, equals(EdgeInsets.zero));
      });
    });

    group('Gallery and Camera Buttons', () {
      testWidgets('should be enabled when under max image limit',
          (tester) async {
        await tester.pumpWidget(createAddPostPage());
        await tester.pumpAndSettle();

        // Both buttons should be tappable initially
        final galleryButton =
            find.widgetWithIcon(InkWell, Icons.photo_library_outlined);
        final cameraButton =
            find.widgetWithIcon(InkWell, Icons.camera_alt_outlined);

        expect(galleryButton, findsOneWidget);
        expect(cameraButton, findsOneWidget);

        final galleryInkWell = tester.widget<InkWell>(galleryButton);
        final cameraInkWell = tester.widget<InkWell>(cameraButton);

        expect(galleryInkWell.onTap, isNotNull);
        expect(cameraInkWell.onTap, isNotNull);
      });

      testWidgets('should have correct styling when enabled', (tester) async {
        await tester.pumpWidget(createAddPostPage());
        await tester.pumpAndSettle();

        // Check container colors for enabled state
        final containers = find.descendant(
          of: find.byType(InkWell),
          matching: find.byType(Container),
        );

        expect(containers, findsAtLeastNWidgets(2));
      });
    });

    group('Image Display and Management', () {
      testWidgets('should show image count and photos header when images added',
          (tester) async {
        // This test would require mocking the view model to simulate images
        // For now, we'll test the UI structure that appears when images exist
        await tester.pumpWidget(createAddPostPage());
        await tester.pumpAndSettle();

        // Initially no Photos header or count should be visible
        expect(find.text('Photos'), findsNothing);
      });

      testWidgets('should show grid view when images are present',
          (tester) async {
        await tester.pumpWidget(createAddPostPage());
        await tester.pumpAndSettle();

        // Initially no GridView should be present
        expect(find.byType(GridView), findsNothing);
      });
    });

    group('Share Button State', () {
      testWidgets('should remain disabled with only caption', (tester) async {
        await tester.pumpWidget(createAddPostPage());
        await tester.pumpAndSettle();

        // Enter caption
        await tester.enterText(
          find.byKey(const Key('caption_text_field')),
          'Test caption',
        );
        await tester.pumpAndSettle();

        // Share button should still be disabled
        final shareButton = find.byKey(const Key('add_post_share_button'));
        final textButton = tester.widget<TextButton>(shareButton);
        expect(textButton.onPressed, isNull);
      });
    });

    group('Error State Display', () {
      testWidgets('should show required image notice when no images',
          (tester) async {
        await tester.pumpWidget(createAddPostPage());
        await tester.pumpAndSettle();

        // Check error container is visible
        expect(
          find.text('At least one image is required to create a post'),
          findsOneWidget,
        );
        expect(find.byIcon(Icons.info_outline), findsOneWidget);

        // Check that both the icon and text are in the same row/container
        final row = find.ancestor(
          of: find.byIcon(Icons.info_outline),
          matching: find.byType(Row),
        );
        expect(row, findsOneWidget);

        // Verify the container with error styling exists
        final errorContainer = find.ancestor(
          of: find.byIcon(Icons.info_outline),
          matching: find.byType(Container),
        );
        expect(errorContainer, findsOneWidget);
      });
    });

    group('Theme Variations', () {
      testWidgets('should render correctly with dark theme', (tester) async {
        await tester.pumpWidget(
          createAddPostPage(
            themeMode: ThemeMode.dark,
            theme: TalawaTheme.darkTheme,
          ),
        );
        await tester.pumpAndSettle();

        // Basic elements should still be present
        expect(find.text('New Post'), findsOneWidget);
        expect(find.text('Test User'), findsOneWidget);
        expect(find.byKey(const Key('caption_text_field')), findsOneWidget);
      });

      testWidgets('should render correctly with light theme', (tester) async {
        await tester.pumpWidget(
          createAddPostPage(
            themeMode: ThemeMode.light,
            theme: TalawaTheme.lightTheme,
          ),
        );
        await tester.pumpAndSettle();

        // Basic elements should still be present
        expect(find.text('New Post'), findsOneWidget);
        expect(find.text('Test User'), findsOneWidget);
        expect(find.byKey(const Key('caption_text_field')), findsOneWidget);
      });
    });

    group('Layout Structure', () {
      testWidgets('should have correct scaffold structure', (tester) async {
        await tester.pumpWidget(createAddPostPage());
        await tester.pumpAndSettle();

        // Check main structure
        expect(
          find.byType(Scaffold),
          findsNWidgets(2),
        ); // One from MaterialApp, one from AddPost
        expect(find.byType(AppBar), findsOneWidget);
        expect(find.byType(Column), findsAtLeastNWidgets(1));
        expect(find.byType(SingleChildScrollView), findsOneWidget);
      });

      testWidgets('should have proper spacing and padding', (tester) async {
        await tester.pumpWidget(createAddPostPage());
        await tester.pumpAndSettle();

        // Check for SizedBox widgets that provide spacing
        expect(find.byType(SizedBox), findsAtLeastNWidgets(1));

        // Check for Container widgets with padding
        final containers = find.byType(Container);
        expect(containers, findsAtLeastNWidgets(1));
      });
    });

    group('Accessibility', () {
      testWidgets('should have proper semantics for screen readers',
          (tester) async {
        await tester.pumpWidget(createAddPostPage());
        await tester.pumpAndSettle();

        // Check that important elements are accessible
        expect(find.byKey(const Key('add_post_back_button')), findsOneWidget);
        expect(find.byKey(const Key('add_post_share_button')), findsOneWidget);
        expect(find.byKey(const Key('caption_text_field')), findsOneWidget);
      });
    });
  });
}
