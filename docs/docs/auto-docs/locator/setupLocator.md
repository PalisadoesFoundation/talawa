




setupLocator function - locator library - Dart API







menu

1. [talawa](../index.html)
2. [locator.dart](../locator/locator-library.html)
3. setupLocator function

setupLocator


dark\_mode

light\_mode




# setupLocator function


Future<void>
setupLocator()

This function registers the widgets/objects in "GetIt".

**params**:
None

**returns**:
None


## Implementation

```
Future<void> setupLocator() async {
  locator.registerSingleton(DataBaseMutationFunctions());

  locator.registerSingleton(GraphqlConfig());
  //services
  locator.registerSingleton(NavigationService());

  //sizeConfig
  locator.registerSingleton(SizeConfig());

  locator.registerSingleton(Validator());

  //userConfig
  locator.registerSingleton(UserConfig());

  //sessionManager
  locator.registerSingleton(SessionManager());

  locator.registerSingleton(CacheService());

  //Services
  locator.registerLazySingleton(() => PostService());
  locator.registerLazySingleton(() => EventService());
  locator.registerLazySingleton(() => CommentService());
  locator.registerLazySingleton(() => OrganizationService());
  locator.registerLazySingleton(() => MultiMediaPickerService());
  locator.registerLazySingleton(() => Connectivity());
  locator.registerLazySingleton(() => ChatService());
  locator.registerLazySingleton(() => ImageService());
  locator.registerLazySingleton(() => ImagePicker());
  locator.registerLazySingleton(() => ImageCropper());

  //graphql

  //databaseMutationFunction

  locator.registerSingleton(ConnectivityService(connectivity));

  //queries
  locator.registerSingleton(Queries());

  locator.registerSingleton(ActionHandlerService());

  locator.registerFactory(() => AppConnectivity());

  //Page viewModels
  locator.registerFactory(() => DemoViewModel());
  // locator.registerFactory(() => OrganizationFeedViewModel());
  locator.registerFactory(() => OrganizationFeedViewModel());
  locator.registerFactory(() => SetUrlViewModel());
  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => ManageVolunteerGroupViewModel());
  locator.registerFactory(() => EditAgendaItemViewModel());
  locator.registerFactory(() => SelectOrganizationViewModel());
  locator.registerFactory(() => SignupDetailsViewModel());
  locator.registerFactory(() => WaitingViewModel());
  locator.registerFactory(() => ExploreEventsViewModel());
  locator.registerFactory(() => MainScreenViewModel());
  locator.registerFactory(() => ProfilePageViewModel());
  locator.registerFactory(() => EditProfilePageViewModel());
  locator.registerFactory(() => CreateEventViewModel());
  locator.registerFactory(() => EditEventViewModel());
  locator.registerFactory(() => EventCalendarViewModel());
  locator.registerFactory(() => AddPostViewModel());
  locator.registerFactory(() => EventInfoViewModel());
  locator.registerFactory(() => AppSettingViewModel());

  //Widgets viewModels
  locator.registerFactory(() => ProgressDialogViewModel());
  locator.registerFactory(() => CustomDrawerViewModel());
  locator.registerFactory(() => LikeButtonViewModel());
  locator.registerFactory(() => AppLanguage());
  locator.registerFactory(() => CommentsViewModel());
  locator.registerFactory(() => AppTheme());
  locator.registerFactory(() => DirectChatViewModel());
  locator.registerFactory(() => AccessScreenViewModel());
  locator.registerFactory(() => UserProfileService());
}
```

 


1. [talawa](../index.html)
2. [locator](../locator/locator-library.html)
3. setupLocator function

##### locator library





talawa
1.0.0+1






