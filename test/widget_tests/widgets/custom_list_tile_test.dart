import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/options/options.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/widgets/custom_list_tile.dart';

Widget createCustomListTileUser() {
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: CustomListTile(
          key: const Key('ravidi'),
          index: 0,
          type: TileType.user,
          option: Options(
            icon: const Icon(Icons.add),
            title: 'Title',
            subtitle: 'Sub-Title',
          ),
          showIcon: false,
          onTapOrgInfo: (org) => SelectOrganizationViewModel().selectOrg(org),
          onTapOption: () {},
          userInfo: User(firstName: 'Ayush', lastName: 'Verma'),
          orgInfo: SelectOrganizationViewModel().selectedOrganization,
        ),
      ),
    ),
  );
}

Widget createCustomListTileOrg() {
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: CustomListTile(
          key: const Key('ravidi'),
          index: 0,
          type: TileType.org,
          option: Options(
            icon: const Icon(Icons.add),
            title: 'Title',
            subtitle: 'Sub-Title',
          ),
          showIcon: false,
          onTapOrgInfo: (org) => SelectOrganizationViewModel().selectOrg(org),
          onTapOption: () {},
          orgInfo: SelectOrganizationViewModel().selectedOrganization,
        ),
      ),
    ),
  );
}

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  group('Custom list tile (user) test', () {
    testWidgets('Checking if custom list tile shows up', (tester) async {
      await tester.pumpWidget(createCustomListTileUser());

      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('Check name', (tester) async {
      await tester.pumpWidget(createCustomListTileUser());

      expect(find.byType(Text), findsNWidgets(2));
      expect(find.textContaining('Ayush'), findsOneWidget);
      expect(find.textContaining('Verma'), findsOneWidget);
    });
  });
  group('Custom list tile (org) test', () {
    testWidgets('Checking if custom list tile shows up', (tester) async {
      await tester.pumpWidget(createCustomListTileUser());

      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('Check name of org', (tester) async {
      await tester.pumpWidget(createCustomListTileOrg());

      expect(find.byType(Text), findsNWidgets(2));
      expect(
          find.textContaining(
              '${SelectOrganizationViewModel().selectedOrganization.name}'),
          findsOneWidget);
    });
  });
}
