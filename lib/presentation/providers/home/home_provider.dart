import 'package:flutter/material.dart';
import 'package:omni_app_flutter/core/constants/app_constants.dart';
import 'package:omni_app_flutter/core/constants/string_constants.dart';
import 'package:omni_app_flutter/core/di/dependency_injection_config.dart';
import 'package:omni_app_flutter/domain/models/photo_model.dart';
import 'package:omni_app_flutter/domain/use_cases/get_photos_use_case.dart';

class HomeProvider with ChangeNotifier {
  final GetPhotosUseCase _getPhotosUseCase;

  HomeProvider({
    GetPhotosUseCase? getPhotosUseCase
  }): _getPhotosUseCase = getPhotosUseCase ?? getIt<GetPhotosUseCase>();

  String _errorMessage = kDefaultEmptyString;
  String get errorMessage => _errorMessage;
  set errorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  final List<PhotoModel> _photos = <PhotoModel>[];
  List<PhotoModel> get photos => _photos;
  set photos(List<PhotoModel> photos){
    _photos.addAll(photos);
    notifyListeners();
  }

  /// Method that list photos
  Future<List<PhotoModel>> getPhotos() async {
    var response = await _getPhotosUseCase.invoke(
        currentItems: photos.length,
        itemsPerPage: kDefaultItemsPage
    );
    if(response != null) {
      return response;
    }
    errorMessage = kErrorMessagePhotos;
    return <PhotoModel>[];
  }

}