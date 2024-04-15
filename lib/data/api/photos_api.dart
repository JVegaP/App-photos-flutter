import 'package:omni_app_flutter/core/constants/api_constants.dart';
import 'package:omni_app_flutter/core/managers/network_call_manager.dart';
import 'package:omni_app_flutter/data/dtos/photo_dto.dart';
import 'package:omni_app_flutter/data/dtos/photos_dtos.dart';

/// Photos api to get remote data
class PhotosApi {
  String url;
  PhotosApi({
    required this.url
  });

  /// -------------------- PUBLIC METHODS -------------------- ///
  Future<List<PhotoDTO>?> getPhotos() async {
    final response = await callGet(url: '$url$kEndPointPhotos');
    if(response != null) {
      return PhotosDTO.fromJson(response).photos;
    }
    return null;
  }
}