import 'package:omni_app_flutter/core/constants/app_constants.dart';
import 'package:omni_app_flutter/core/di/dependency_injection_config.dart';
import 'package:omni_app_flutter/domain/models/photo_model.dart';
import 'package:omni_app_flutter/domain/repositories/photos_repository.dart';

/// Use case that obtain list of photos
abstract class GetPhotosUseCase {
  /// Method that returns a list of photos with pagination
  Future<List<PhotoModel>?> invoke({
    required int currentItems,
    required int itemsPerPage
  });
}

/// Implementation Use case that obtain list of photos
class IGetPhotosUseCase extends GetPhotosUseCase {
  final PhotosRepository _photosRepository;

  IGetPhotosUseCase({
    PhotosRepository? photosRepository
  }): _photosRepository = photosRepository ?? getIt<PhotosRepository>();

  @override
  Future<List<PhotoModel>?> invoke({
    required int currentItems,
    required int itemsPerPage
  }) async{
    final response = await _photosRepository.getPhotos();
    if(response != null) {
      if(currentItems + itemsPerPage > response.length) {
        return response.getRange(currentItems, response.length).toList();
      }
      return response.getRange(currentItems, currentItems + itemsPerPage).toList();
    }
    return response;
  }
}