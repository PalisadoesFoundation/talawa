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
              icon: const Icon(Icons.add), title: 'henlo', subtitle: 'yesh'),
          showIcon: false,
          onTapOrgInfo: (org) => SelectOrganizationViewModel().selectOrg(org),
          onTapOption: () {},
          userInfo: User(firstName: 'Ravidev', lastName: 'Pandey'),
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
      expect(find.textContaining('Ravidev'), findsOneWidget);
      expect(find.textContaining('Pandey'), findsOneWidget);
    });
  });
}
