import 'package:flutter/material.dart';
import 'package:omni_app_flutter/core/constants/style_constants.dart';
import 'package:omni_app_flutter/presentation/screens/home/home_screen.dart';

final route = RoutesManager();
/// Class that manages screen routes for navigation
class RoutesManager {
  /// go to Home Screen
  openHomeScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
      opaque: true,
      pageBuilder: (context, animation, secondaryAnimation) {
        return const HomeScreen();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(kDimens1, kDimens0);
        const end = Offset(kDimens0, kDimens0);
        const curve = Curves.easeIn;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ));
  }
}