import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    locator<GraphqlConfig>().test();
    locator<SizeConfig>().test();
  });

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });

  test("test initialise function of model", () {
    final model = SelectContactViewModel();
    model.initialise();
  });

  test("test to check if getOrgMembersList is working", () async {
    final model = SelectContactViewModel();
    model.initialise();
    final User user1 = User(id: "fakeUser1");
    final User user2 = User(id: "fakeUser2");
    final List<User> users = [user1, user2];

    when(organizationService.getOrgMembersList("XYZ"))
        .thenAnswer((realInvocation) async {
      return users;
    });

    // Test state management
    expect(model.state, ViewState.idle);

    await model.getCurrentOrgUsersList();

    // Verify state returns to idle after completion
    expect(model.state, ViewState.idle);

    // Verify the users were loaded correctly
    expect(model.orgMembersList.length, 2);
    expect(model.orgMembersList[0].id, "fakeUser1");
    expect(model.orgMembersList[1].id, "fakeUser2");

    bool working = true;
    model.orgMembersList.forEach((user) {
      if (user.id == null) {
        working = false;
      }
    });

    expect(working, true);
  });

  test("test state management during getCurrentOrgUsersList", () async {
    final model = SelectContactViewModel();
    model.initialise();
    final User user1 = User(id: "fakeUser1");
    final List<User> users = [user1];

    when(organizationService.getOrgMembersList("XYZ"))
        .thenAnswer((realInvocation) async {
      // Simulate some delay
      await Future.delayed(const Duration(milliseconds: 100));
      return users;
    });

    // Initially should be idle
    expect(model.state, ViewState.idle);

    // Start the async operation
    final future = model.getCurrentOrgUsersList();

    // Should be busy now
    expect(model.state, ViewState.busy);

    // Wait for completion
    await future;

    // Should be idle again
    expect(model.state, ViewState.idle);
  });

  test("test notifyListeners is called during getCurrentOrgUsersList",
      () async {
    final model = SelectContactViewModel();
    model.initialise();
    final User user1 = User(id: "fakeUser1");
    final List<User> users = [user1];

    when(organizationService.getOrgMembersList("XYZ"))
        .thenAnswer((realInvocation) async {
      return users;
    });

    bool listenerCalled = false;
    model.addListener(() {
      listenerCalled = true;
    });

    await model.getCurrentOrgUsersList();

    // Verify that listeners were notified
    expect(listenerCalled, true);
  });

  test("test notifyListeners is called even on error", () async {
    final model = SelectContactViewModel();
    model.initialise();

    when(organizationService.getOrgMembersList("XYZ"))
        .thenThrow(Exception("Network error"));

    bool listenerCalled = false;
    model.addListener(() {
      listenerCalled = true;
    });

    await model.getCurrentOrgUsersList();

    // Verify that listeners were notified even on error
    expect(listenerCalled, true);
  });

  test("test state transitions during error in getCurrentOrgUsersList",
      () async {
    final model = SelectContactViewModel();
    model.initialise();

    when(organizationService.getOrgMembersList("XYZ"))
        .thenThrow(Exception("Network error"));

    // Initially should be idle
    expect(model.state, ViewState.idle);

    // Start the async operation and capture states
    final future = model.getCurrentOrgUsersList();

    // Should be busy now
    expect(model.state, ViewState.busy);

    // Wait for completion
    await future;

    // Should return to idle even after error
    expect(model.state, ViewState.idle);
  });

  group('createChatWithUser', () {
    late SelectContactViewModel model;
    late User currentUser;
    late User selectedUser;

    setUp(() {
      // Reset all mocks first
      reset(chatService);
      reset(userConfig);
      reset(organizationService);

      model = SelectContactViewModel();
      model.initialise();
      currentUser = User(id: 'currentUser');
      selectedUser = User(id: 'selectedUser');

      // Mock the current user
      when(userConfig.currentUser).thenReturn(currentUser);

      // Mock the current org to prevent issues with getCurrentOrgUsersList
      when(userConfig.currentOrg).thenReturn(
        OrgInfo(id: 'XYZ', name: 'Test Org'),
      );
    });

    tearDown(() {
      // Reset any state that might affect other tests
      reset(chatService);
      reset(userConfig);
      reset(organizationService);
    });

    test('successfully creates a new chat', () async {
      final newChat = Chat(
        id: 'newChatId',
        members: [
          ChatUser(id: 'currentUser'),
          ChatUser(id: 'selectedUser'),
        ],
      );

      when(chatService.getChatsByUser()).thenAnswer((_) async => []);
      when(
        chatService.createChat(
          name: 'chat_currentUser_selectedUser',
          description: 'Direct chat between users',
        ),
      ).thenAnswer((_) async => newChat);
      when(
        chatService.createChatMembership(
          chatId: 'newChatId',
          userId: 'currentUser',
        ),
      ).thenAnswer((_) async => true);
      when(
        chatService.createChatMembership(
          chatId: 'newChatId',
          userId: 'selectedUser',
        ),
      ).thenAnswer((_) async => true);

      final chatId = await model.createChatWithUser(selectedUser);

      expect(chatId, 'newChatId');
      expect(model.state, ViewState.idle);
      verify(chatService.getChatsByUser()).called(1);
      verify(
        chatService.createChat(
          name: 'chat_currentUser_selectedUser',
          description: 'Direct chat between users',
        ),
      ).called(1);
    });

    test('returns null if chat creation fails', () async {
      when(chatService.getChatsByUser()).thenAnswer((_) async => []);
      when(
        chatService.createChat(
          name: 'chat_currentUser_selectedUser',
          description: 'Direct chat between users',
        ),
      ).thenAnswer((_) async => null);

      final chatId = await model.createChatWithUser(selectedUser);

      expect(chatId, isNull);
      expect(model.state, ViewState.idle);
    });

    test('returns null if adding current user fails', () async {
      final newChat = Chat(
        id: 'newChatId',
        members: [
          ChatUser(id: 'currentUser'),
          ChatUser(id: 'selectedUser'),
        ],
      );

      when(chatService.getChatsByUser()).thenAnswer((_) async => []);
      when(
        chatService.createChat(
          name: 'chat_currentUser_selectedUser',
          description: 'Direct chat between users',
        ),
      ).thenAnswer((_) async => newChat);
      when(
        chatService.createChatMembership(
          chatId: 'newChatId',
          userId: 'currentUser',
        ),
      ).thenAnswer((_) async => false);

      final chatId = await model.createChatWithUser(selectedUser);
      expect(chatId, isNull);
      expect(model.state, ViewState.idle);
    });

    test('returns null if adding selected user fails', () async {
      final newChat = Chat(
        id: 'newChatId',
        members: [
          ChatUser(id: 'currentUser'),
          ChatUser(id: 'selectedUser'),
        ],
      );

      when(chatService.getChatsByUser()).thenAnswer((_) async => []);
      when(
        chatService.createChat(
          name: 'chat_currentUser_selectedUser',
          description: 'Direct chat between users',
        ),
      ).thenAnswer((_) async => newChat);
      when(
        chatService.createChatMembership(
          chatId: 'newChatId',
          userId: 'currentUser',
        ),
      ).thenAnswer((_) async => true);
      when(
        chatService.createChatMembership(
          chatId: 'newChatId',
          userId: 'selectedUser',
        ),
      ).thenAnswer((_) async => false);

      final chatId = await model.createChatWithUser(selectedUser);
      expect(chatId, isNull);
      expect(model.state, ViewState.idle);
    });

    test('handles exceptions gracefully', () async {
      when(chatService.getChatsByUser()).thenThrow(Exception('Error'));

      final chatId = await model.createChatWithUser(selectedUser);
      expect(chatId, isNull);
      expect(model.state, ViewState.idle);
    });

    test('returns null if both memberships fail', () async {
      final newChat = Chat(
        id: 'newChatId',
        members: [
          ChatUser(id: 'currentUser'),
          ChatUser(id: 'selectedUser'),
        ],
      );

      when(chatService.getChatsByUser()).thenAnswer((_) async => []);
      when(
        chatService.createChat(
          name: 'chat_currentUser_selectedUser',
          description: 'Direct chat between users',
        ),
      ).thenAnswer((_) async => newChat);
      when(
        chatService.createChatMembership(
          chatId: 'newChatId',
          userId: 'currentUser',
        ),
      ).thenAnswer((_) async => false);
      when(
        chatService.createChatMembership(
          chatId: 'newChatId',
          userId: 'selectedUser',
        ),
      ).thenAnswer((_) async => false);

      final chatId = await model.createChatWithUser(selectedUser);
      expect(chatId, isNull);
      expect(model.state, ViewState.idle);
    });

    test('manages state correctly', () async {
      when(chatService.getChatsByUser()).thenAnswer((_) async {
        expect(model.state, ViewState.busy);
        await Future.delayed(const Duration(milliseconds: 10));
        return [];
      });

      when(
        chatService.createChat(
          name: 'chat_currentUser_selectedUser',
          description: 'Direct chat between users',
        ),
      ).thenAnswer((_) async => null);

      final future = model.createChatWithUser(selectedUser);
      expect(model.state, ViewState.busy);
      await future;
      expect(model.state, ViewState.idle);
    });
  });
}
