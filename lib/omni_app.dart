import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omni_app_flutter/core/constants/color_constants.dart';
import 'package:omni_app_flutter/core/themes/app_theme.dart';
import 'package:omni_app_flutter/presentation/providers/home/home_provider.dart';
import 'package:omni_app_flutter/presentation/providers/splash/splash_provider.dart';
import 'package:omni_app_flutter/presentation/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';

class OmniApp extends StatefulWidget {
  const OmniApp({
    Key? key
  }) : super(key: key);

  @override
  OmniAppState createState() => OmniAppState();
}

class OmniAppState extends State<OmniApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: kPrimary.withOpacity(.9))
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        theme: AppTheme.getAppTheme(),
      ),
    );
  }
}