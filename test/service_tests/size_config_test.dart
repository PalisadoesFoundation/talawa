// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/size_config.dart';

void main() {
  late double safeAreaHorizontal;
  late double safeAreaVertical;
  const MediaQueryData mediaQueryData = MediaQueryData(
    size: Size(360, 684),
    padding: EdgeInsets.zero,
  );

  group(
    'Test SizeConfig',
    () {
      testWidgets('Test init method', (WidgetTester tester) async {
        await tester.pumpWidget(
          MediaQuery(
            data: mediaQueryData,
            child: Builder(
              builder: (BuildContext context) {
                final config = SizeConfig();
                config.init(context);
                safeAreaHorizontal =
                    mediaQueryData.padding.left + mediaQueryData.padding.right;
                safeAreaVertical =
                    mediaQueryData.padding.top + mediaQueryData.padding.bottom;
                expect(SizeConfig.screenWidth, mediaQueryData.size.width);
                expect(SizeConfig.screenHeight, mediaQueryData.size.height);
                expect(
                  SizeConfig.blockSizeHorizontal,
                  SizeConfig.screenWidth! / 100,
                );
                expect(
                  SizeConfig.blockSizeVertical,
                  SizeConfig.screenHeight! / 100,
                );
                expect(
                  SizeConfig.safeBlockHorizontal,
                  (SizeConfig.screenWidth! - safeAreaHorizontal) / 100,
                );
                expect(
                  SizeConfig.safeBlockVertical,
                  (SizeConfig.screenHeight! - safeAreaVertical) / 100,
                );

                return const Placeholder();
              },
            ),
          ),
        );
      });

      test('Test test method', () async {
        final config = SizeConfig();
        config.test();
        safeAreaHorizontal =
            mediaQueryData.padding.left + mediaQueryData.padding.right;
        safeAreaVertical =
            mediaQueryData.padding.top + mediaQueryData.padding.bottom;
        expect(SizeConfig.screenWidth, mediaQueryData.size.width);
        expect(SizeConfig.screenHeight, mediaQueryData.size.height);
        expect(SizeConfig.blockSizeHorizontal, SizeConfig.screenWidth! / 100);
        expect(SizeConfig.blockSizeVertical, SizeConfig.screenHeight! / 100);
        expect(
          SizeConfig.safeBlockHorizontal,
          (SizeConfig.screenWidth! - safeAreaHorizontal) / 100,
        );
        expect(
          SizeConfig.safeBlockVertical,
          (SizeConfig.screenHeight! - safeAreaVertical) / 100,
        );
      });
    },
  );
}
