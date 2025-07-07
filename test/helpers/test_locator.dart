// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

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
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/image_service.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/org_service.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/services/session_manager.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/third_party_service/connectivity_service.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/services/user_action_handler.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/services/user_profile_service.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/access_request_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/add_post_view_models/add_post_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/edit_agenda_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/edit_event_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/manage_volunteer_group_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/feed_view_models/organization_feed_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/edit_profile_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/profile_page_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/settings_view_models/app_setting_view_model.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/view_model/pre_auth_view_models/login_view_model.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/view_model/pre_auth_view_models/set_url_view_model.dart';
import 'package:talawa/view_model/pre_auth_view_models/signup_details_view_model.dart';
import 'package:talawa/view_model/pre_auth_view_models/waiting_view_model.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/comments_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/custom_drawer_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/like_button_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/progress_dialog_view_model.dart';
import 'package:talawa/views/demo_page_view.dart';

GetIt locator = GetIt.instance;
final userConfig = locator<UserConfig>();
final navigationService = locator<NavigationService>();
final databaseFunctions = locator<DataBaseMutationFunctions>();
final graphqlConfig = locator<GraphqlConfig>();
final sizeConfig = locator<SizeConfig>();
final queries = locator<Queries>();
final appLanguageService = locator<AppLanguage>();
final multimediaPickerService = locator<MultiMediaPickerService>();
final organizationService = locator<OrganizationService>();
final eventService = locator<EventService>();
final commentsService = locator<CommentService>();
final chatService = locator<ChatService>();
final connectivity = locator<Connectivity>();
final connectivityService = locator<ConnectivityService>();
final cacheService = locator<CacheService>();
final postService = locator<PostService>();
final mainScreenViewModel = locator<MainScreenViewModel>();
final imageService = locator<ImageService>();
final imagePicker = locator<ImagePicker>();
final imageCropper = locator<ImageCropper>();
final sessionManager = locator<SessionManager>();
final actionHandlerService = locator<ActionHandlerService>();

void testSetupLocator() {
  locator.registerSingleton(CacheService());

  locator.registerSingleton(DataBaseMutationFunctions());

  locator.registerSingleton(GraphqlConfig());

  //services
  locator.registerSingleton(NavigationService());

  //sizeConfig
  locator.registerSingleton(SizeConfig());

  //userConfig
  locator.registerSingleton(UserConfig());

  locator.registerSingleton(SessionManager());

  //Services
  locator.registerLazySingleton(() => OrganizationService());
  locator.registerLazySingleton(() => PostService());
  locator.registerLazySingleton(() => EventService());
  locator.registerLazySingleton(() => CommentService());
  locator.registerLazySingleton(() => ChatService());
  locator.registerLazySingleton(() => Connectivity());
  locator.registerLazySingleton(() => MultiMediaPickerService());
  locator.registerLazySingleton(() => ImageService());
  locator.registerLazySingleton(() => ImagePicker());
  locator.registerLazySingleton(() => ImageCropper());
  locator.registerSingleton(() => OrganizationService());

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
  locator.registerFactory(() => AccessScreenViewModel());
  locator.registerFactory(() => SignupDetailsViewModel());
  locator.registerFactory(() => WaitingViewModel());
  locator.registerFactory(() => ExploreEventsViewModel());
  locator.registerFactory(() => MainScreenViewModel());
  locator.registerFactory(() => ProfilePageViewModel());
  locator.registerFactory(() => EditProfilePageViewModel());
  locator.registerFactory(() => CreateEventViewModel());
  locator.registerFactory(() => EditEventViewModel());
  locator.registerFactory(() => AddPostViewModel());
  locator.registerFactory(() => EventInfoViewModel());
  locator.registerFactory(() => AppSettingViewModel());

  //Widgets viewModels
  locator.registerFactory(() => ProgressDialogViewModel());
  locator.registerFactory(() => CustomDrawerViewModel());
  locator.registerFactory(() => LikeButtonViewModel());
  locator.registerFactory(() => AppLanguage(isTest: true));
  locator.registerFactory(() => CommentsViewModel());
  locator.registerFactory(() => AppTheme());
  locator.registerFactory(() => DirectChatViewModel());
  locator.registerFactory(() => SelectContactViewModel());
  locator.registerFactory(() => UserProfileService());

  //AppLinks
  locator.registerSingleton(AppLinks());
}
