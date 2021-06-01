import 'package:get_it/get_it.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/demo_view_model.dart';
import 'package:talawa/view_model/organization_feed_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //services
  locator.registerSingleton(NavigationService());

  //sizeConfig
  locator.registerSingleton(SizeConfig());

  //Page viewModels
  locator.registerFactory(() => DemoViewModel());
  locator.registerFactory(() => OrganizationFeedViewModel());
}
