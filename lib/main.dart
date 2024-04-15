import 'package:flutter/material.dart';
import 'package:omni_app_flutter/core/di/dependency_injection_config.dart';
import 'package:omni_app_flutter/omni_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const OmniApp());
}