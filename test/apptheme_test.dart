import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/apptheme.dart';

void main() {
  test('AppTheme coverage', () {
    // Text styles
    expect(AppTheme.title, isNotNull);
    expect(AppTheme.headline1, isNotNull);
    expect(AppTheme.headline2, isNotNull);
    expect(AppTheme.headline3, isNotNull);
    expect(AppTheme.headline4, isNotNull);
    expect(AppTheme.headline5, isNotNull);
    expect(AppTheme.headline6, isNotNull);
    expect(AppTheme.subtitle1, isNotNull);
    expect(AppTheme.subtitle2, isNotNull);
    expect(AppTheme.bodyText1, isNotNull);
    expect(AppTheme.bodyText2, isNotNull);
    expect(AppTheme.bodyText3, isNotNull);
    expect(AppTheme.overline, isNotNull);
    expect(AppTheme.button, isNotNull);

    // Colors
    expect(AppTheme.primary, isNotNull);
    expect(AppTheme.secondary, isNotNull);
    expect(AppTheme.tertiary, isNotNull);
    expect(AppTheme.white, isNotNull);
    expect(AppTheme.red, isNotNull);
    expect(AppTheme.blue, isNotNull);
    expect(AppTheme.yellow, isNotNull);
    expect(AppTheme.green, isNotNull);
    expect(AppTheme.grey, isNotNull);
    expect(AppTheme.lightGrey, isNotNull);
    expect(AppTheme.blackPrimary, isNotNull);
    expect(AppTheme.blackSecondary, isNotNull);
    expect(AppTheme.blackTertiary, isNotNull);
    expect(AppTheme.shadow, isNotNull);

    // Class instantiation
    expect(AppTheme(), isNotNull);
  });
}
