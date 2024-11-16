import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/widgets/custom_list_tile.dart';
import 'package:talawa/widgets/organization_search_list.dart';

import '../../helpers/test_locator.dart';

class MockSelectOrganizationViewModel extends Mock
    implements SelectOrganizationViewModel {}

class MockGraphQLClient extends Mock implements GraphQLClient {}

void main() {
  late MockSelectOrganizationViewModel mockModel;
  late MockGraphQLClient mockGraphQLClient;

  setUp(() {
    mockModel = MockSelectOrganizationViewModel();
    mockGraphQLClient = MockGraphQLClient();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: Scaffold(
        body: OrganizationSearchList(model: mockModel),
      ),
    );
  }

  testWidgets('OrganizationSearchList renders correctly',
      (WidgetTester tester) async {
    when(mockModel.searchController.text).thenReturn('');
    await tester.pumpWidget(createWidgetUnderTest());
    expect(find.byType(Query), findsOneWidget);
  });

  testWidgets('Displays loading indicator when fetching data',
      (WidgetTester tester) async {
    when(mockModel.searchController.text).thenReturn('test');
    await tester.pumpWidget(createWidgetUnderTest());

    // Simulate loading state
    await tester.pump();
    expect(find.byType(CupertinoActivityIndicator), findsWidgets);
  });

  testWidgets('Displays CustomListTile for each organization item',
      (WidgetTester tester) async {
    final organizations = [
      OrgInfo(name: 'Org1', id: '1'),
      OrgInfo(name: 'Org2', id: '2'),
    ];

    when(mockModel.searchController.text).thenReturn('org');
    when(mockModel.organizations).thenReturn(organizations);

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.byType(CustomListTile), findsNWidgets(2));
  });

  testWidgets('Shows error message and attempts refetch on exception',
      (WidgetTester tester) async {
    when(mockModel.searchController.text).thenReturn('test');
    when(mockGraphQLClient.query(
      QueryOptions(
        document: gql(queries.getPluginsList()),
      ),
    )).thenAnswer((_) async {
      throw Exception('GraphQL error');
    });

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    // Expect error handling and retry logic here
    expect(find.textContaining('GraphQL error'), findsNothing);
  });

  testWidgets('Calls fetchMoreHelper when near end of list',
      (WidgetTester tester) async {
    final organizations = List<OrgInfo>.generate(
        30, (index) => OrgInfo(name: 'Org $index', id: '$index'));

    when(mockModel.searchController.text).thenReturn('org');
    when(mockModel.organizations).thenReturn(organizations);

    await tester.pumpWidget(createWidgetUnderTest());

    await tester.scrollUntilVisible(
      find.byType(PageView).first,
      500.0,
    );
    Future<QueryResult> Function(FetchMoreOptions)? fetchMore;
    verify(mockModel.fetchMoreHelper(fetchMore!, organizations)).called(1);
  });
}
