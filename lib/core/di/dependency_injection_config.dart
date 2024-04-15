import 'package:get_it/get_it.dart';
import 'package:omni_app_flutter/core/constants/api_constants.dart';
import 'package:omni_app_flutter/data/api/photos_api.dart';
import 'package:omni_app_flutter/data/datasource/photos_remote_data_source.dart';
import 'package:omni_app_flutter/data/repositories/photos_repository_imp.dart';
import 'package:omni_app_flutter/domain/repositories/photos_repository.dart';
import 'package:omni_app_flutter/domain/use_cases/get_photos_use_case.dart';
import 'package:omni_app_flutter/presentation/providers/home/home_provider.dart';
import 'package:omni_app_flutter/presentation/providers/splash/splash_provider.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  /// Api
  getIt.registerFactory<PhotosApi>(() => PhotosApi(url: kUrlBase));

  /// DataSource
  getIt.registerFactory<PhotosRemoteDataSource>(() => IPhotosRemoteDataSource());

  /// Repositories
  getIt.registerFactory<PhotosRepository>(() => IPhotosRepository());

  /// Use Cases
  getIt.registerFactory<GetPhotosUseCase>(() => IGetPhotosUseCase());

  /// Providers
  getIt.registerFactory<SplashProvider>(() => SplashProvider());
  getIt.registerFactory<HomeProvider>(() => HomeProvider());
}