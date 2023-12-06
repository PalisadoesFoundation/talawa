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
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/models/user/user_info.dart';
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

Widget createApp() {
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
            sId: '1',
            creator: User(firstName: 'test', lastName: 'name'),
          ),
        ),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
      );
    },
  );
}

Future<void> showPinnedPostScreen(WidgetTester tester) async {
  await tester.pumpWidget(createApp());
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

    testWidgets('Time', (tester) async {
      await showPinnedPostScreen(tester);
      expect(find.text('23:00hr'), findsOneWidget);
    });
  });

  // Check if cached network image is working
  testWidgets('Check if CachedNetworkImage is working', (tester) async {
    await mockNetworkImagesFor(() async {
      await showPinnedPostScreen(tester);
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });
  });

  testWidgets('Check if CachedNetworkImage shows CircularProgressIndicator',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: PinnedPostScreen(
          post: Post(
            sId: '1',
            creator: User(firstName: 'test', lastName: 'name'),
          ),
          cacheManager: GetIt.instance.get<BaseCacheManager>(),
        ),
      ),
    );
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
