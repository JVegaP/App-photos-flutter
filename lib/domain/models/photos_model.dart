import 'package:omni_app_flutter/data/dtos/photo_dto.dart';
import 'package:omni_app_flutter/domain/models/photo_model.dart';

class PhotosModel {
  List<PhotoModel> photos;

  PhotosModel({
    required this.photos
  });

  static PhotosModel fromDTO(List<PhotoDTO> dto) {
    return PhotosModel(
        photos: List<PhotoModel>.from(dto.map((data) => PhotoModel.fromDTO(dto: data)))
    );
  }
}