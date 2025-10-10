import 'package:app_links/app_links.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talawa/services/caching/cache_service.dart';
import 'package:talawa/services/chat_service.dart';
import 'package:talawa/services/comment_service.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/fund_service.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/image_service.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/org_service.dart';
import 'package:talawa/services/pinned_post_service.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/services/session_manager.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/third_party_service/connectivity_service.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/services/user_action_handler.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/services/user_profile_service.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/access_request_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/add_post_view_models/add_post_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/edit_agenda_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/edit_event_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_calendar_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/manage_volunteer_group_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/feed_view_models/organization_feed_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/fund_view_model/fund_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/edit_profile_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/profile_page_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/settings_view_models/app_setting_view_model.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/view_model/pre_auth_view_models/auth_landing_view_model.dart';
import 'package:talawa/view_model/pre_auth_view_models/login_view_model.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/view_model/pre_auth_view_models/signup_details_view_model.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import 'package:talawa/view_model/waiting_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/comments_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/custom_drawer_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/interactions_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/progress_dialog_view_model.dart';
import 'package:talawa/views/demo_page_view.dart';

// Instance of GetIt and storing it in a global variable
/// Intializaing the locator.
GetIt locator = GetIt.instance;

///GetIt for UserConfig.
final userConfig = locator<UserConfig>();

///GetIt for NavigationService.
final navigationService = locator<NavigationService>();

///GetIt for DataBaseMutationFunctions.
final databaseFunctions = locator<DataBaseMutationFunctions>();

///GetIt for GraphqlConfig.
final graphqlConfig = locator<GraphqlConfig>();

///GetIt for SizeConfig.
final sizeConfig = locator<SizeConfig>();

///GetIt for Queries.
final queries = locator<Queries>();

///GetIt for Connectivity.
final connectivity = locator<Connectivity>();

///GetIt for ConnectivityService.
final connectivityService = locator<ConnectivityService>();

///GetIt for CacheService.
final cacheService = locator<CacheService>();

///GetIt for OrganizationService.
final organizationService = locator<OrganizationService>();

///GetIt for ImageService.
final imageService = locator<ImageService>();

///GetIt for SessionManager.
final sessionManager = locator<SessionManager>();

///GetIt for ActonHandlerService.
final actionHandlerService = locator<ActionHandlerService>();

/// This function registers the widgets/objects in "GetIt".
///
/// **params**:
///   None
///
/// **returns**:
///   None
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
  locator.registerLazySingleton(() => PinnedPostService());

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
  locator.registerFactory(() => SelectContactViewModel());
  locator.registerFactory(() => FundViewModel());

  //Widgets viewModels
  locator.registerFactory(() => ProgressDialogViewModel());
  locator.registerFactory(() => CustomDrawerViewModel());
  locator.registerFactory(() => InteractionsViewModel());
  locator.registerFactory(() => AppLanguage());
  locator.registerFactory(() => CommentsViewModel());
  locator.registerFactory(() => AppTheme());
  locator.registerFactory(() => DirectChatViewModel());
  locator.registerFactory(() => GroupChatViewModel());
  locator.registerFactory(() => AccessScreenViewModel());
  locator.registerFactory(() => UserProfileService());
  locator.registerFactory(() => FundService());

  //AppLinks
  locator.registerSingleton(AppLinks());
}
