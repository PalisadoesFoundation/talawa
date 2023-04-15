import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talawa/main.dart';
import 'package:talawa/services/chat_service.dart';
import 'package:talawa/services/comment_service.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/org_service.dart';
import 'package:talawa/services/post_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/task_service.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/after_auth_view_models/add_post_view_models/add_post_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/edit_event_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/feed_view_models/organization_feed_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/edit_profile_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/profile_page_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/task_view_models/create_task_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/task_view_models/explore_tasks_view_model.dart';
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

// Creating an instance of GetIt and storing it in a global variable
/// Intializaing the locator.
GetIt locator = GetIt.instance;

///creating GetIt for UserConfig.
final userConfig = locator<UserConfig>();

///creating GetIt for NavigationService.
final navigationService = locator<NavigationService>();

///creating GetIt for DataBaseMutationFunctions.
final databaseFunctions = locator<DataBaseMutationFunctions>();

///creating GetIt for GraphqlConfig.
final graphqlConfig = locator<GraphqlConfig>();

///creating GetIt for SizeConfig.
final sizeConfig = locator<SizeConfig>();

///creating GetIt for Queries.
final queries = locator<Queries>();

///creating GetIt for Connectivity.
final connectivity = locator<Connectivity>();

///creating GetIt for OrganizationService.
final organizationService = locator<OrganizationService>();

///creating GetIt for ImageCropper.
final imageCropper = locator<ImageCropper>();

///creating GetIt for ImagePicker.
final imagePicker = locator<ImagePicker>();

/// This function registers the widgets/objects in "GetIt".
///
/// **params**:
///   None
///
/// **returns**:
///   None
void setupLocator() {
  //services
  locator.registerSingleton(NavigationService());

  //sizeConfig
  locator.registerSingleton(SizeConfig());

  locator.registerSingleton(Validator());

  //userConfig
  locator.registerSingleton(UserConfig());

  //Services
  locator.registerLazySingleton(() => PostService());
  locator.registerLazySingleton(() => EventService());
  locator.registerLazySingleton(() => TaskService());
  locator.registerLazySingleton(() => CommentService());
  locator.registerLazySingleton(() => OrganizationService());
  locator.registerLazySingleton(() => MultiMediaPickerService());
  locator.registerLazySingleton(() => Connectivity());
  locator.registerLazySingleton(() => ChatService());
  locator.registerLazySingleton(() => ImageCropper());
  locator.registerLazySingleton(() => ImagePicker());

  //graphql
  locator.registerSingleton(GraphqlConfig());

  //databaseMutationFunction
  locator.registerSingleton(DataBaseMutationFunctions());

  //queries
  locator.registerSingleton(Queries());

  //Page viewModels
  locator.registerFactory(() => DemoViewModel());
  // locator.registerFactory(() => OrganizationFeedViewModel());
  locator.registerFactory(() => OrganizationFeedViewModel());
  locator.registerFactory(() => SetUrlViewModel());
  locator.registerFactory(() => LoginViewModel());

  locator.registerFactory(() => SelectOrganizationViewModel());
  locator.registerFactory(() => SignupDetailsViewModel());
  locator.registerFactory(() => WaitingViewModel());
  locator.registerFactory(() => ExploreEventsViewModel());
  locator.registerFactory(() => ExploreTasksViewModel());
  locator.registerFactory(() => CreateTaskViewModel());
  locator.registerFactory(() => MainScreenViewModel());
  locator.registerFactory(() => ProfilePageViewModel());
  locator.registerFactory(() => EditProfilePageViewModel());
  locator.registerFactory(() => CreateEventViewModel());
  locator.registerFactory(() => EditEventViewModel());
  locator.registerFactory(() => AddPostViewModel());
  locator.registerFactory(() => EventInfoViewModel());

  //Widgets viewModels
  locator.registerFactory(() => ProgressDialogViewModel());
  locator.registerFactory(() => CustomDrawerViewModel());
  locator.registerFactory(() => LikeButtonViewModel());
  locator.registerFactory(() => AppLanguage());
  locator.registerFactory(() => CommentsViewModel());
  locator.registerFactory(() => AppTheme());
  locator.registerFactory(() => DirectChatViewModel());
}
