import 'package:flutter/material.dart';
import 'package:talawa/models/app_tour.dart';
import 'package:talawa/view_model/main_screen_keys.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

/// Helper class for building other screen tour targets.
class OtherTourTargets {
  /// Builds events tour targets.
  ///
  /// **params**:
  /// * `keys`: MainScreenKeys instance
  /// * `appTour`: AppTour instance
  ///
  /// **returns**:
  /// * `List<FocusTarget>`: List of focus targets for events tour
  static List<FocusTarget> buildEventTargets({
    required MainScreenKeys keys,
    required AppTour appTour,
  }) {
    return [
      FocusTarget(
        key: keys.keyBNEvents,
        keyName: 'keyBNEvents',
        description:
            'This is the Events tab here you can see all event related information of the current selected organization',
        isCircle: true,
        align: ContentAlign.top,
        appTour: appTour,
      ),
      FocusTarget(
        key: keys.keySECategoryMenu,
        keyName: 'keySECategoryMenu',
        description: 'Filter Events based on categories',
        appTour: appTour,
      ),
      FocusTarget(
        key: keys.keySEDateFilter,
        keyName: 'keySEDateFilter',
        description: 'Filter Events between selected dates',
        appTour: appTour,
      ),
      FocusTarget(
        key: keys.keySECard,
        keyName: 'keySECard',
        description:
            'Description of event to see more details click on the card',
        appTour: appTour,
      ),
      FocusTarget(
        key: keys.keySEAdd,
        keyName: 'keySEAdd',
        description: 'You can create a new event from here',
        align: ContentAlign.top,
        appTour: appTour,
      ),
    ];
  }

  /// Builds chat tour targets.
  ///
  /// **params**:
  /// * `keys`: MainScreenKeys instance
  /// * `appTour`: AppTour instance
  ///
  /// **returns**:
  /// * `List<FocusTarget>`: List of focus targets for chat tour
  static List<FocusTarget> buildChatTargets({
    required MainScreenKeys keys,
    required AppTour appTour,
  }) {
    return [
      FocusTarget(
        key: keys.keyBNChat,
        keyName: 'keyBNChat',
        description:
            'This is the Chat tab here you can see all your messages of the current selected organization',
        isCircle: true,
        align: ContentAlign.top,
        appTour: appTour,
      ),
    ];
  }

  /// Builds profile tour targets.
  ///
  /// **params**:
  /// * `keys`: MainScreenKeys instance
  /// * `appTour`: AppTour instance
  ///
  /// **returns**:
  /// * `List<FocusTarget>`: List of focus targets for profile tour
  static List<FocusTarget> buildProfileTargets({
    required MainScreenKeys keys,
    required AppTour appTour,
  }) {
    return [
      FocusTarget(
        key: keys.keyBNProfile,
        keyName: 'keyBNProfile',
        description:
            'This is the Profile tab here you can see all options related to account, app setting, invitation, help etc',
        isCircle: true,
        align: ContentAlign.top,
        nextCrossAlign: CrossAxisAlignment.start,
        appTour: appTour,
      ),
      FocusTarget(
        key: keys.keySPAppSetting,
        keyName: 'keySPAppSetting',
        description:
            'You can edit application settings like language, theme etc from here',
        appTour: appTour,
      ),
      FocusTarget(
        key: keys.keySPHelp,
        keyName: 'keySPHelp',
        description:
            'For any help we are always there. You can reach us from here',
        appTour: appTour,
      ),
      FocusTarget(
        key: keys.keySPDonateUs,
        keyName: 'keySPDonateUs',
        description:
            'To help your organization grow you can support them financially from here',
        appTour: appTour,
      ),
      FocusTarget(
        key: keys.keySPPalisadoes,
        keyName: 'keySPPalisadoes',
        description: 'You are all set to go lets get you in',
        isEnd: true,
        appTour: appTour,
      ),
    ];
  }

  /// Builds add post tour targets.
  ///
  /// **params**:
  /// * `keys`: MainScreenKeys instance
  /// * `appTour`: AppTour instance
  ///
  /// **returns**:
  /// * `List<FocusTarget>`: List of focus targets for add post tour
  static List<FocusTarget> buildAddPostTargets({
    required MainScreenKeys keys,
    required AppTour appTour,
  }) {
    return [
      FocusTarget(
        key: keys.keyBNPost,
        keyName: 'keyBNPost',
        description:
            'This is the Create post tab here you can add post to the current selected organization',
        isCircle: true,
        align: ContentAlign.top,
        appTour: appTour,
      ),
    ];
  }
}
