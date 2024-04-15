import 'package:omni_app_flutter/core/di/dependency_injection_config.dart';
import 'package:omni_app_flutter/data/api/photos_api.dart';
import 'package:omni_app_flutter/data/dtos/photo_dto.dart';
import 'package:omni_app_flutter/domain/models/photo_model.dart';
import 'package:omni_app_flutter/domain/models/photos_model.dart';

/// Photos Remote Data Source that obtain list of photos
abstract class PhotosRemoteDataSource {
  /// Method that obtain list photos
  Future<List<PhotoModel>?> getPhotos();
}

/// Implementation Photos Remote Data Source that obtain list of photos
class IPhotosRemoteDataSource extends PhotosRemoteDataSource {
  final PhotosApi _photosApi;
  
  IPhotosRemoteDataSource({
    PhotosApi? photosApi
  }): _photosApi = photosApi ?? getIt<PhotosApi>();
  
  @override
  Future<List<PhotoModel>?> getPhotos() async{
    final List<PhotoDTO>? response = await _photosApi.getPhotos();
    if(response != null) {
      return PhotosModel.fromDTO(response).photos;
    }
    return null;
  }
}