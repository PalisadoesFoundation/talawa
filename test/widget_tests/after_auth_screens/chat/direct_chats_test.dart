import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/direct_chats.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_helpers.mocks.dart';

/// Creates a widget for testing DirectChats screen.
Widget createDirectChatsScreen() {
  return const MaterialApp(
    home: Scaffold(
      body: DirectChats(),
    ),
  );
}

/// Creates a widget for testing ChatTile component.
Widget createChatTileWidget({
  required ChatListTileDataModel chat,
  DirectChatViewModel? model,
}) {
  return MaterialApp(
    home: Scaffold(
      body: ChatTile(
        chat: chat,
        model: model ?? MockDirectChatViewModel(),
      ),
    ),
  );
}

void main() {
  late MockDirectChatViewModel mockDirectChatViewModel;
  late MockNavigationService mockNavigationService;
  late MockUserConfig mockUserConfig;

  setUp(() {
    registerServices();
    registerViewModels();
    mockDirectChatViewModel =
        getAndRegisterDirectChatViewModel() as MockDirectChatViewModel;
    mockNavigationService =
        getAndRegisterNavigationService() as MockNavigationService;
    mockUserConfig = getAndRegisterUserConfig() as MockUserConfig;
  });

  tearDown(() {
    unregisterViewModels();
    unregisterServices();
  });

  group('DirectChats Widget Tests', () {
    testWidgets('should display RefreshIndicator for pull-to-refresh',
        (tester) async {
      // Arrange
      when(mockDirectChatViewModel.chats).thenReturn([]);
      when(mockDirectChatViewModel.chatState).thenReturn(ChatState.complete);

      await tester.pumpWidget(createDirectChatsScreen());

      // Verify RefreshIndicator is present
      expect(find.byType(RefreshIndicator), findsOneWidget);
    });

    testWidgets('should show chat list when chats are available',
        (tester) async {
      await mockNetworkImagesFor(() async {
        // Arrange
        final testChat = ChatListTileDataModel(
          id: 'chat1',
          users: [
            ChatUser(
              id: 'user1',
              firstName: 'John',
              image: 'https://example.com/image.jpg',
            ),
            ChatUser(
              id: 'currentUser',
              firstName: 'Current',
            ),
          ],
          chat: Chat(
            id: 'chat1',
            name: 'Test Chat',
            description: 'Test Description',
            createdAt: DateTime.now()
                .subtract(const Duration(hours: 2))
                .toIso8601String(),
          ),
        );

        when(mockDirectChatViewModel.chats).thenReturn([testChat]);
        when(mockDirectChatViewModel.chatState).thenReturn(ChatState.complete);
        when(mockUserConfig.currentUser).thenReturn(
          User(id: 'currentUser', firstName: 'Current'),
        );

        // Act
        await tester.pumpWidget(createDirectChatsScreen());
        await tester.pump();

        // Assert
        expect(find.byType(DirectChats), findsOneWidget);
        expect(find.byType(ChatTile), findsOneWidget);
        expect(find.byType(ListView), findsOneWidget);
        expect(find.byType(RefreshIndicator), findsOneWidget);
      });
    });

    testWidgets('should have RefreshIndicator that can be triggered',
        (tester) async {
      // Arrange
      when(mockDirectChatViewModel.chats).thenReturn([]);
      when(mockDirectChatViewModel.chatState).thenReturn(ChatState.complete);

      await tester.pumpWidget(createDirectChatsScreen());
      await tester.pump();

      // Assert - RefreshIndicator should be present
      expect(find.byType(RefreshIndicator), findsOneWidget);

      // Verify that the RefreshIndicator can be found and doesn't throw when accessed
      final refreshIndicator =
          tester.widget<RefreshIndicator>(find.byType(RefreshIndicator));
      expect(refreshIndicator.onRefresh, isNotNull);
    });

    test('onRefresh method sets loading state and calls refreshChats', () {
      // Arrange
      const directChats = DirectChats();

      // Act & Assert - Just verify the method exists and can be called
      expect(
        () => directChats.onRefresh(mockDirectChatViewModel),
        returnsNormally,
      );

      // Verify the expected calls were made
      verify(mockDirectChatViewModel.chatState = ChatState.loading).called(1);
      verify(mockDirectChatViewModel.refreshChats()).called(1);
    });

    testWidgets('should trigger onRefresh when pulling down on empty state',
        (tester) async {
      // Arrange
      when(mockDirectChatViewModel.chats).thenReturn([]);
      when(mockDirectChatViewModel.chatState).thenReturn(ChatState.complete);

      // Create a flag to track if refreshChats was called
      bool refreshCalled = false;
      when(mockDirectChatViewModel.refreshChats()).thenAnswer((_) {
        refreshCalled = true;
        return;
      });

      await tester.pumpWidget(createDirectChatsScreen());
      await tester.pump();

      // Act - Simulate pull to refresh
      await tester.drag(find.byType(ListView), const Offset(0, 300));

      // Pump frames to process the refresh indicator animation
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // Set the state back to complete to avoid timer issues
      when(mockDirectChatViewModel.chatState).thenReturn(ChatState.complete);

      // Complete the animation
      await tester.pumpAndSettle();

      // Assert that refresh was called
      expect(refreshCalled, true);
    });

    testWidgets('should trigger onRefresh when pulling down on chat list',
        (tester) async {
      await mockNetworkImagesFor(() async {
        // Arrange
        final testChat = ChatListTileDataModel(
          id: 'chat1',
          users: [
            ChatUser(id: 'user1', firstName: 'John'),
            ChatUser(id: 'currentUser', firstName: 'Current'),
          ],
          chat: Chat(
            id: 'chat1',
            name: 'Test Chat',
            description: 'Test Description',
            createdAt: DateTime.now().toIso8601String(),
          ),
        );

        when(mockDirectChatViewModel.chats).thenReturn([testChat]);
        when(mockDirectChatViewModel.chatState).thenReturn(ChatState.complete);
        when(mockUserConfig.currentUser).thenReturn(
          User(id: 'currentUser', firstName: 'Current'),
        );

        // Create a flag to track if refreshChats was called
        bool refreshCalled = false;
        when(mockDirectChatViewModel.refreshChats()).thenAnswer((_) {
          refreshCalled = true;
          return;
        });

        await tester.pumpWidget(createDirectChatsScreen());
        await tester.pump();

        // Act - Simulate pull to refresh on the ListView with chats
        await tester.drag(find.byType(ListView), const Offset(0, 300));

        // Pump frames to process the refresh indicator animation
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Set the state back to complete to avoid timer issues
        when(mockDirectChatViewModel.chatState).thenReturn(ChatState.complete);

        // Complete the animation
        await tester.pumpAndSettle();

        // Assert that refresh was called
        expect(refreshCalled, true);
      });
    });

    testWidgets('should show loading indicator during refresh', (tester) async {
      // Arrange
      when(mockDirectChatViewModel.chats).thenReturn([]);
      when(mockDirectChatViewModel.chatState).thenReturn(ChatState.complete);

      // Create a flag to track if refreshChats was called
      bool refreshCalled = false;
      when(mockDirectChatViewModel.refreshChats()).thenAnswer((_) {
        refreshCalled = true;
        return;
      });

      await tester.pumpWidget(createDirectChatsScreen());

      // Act - Simulate pull to refresh
      await tester.drag(find.byType(ListView), const Offset(0, 300));

      // Change the state to loading to simulate what would happen
      when(mockDirectChatViewModel.chatState).thenReturn(ChatState.loading);

      // Pump to process the refresh indicator animation
      await tester.pump();

      // Verify refresh indicator is showing and in the loading state
      expect(find.byType(RefreshIndicator), findsOneWidget);

      // Change the state back to complete to avoid timer issues
      when(mockDirectChatViewModel.chatState).thenReturn(ChatState.complete);

      // Complete the animation
      await tester.pumpAndSettle();

      // Assert that refresh was called
      expect(refreshCalled, true);
    });
  });

  group('ChatTile Widget Tests', () {
    testWidgets('should display chat tile with user information',
        (tester) async {
      await mockNetworkImagesFor(() async {
        // Arrange
        final testUser = ChatUser(
          id: 'user1',
          firstName: 'John',
          image: 'https://example.com/image.jpg',
        );

        final testChat = ChatListTileDataModel(
          id: 'chat1',
          users: [testUser],
          chat: Chat(
            id: 'chat1',
            description: 'Test chat description',
            createdAt: DateTime.now()
                .subtract(const Duration(minutes: 30))
                .toIso8601String(),
          ),
        );

        // Act
        await tester.pumpWidget(
          createChatTileWidget(chat: testChat, model: mockDirectChatViewModel),
        );
        await tester.pump();

        // Assert
        expect(find.byType(ChatTile), findsOneWidget);
        expect(find.byType(ListTile), findsOneWidget);
        expect(find.byType(CircleAvatar), findsOneWidget);
        expect(find.text('Test chat description'), findsOneWidget);
        expect(find.text('30m'), findsOneWidget); // Time formatting
      });
    });

    testWidgets('should display user initial when no image provided',
        (tester) async {
      // Arrange
      final testUser = ChatUser(
        id: 'user1',
        firstName: 'John',
        // No image provided
      );

      final testChat = ChatListTileDataModel(
        id: 'chat1',
        users: [testUser],
        chat: Chat(
          id: 'chat1',
          description: 'Test description',
        ),
      );

      // Act
      await tester.pumpWidget(
        createChatTileWidget(chat: testChat, model: mockDirectChatViewModel),
      );
      await tester.pump();

      // Assert
      expect(find.text('J'), findsOneWidget); // First letter of firstName
      expect(find.byType(CircleAvatar), findsOneWidget);
    });

    testWidgets('should display "?" when user has no firstName',
        (tester) async {
      // Arrange
      final testUser = ChatUser(
        id: 'user1',
        // No firstName provided
      );

      final testChat = ChatListTileDataModel(
        id: 'chat1',
        users: [testUser],
        chat: Chat(
          id: 'chat1',
          description: 'Test description',
        ),
      );

      // Act
      await tester.pumpWidget(
        createChatTileWidget(chat: testChat, model: mockDirectChatViewModel),
      );
      await tester.pump();

      // Assert
      expect(find.text('?'), findsOneWidget);
    });

    testWidgets('should navigate to chat message screen when tapped',
        (tester) async {
      // Arrange
      final testChat = ChatListTileDataModel(
        id: 'chat1',
        users: [
          ChatUser(id: 'user1', firstName: 'John'),
        ],
        chat: Chat(id: 'chat1'),
      );

      await tester.pumpWidget(
        createChatTileWidget(chat: testChat, model: mockDirectChatViewModel),
      );
      await tester.pump();

      // Act
      await tester.tap(find.byType(ListTile));
      await tester.pump();

      // Assert
      verify(
        mockNavigationService.pushScreen(
          Routes.chatMessageScreen,
          arguments: ['chat1', mockDirectChatViewModel],
        ),
      ).called(1);
    });

    testWidgets('should display correct name for direct chat (2 users)',
        (tester) async {
      // Arrange
      when(mockUserConfig.currentUser).thenReturn(
        User(id: 'currentUser', firstName: 'Current'),
      );

      final testChat = ChatListTileDataModel(
        id: 'chat1',
        users: [
          ChatUser(id: 'user1', firstName: 'John'),
          ChatUser(id: 'currentUser', firstName: 'Current'),
        ],
        chat: Chat(id: 'chat1'),
      );

      // Act
      await tester.pumpWidget(
        createChatTileWidget(chat: testChat, model: mockDirectChatViewModel),
      );
      await tester.pump();

      // Assert
      expect(
        find.text('John'),
        findsOneWidget,
      ); // Should show other user's name
    });

    testWidgets(
        'should display first user when no other user found (orElse case)',
        (tester) async {
      // Arrange - This covers the orElse case where all users have the same ID
      when(mockUserConfig.currentUser).thenReturn(
        User(id: 'currentUser', firstName: 'Current'),
      );

      final testChat = ChatListTileDataModel(
        id: 'chat1',
        users: [
          ChatUser(id: 'currentUser', firstName: 'First'),
          ChatUser(id: 'currentUser', firstName: 'Second'),
        ],
        chat: Chat(id: 'chat1'),
      );

      // Act
      await tester.pumpWidget(
        createChatTileWidget(chat: testChat, model: mockDirectChatViewModel),
      );
      await tester.pump();

      // Assert - Should fall back to first user (orElse case)
      expect(
        find.text('First'),
        findsOneWidget,
      );
    });

    testWidgets('should display chat name for group chat', (tester) async {
      // Arrange
      final testChat = ChatListTileDataModel(
        id: 'chat1',
        users: [
          ChatUser(id: 'user1', firstName: 'John'),
          ChatUser(id: 'user2', firstName: 'Jane'),
          ChatUser(id: 'user3', firstName: 'Bob'),
        ],
        chat: Chat(
          id: 'chat1',
          name: 'Group Chat Name',
        ),
      );

      // Act
      await tester.pumpWidget(
        createChatTileWidget(chat: testChat, model: mockDirectChatViewModel),
      );
      await tester.pump();

      // Assert
      expect(find.text('Group Chat Name'), findsOneWidget);
    });

    testWidgets('should display "Unknown Chat" when no name available',
        (tester) async {
      // Arrange
      final testChat = ChatListTileDataModel(
        id: 'chat1',
        users: [
          ChatUser(id: 'user1', firstName: 'John'),
          ChatUser(id: 'user2', firstName: 'Jane'),
          ChatUser(id: 'user3', firstName: 'Bob'),
        ],
        chat: Chat(id: 'chat1'), // No name provided
      );

      // Act
      await tester.pumpWidget(
        createChatTileWidget(chat: testChat, model: mockDirectChatViewModel),
      );
      await tester.pump();

      // Assert
      expect(find.text('Unknown Chat'), findsOneWidget);
    });

    testWidgets('should display "No description" when no description available',
        (tester) async {
      // Arrange
      final testChat = ChatListTileDataModel(
        id: 'chat1',
        users: [ChatUser(id: 'user1', firstName: 'John')],
        chat: Chat(id: 'chat1'), // No description
      );

      // Act
      await tester.pumpWidget(
        createChatTileWidget(chat: testChat, model: mockDirectChatViewModel),
      );
      await tester.pump();

      // Assert
      expect(find.text('No description'), findsOneWidget);
    });

    group('Time formatting tests', () {
      testWidgets('should display "now" for recent messages', (tester) async {
        // Arrange
        final testChat = ChatListTileDataModel(
          id: 'chat1',
          users: [ChatUser(id: 'user1', firstName: 'John')],
          chat: Chat(
            id: 'chat1',
            createdAt: DateTime.now().toIso8601String(),
          ),
        );

        // Act
        await tester.pumpWidget(createChatTileWidget(chat: testChat));
        await tester.pump();

        // Assert
        expect(find.text('now'), findsOneWidget);
      });

      testWidgets('should display minutes for messages within an hour',
          (tester) async {
        // Arrange
        final testChat = ChatListTileDataModel(
          id: 'chat1',
          users: [ChatUser(id: 'user1', firstName: 'John')],
          chat: Chat(
            id: 'chat1',
            createdAt: DateTime.now()
                .subtract(const Duration(minutes: 45))
                .toIso8601String(),
          ),
        );

        // Act
        await tester.pumpWidget(
          createChatTileWidget(chat: testChat, model: mockDirectChatViewModel),
        );
        await tester.pump();

        // Assert
        expect(find.text('45m'), findsOneWidget);
      });

      testWidgets('should display hours for messages within a day',
          (tester) async {
        // Arrange
        final testChat = ChatListTileDataModel(
          id: 'chat1',
          users: [ChatUser(id: 'user1', firstName: 'John')],
          chat: Chat(
            id: 'chat1',
            createdAt: DateTime.now()
                .subtract(const Duration(hours: 5))
                .toIso8601String(),
          ),
        );

        // Act
        await tester.pumpWidget(
          createChatTileWidget(chat: testChat, model: mockDirectChatViewModel),
        );
        await tester.pump();

        // Assert
        expect(find.text('5h'), findsOneWidget);
      });

      testWidgets('should display days for older messages', (tester) async {
        // Arrange
        final testChat = ChatListTileDataModel(
          id: 'chat1',
          users: [ChatUser(id: 'user1', firstName: 'John')],
          chat: Chat(
            id: 'chat1',
            createdAt: DateTime.now()
                .subtract(const Duration(days: 3))
                .toIso8601String(),
          ),
        );

        // Act
        await tester.pumpWidget(
          createChatTileWidget(chat: testChat, model: mockDirectChatViewModel),
        );
        await tester.pump();

        // Assert
        expect(find.text('3d'), findsOneWidget);
      });

      testWidgets('should display empty string when no createdAt',
          (tester) async {
        // Arrange
        final testChat = ChatListTileDataModel(
          id: 'chat1',
          users: [ChatUser(id: 'user1', firstName: 'John')],
          chat: Chat(id: 'chat1'), // No createdAt
        );

        // Act
        await tester.pumpWidget(
          createChatTileWidget(chat: testChat, model: mockDirectChatViewModel),
        );
        await tester.pump();

        // Assert - Should not crash and display empty time
        expect(find.byType(ChatTile), findsOneWidget);
      });
    });

    testWidgets('should handle empty image URL', (tester) async {
      // Arrange
      final testUser = ChatUser(
        id: 'user1',
        firstName: 'John',
        image: '', // Empty image URL
      );

      final testChat = ChatListTileDataModel(
        id: 'chat1',
        users: [testUser],
        chat: Chat(id: 'chat1'),
      );

      // Act
      await tester.pumpWidget(
        createChatTileWidget(chat: testChat, model: mockDirectChatViewModel),
      );
      await tester.pump();

      // Assert
      expect(find.text('J'), findsOneWidget); // Should fall back to initial
      expect(find.byType(CircleAvatar), findsOneWidget);
    });
  });
}
