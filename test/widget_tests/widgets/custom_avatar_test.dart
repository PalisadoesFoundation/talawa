// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:shimmer/shimmer.dart';
import 'package:talawa/widgets/custom_avatar.dart';

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

Widget createCustomAvatar({
  required bool isImageNull,
  required String imageUrl,
}) {
  return MaterialApp(
    home: Scaffold(
      body: CustomAvatar(
        isImageNull: isImageNull,
        imageUrl: imageUrl,
        firstAlphabet: 'A',
        cacheManager: GetIt.instance.get<BaseCacheManager>(),
      ),
    ),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  GetIt.instance.registerSingleton<BaseCacheManager>(
    MockCacheManager(),
  );

  group('Test for CustomAvatar', () {
    testWidgets('Check if CustomAvatar widget shows up if image is null',
        (tester) async {
      await tester.pumpWidget(
        createCustomAvatar(isImageNull: true, imageUrl: 'random_url'),
      );
      await tester.pump();
      // await tester.pumpAndSettle();

      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.text('A'), findsOneWidget);
      expect(find.byType(CachedNetworkImage), findsNothing);
      expect(find.byType(Center), findsNWidgets(2));
    });

    testWidgets('Check if CustomAvatar widget shows up if image is not null',
        (tester) async {
      final pngFile = File('test_img.png'); // Creating a dummy image
      pngFile.openWrite();
      // Writing a 1x1 png data to it
      pngFile.writeAsBytesSync(
        base64Decode(
          "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z/C/HgAGgwJ/lK3Q6wAAAABJRU5ErkJggg==",
        ),
      );
      // print(pngFile.absolute);
      // print(pngFile.existsSync());

      await tester.pumpWidget(
        createCustomAvatar(isImageNull: false, imageUrl: 'test_img.png'),
      );

      // await Future<void>.delayed(const Duration(milliseconds: 1000));
      // sleep(const Duration(milliseconds: 3000));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(CachedNetworkImage), findsOneWidget);
      expect(find.byType(ImageProvider), findsNothing);
      expect(find.byIcon(Icons.error), findsNothing);
      // placeholder
      expect(find.byType(CircleAvatar), findsNWidgets(2));
      expect(find.byType(Shimmer), findsOneWidget);

      pngFile.deleteSync();
    });

    testWidgets('Check if CustomAvatar shows up with error widget on wrong url',
        (tester) async {
      await tester.pumpWidget(
        createCustomAvatar(isImageNull: false, imageUrl: 'wrong_url'),
      );
      await tester.pump();

      expect(find.byType(CachedNetworkImage), findsOneWidget);
      expect(find.byType(ImageProvider), findsNothing);
      expect(find.byIcon(Icons.error), findsOneWidget);

      // placeholders
      expect(find.byType(CircleAvatar), findsNWidgets(1));
      expect(find.byType(Shimmer), findsNothing);
    });
  });
}
