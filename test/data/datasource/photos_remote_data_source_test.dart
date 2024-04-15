import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:omni_app_flutter/data/api/photos_api.dart';
import 'package:omni_app_flutter/data/datasource/photos_remote_data_source.dart';
import 'package:omni_app_flutter/data/dtos/photo_dto.dart';

class MockPhotosApi extends Mock implements PhotosApi {}
main() {
  final MockPhotosApi mockPhotosApi = MockPhotosApi();
  PhotosRemoteDataSource photosRemoteDataSource = IPhotosRemoteDataSource(
      photosApi: mockPhotosApi
  );

  PhotoDTO photo = PhotoDTO(
      albumId: 1,
      id: 1,
      title: "foto de prueba",
      url: "https://www.test.com.co",
      thumbnailUrl: "https://www.test.com.co"
  );

  group("Get list photos", () {
    tearDown((){
      verifyNoMoreInteractions(mockPhotosApi);
    });
    List<PhotoDTO> photos = [];
    photos.add(photo);

    test("Get list photos success", () async {
      when(() => mockPhotosApi.getPhotos()).thenAnswer((_) async => photos);

      var result = await photosRemoteDataSource.getPhotos();
      expect(result?.isNotEmpty, true);

      verify(() => mockPhotosApi.getPhotos());
    });

    test("Get list photos failed", () async {
      when(() => mockPhotosApi.getPhotos()).thenAnswer((_) async => null);

      var result = await photosRemoteDataSource.getPhotos();
      expect(result, null);

      verify(() => mockPhotosApi.getPhotos());
    });
  });

}