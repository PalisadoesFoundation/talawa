::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [locator.dart](../locator/)
3.  setupLocator function

::: self-name
setupLocator
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="locator/locator-library-sidebar.html" below-sidebar=""}
<div>

# [setupLocator]{.kind-function} function

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[setupLocator]{.name}()
:::

::: {.section .desc .markdown}
This function registers the widgets/objects in \"GetIt\".

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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

  //AppLinks
  locator.registerSingleton(AppLinks());
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [locator](../locator/)
3.  setupLocator function

##### locator library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
