import 'package:flutter/material.dart';
import 'package:omni_app_flutter/core/constants/app_constants.dart';

class SplashProvider with ChangeNotifier {

  double _opacityText = kWithoutOpacity;
  double get opacityText => _opacityText;
  set opacityText(double opacityText) {
    _opacityText = opacityText;
    notifyListeners();
  }

  double _opacityAnimation = kWithOpacity;
  double get opacityAnimation => _opacityAnimation;
  set opacityAnimation(double opacityAnimation) {
    _opacityAnimation = opacityAnimation;
    notifyListeners();
  }

}