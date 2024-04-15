import 'package:omni_app_flutter/data/dtos/photo_dto.dart';

class PhotosDTO {
  List<PhotoDTO>? photos;

  PhotosDTO({
    this.photos
  });

  static PhotosDTO fromJson(List<dynamic> json) {
    return PhotosDTO(
      photos: List<PhotoDTO>.from(json.map((data) => PhotoDTO.fromJson(data)))
    );
  }
}