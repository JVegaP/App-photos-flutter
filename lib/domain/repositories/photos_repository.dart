import 'package:omni_app_flutter/domain/models/photo_model.dart';

/// Photos Repository that obtain data of photos
abstract class PhotosRepository {
  /// Method that obtain list of photos
  Future<List<PhotoModel>?> getPhotos();
}