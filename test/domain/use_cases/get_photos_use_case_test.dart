import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:omni_app_flutter/domain/models/photo_model.dart';
import 'package:omni_app_flutter/domain/repositories/photos_repository.dart';
import 'package:omni_app_flutter/domain/use_cases/get_photos_use_case.dart';

class MockPhotosRepository extends Mock implements PhotosRepository {}
main() {
  final MockPhotosRepository mockPhotosRepository = MockPhotosRepository();
  GetPhotosUseCase getPhotosUseCase = IGetPhotosUseCase(
      photosRepository: mockPhotosRepository
  );

  const defaultCurrentItems = 0;
  const defaultItemsPerPage = 2;
  PhotoModel photoOne = PhotoModel(
      albumId: 1,
      id: 1,
      title: "foto de prueba",
      url: "https://www.test.com.co",
      thumbnailUrl: "https://www.test.com.co"
  );
  PhotoModel photoTwo = PhotoModel(
      albumId: 2,
      id: 2,
      title: "foto de prueba 2",
      url: "https://www.test.com.co",
      thumbnailUrl: "https://www.test.com.co"
  );
  PhotoModel photoThree = PhotoModel(
      albumId: 3,
      id: 3,
      title: "foto de prueba 3",
      url: "https://www.test.com.co",
      thumbnailUrl: "https://www.test.com.co"
  );

  group("Get list photos", () {
    tearDown((){
      verifyNoMoreInteractions(mockPhotosRepository);
    });
    List<PhotoModel> photos = [];
    photos..add(photoOne)..add(photoTwo)..add(photoThree);

    test("Get list photos success with pagination when the total items response is greater", () async {
      when(() => mockPhotosRepository.getPhotos()).thenAnswer((_) async => photos);

      var result = await getPhotosUseCase.invoke(
          currentItems: defaultCurrentItems,
          itemsPerPage: defaultItemsPerPage
      );
      expect(result?.isNotEmpty, true);
      expect(result?.length, 2);

      verify(() => mockPhotosRepository.getPhotos());
    });

    test("Get list photos success with pagination when the total items response is less", () async {
      when(() => mockPhotosRepository.getPhotos()).thenAnswer((_) async => photos);

      var result = await getPhotosUseCase.invoke(
          currentItems: defaultCurrentItems,
          itemsPerPage: 4
      );
      expect(result?.isNotEmpty, true);
      expect(result?.length, photos.length);

      verify(() => mockPhotosRepository.getPhotos());
    });


    test("Get list photos failed", () async {
      when(() => mockPhotosRepository.getPhotos()).thenAnswer((_) async => null);

      var result = await getPhotosUseCase.invoke(
          currentItems: defaultCurrentItems,
          itemsPerPage: defaultItemsPerPage
      );
      expect(result, null);

      verify(() => mockPhotosRepository.getPhotos());
    });
  });

}