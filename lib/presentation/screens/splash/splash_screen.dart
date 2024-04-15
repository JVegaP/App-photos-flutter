import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:omni_app_flutter/core/constants/app_constants.dart';
import 'package:omni_app_flutter/core/constants/color_constants.dart';
import 'package:omni_app_flutter/core/constants/string_constants.dart';
import 'package:omni_app_flutter/core/constants/style_constants.dart';
import 'package:omni_app_flutter/core/constants/widget_constants.dart';
import 'package:omni_app_flutter/core/di/dependency_injection_config.dart';
import 'package:omni_app_flutter/core/managers/route_manager.dart';
import 'package:omni_app_flutter/core/themes/app_theme.dart';
import 'package:omni_app_flutter/core/utils/utils.dart';
import 'package:omni_app_flutter/presentation/providers/splash/splash_provider.dart';
import 'package:omni_app_flutter/presentation/widgets/widget_background.dart';
import 'package:omni_app_flutter/presentation/widgets/widget_text_label.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key
  }): super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  SplashProvider state = getIt<SplashProvider>();

  @override
  void initState() {
    state = Provider.of<SplashProvider>(context, listen: false);
    _setUpView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    state = Provider.of<SplashProvider>(context, listen: true);
    return Scaffold(
        backgroundColor: kWhite,
        body: _mainContainer()
    );
  }

  ///----------------------------- PRIVATE METHODS --------------------------///

  /// Method create structure base of view
  Widget _mainContainer() {
    return Stack(
      children: [
        const WidgetBackground(key: Key(kWidgetBackground)),
        Center(
          child: Stack(
            children: [
              AnimatedOpacity(
                opacity: state.opacityAnimation,
                duration: const Duration(milliseconds: kDurationMs1000),
                curve: Curves.linear,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: kDimens150),
                  child: Center(
                    child: Lottie.asset(
                      kAnimationSplash,
                      height: kDimens200,
                      width: kDimens200,
                      fit: BoxFit.contain,
                      repeat: false,
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: state.opacityText,
                duration: const Duration(milliseconds: kDurationMs1500),
                curve: Curves.linear,
                child: Center(
                  child: WidgetTextLabel(
                    key: const Key(kWidgetTextLabelTitleSplash),
                    text: kNameApp,
                    textAlign: TextAlign.center,
                    textStyle: AppTheme.getAppTheme().textTheme.bodyLarge?.copyWith(
                        color: kPrimary,
                        fontSize: kDimens40
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  /// Method that setup the initial information of the view
  _setUpView() {
    _showText();
    _hideAnimation();
    _goToLogin();
  }

  /// Method that show text splash
  _showText() {
    functionDelay(timeDuration: kDurationMs1000, function:() {
      state.opacityText = kWithOpacity;
    });
  }

  /// Method that hide animation splash
  _hideAnimation() {
    functionDelay(timeDuration: kDurationMs2500, function:() {
      state.opacityAnimation = kWithoutOpacity;
    });
  }

  /// Method that navigate to login screen
  _goToLogin() {
    functionDelay(timeDuration: kDurationMs3000, function:() {
      route.openHomeScreen(context);
    });
  }
}