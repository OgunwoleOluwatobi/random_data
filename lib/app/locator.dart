import 'package:get_it/get_it.dart';
import 'package:random_data/core/data_sources/remote_data_source/remote_data_source.dart';
import 'package:random_data/core/data_sources/remote_data_source/remote_data_source_impl.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:random_data/core/services/http/http_service.dart';
import 'package:random_data/core/services/http/http_service_impl.dart';
import 'package:random_data/core/utils/exports.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator({bool test = false}) async {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<DialogService>(
    () => DialogService(),
  );
  locator.registerLazySingleton<SnackbarService>(
    () => SnackbarService(),
  );
  locator.registerLazySingleton<HttpService>(() => HttpServiceImpl());
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
}
