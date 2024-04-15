import 'package:omni_app_flutter/core/constants/app_constants.dart';
import 'package:omni_app_flutter/data/dtos/photo_dto.dart';

class PhotoModel {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  PhotoModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl
  });

  static PhotoModel fromDTO({PhotoDTO? dto}) {
    return PhotoModel(
        albumId: dto?.albumId ?? kDefaultInitInt,
        id: dto?.id ?? kDefaultInitInt,
        title: dto?.title ?? kDefaultEmptyString,
        url: dto?.url ?? kDefaultEmptyString,
        thumbnailUrl: dto?.thumbnailUrl ?? kDefaultEmptyString
    );
  }
}