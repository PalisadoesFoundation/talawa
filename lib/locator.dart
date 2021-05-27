import 'package:get_it/get_it.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/viewModel/demo_viewModel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //services
  locator.registerSingleton(() => NavigationService());

  //Page viewModels
  locator.registerFactory(() => DemoViewModel());
}
