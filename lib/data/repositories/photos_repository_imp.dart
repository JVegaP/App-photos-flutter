
import 'package:omni_app_flutter/core/di/dependency_injection_config.dart';
import 'package:omni_app_flutter/data/datasource/photos_remote_data_source.dart';
import 'package:omni_app_flutter/domain/models/photo_model.dart';
import 'package:omni_app_flutter/domain/repositories/photos_repository.dart';

/// Implementation Photos Repository that obtain data of photos
class IPhotosRepository extends PhotosRepository {
  final PhotosRemoteDataSource _photosRemoteDataSource;

  IPhotosRepository({
    PhotosRemoteDataSource? photosRemoteDataSource
  }): _photosRemoteDataSource = photosRemoteDataSource ?? getIt<PhotosRemoteDataSource>();

  ///--------------------------- PUBLIC METHODS ---------------------------- ///

  @override
  Future<List<PhotoModel>?> getPhotos() async {
    return await _photosRemoteDataSource.getPhotos();
  }
}