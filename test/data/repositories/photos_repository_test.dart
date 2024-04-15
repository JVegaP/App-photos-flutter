import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:omni_app_flutter/data/datasource/photos_remote_data_source.dart';
import 'package:omni_app_flutter/data/repositories/photos_repository_imp.dart';
import 'package:omni_app_flutter/domain/models/photo_model.dart';
import 'package:omni_app_flutter/domain/repositories/photos_repository.dart';

class MockPhotosRemoteDataSource extends Mock implements PhotosRemoteDataSource {}
main() {
  final MockPhotosRemoteDataSource mockPhotosRemoteDataSource = MockPhotosRemoteDataSource();
  PhotosRepository photosRepository = IPhotosRepository(
    photosRemoteDataSource: mockPhotosRemoteDataSource
  );

  PhotoModel photo = PhotoModel(
      albumId: 1,
      id: 1,
      title: "foto de prueba",
      url: "https://www.test.com.co",
      thumbnailUrl: "https://www.test.com.co"
  );

  group("Get list photos", () {
    tearDown((){
      verifyNoMoreInteractions(mockPhotosRemoteDataSource);
    });
    List<PhotoModel> photos = [];
    photos.add(photo);

    test("Get list photos success", () async {
      when(() => mockPhotosRemoteDataSource.getPhotos()).thenAnswer((_) async => photos);

      var result = await photosRepository.getPhotos();
      expect(result?.length, 1);

      verify(() => mockPhotosRemoteDataSource.getPhotos());
    });

    test("Get list photos failed", () async {
      when(() => mockPhotosRemoteDataSource.getPhotos()).thenAnswer((_) async => null);

      var result = await photosRepository.getPhotos();
      expect(result, null);

      verify(() => mockPhotosRemoteDataSource.getPhotos());
    });
  });

}