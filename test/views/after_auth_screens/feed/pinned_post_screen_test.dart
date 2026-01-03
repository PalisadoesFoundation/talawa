// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:talawa/models/attachments/attachment_model.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/feed/pinned_post_screen.dart';
import 'package:talawa/views/base_view.dart';
import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

class MockCacheManager extends Mock implements DefaultCacheManager {
  static const fileSystem = LocalFileSystem();

  @override
  Stream<FileResponse> getImageFile(
    String url, {
    String? key,
    Map<String, String>? headers,
    bool withProgress = true,
    int? maxHeight,
    int? maxWidth,
  }) async* {
    if (url == "wrong_url") {
      throw Exception("File not found");
    } else {
      yield FileInfo(
        fileSystem.file(url),
        FileSource.Cache,
        DateTime(2050),
        url,
      );
    }
  }
}

Widget createApp({
  String caption = 'Sample Title',
  List<AttachmentModel>? attachments,
  BaseCacheManager? cacheManager,
}) {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, langModel, child) {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: PinnedPostScreen(
          post: Post(
            caption: caption,
            createdAt: DateTime(2023, 10, 1, 23, 0),
            pinnedAt: DateTime.now().subtract(const Duration(minutes: 5)),
            id: 'postId',
            attachments: attachments ??
                [
                  AttachmentModel(url: 'https://example.com/image.jpg'),
                ],
          ),
          cacheManager: cacheManager ?? MockCacheManager(),
        ),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
      );
    },
  );
}

Future<void> showPinnedPostScreen(
  WidgetTester tester, {
  String caption = 'Sample Title',
  List<AttachmentModel>? attachments,
  BaseCacheManager? cacheManager,
}) async {
  await tester.pumpWidget(
    createApp(
      caption: caption,
      attachments: attachments,
      cacheManager: cacheManager,
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });
  GetIt.instance.registerSingleton<BaseCacheManager>(
    MockCacheManager(),
  );

  GetIt.instance.registerSingleton<NavigationService>(
    NavigationService(),
  );

  GetIt.instance.registerSingleton<SizeConfig>(
    SizeConfig(),
  );

  tearDown(() {
    unregisterServices();
  });

  testWidgets('Check if Pinned Post Screen page shows up', (tester) async {
    await showPinnedPostScreen(tester);
    expect(find.byType(SafeArea), findsOneWidget);
  });

  group('Check if Pinned Post Screen page has -', () {
    testWidgets('Title', (tester) async {
      await showPinnedPostScreen(tester);
      expect(find.text('Sample Title'), findsOneWidget);
    });

    testWidgets('Pinned post screen shows time', (tester) async {
      await showPinnedPostScreen(tester);
      expect(find.textContaining('Minutes Ago'), findsOneWidget);
    });
  });

  // Check if cached network image is working
  testWidgets('Check if CachedNetworkImage is working', (tester) async {
    await mockNetworkImagesFor(() async {
      await showPinnedPostScreen(tester);
      await tester.pumpAndSettle();
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });
  });

  testWidgets('Check if error widget is shown when image fails to load',
      (tester) async {
    await mockNetworkImagesFor(() async {
      await showPinnedPostScreen(
        tester,
        attachments: [
          AttachmentModel(url: 'wrong_url'),
        ],
      );
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.broken_image), findsOneWidget);
    });
  });

  testWidgets('Check if empty attachments are handled gracefully',
      (tester) async {
    await mockNetworkImagesFor(() async {
      await showPinnedPostScreen(
        tester,
        attachments: [],
      );
      expect(find.text('Sample Title'), findsOneWidget);
    });
  });

  testWidgets('Check if null caption is handled', (tester) async {
    await mockNetworkImagesFor(() async {
      await showPinnedPostScreen(
        tester,
        caption: '',
      );
      expect(find.byType(SafeArea), findsOneWidget);
    });
  });
}
