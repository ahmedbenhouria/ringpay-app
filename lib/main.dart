import 'package:flutter/material.dart';
import 'package:ring_pay/core/configs/theme/app_theme.dart';
import 'package:ring_pay/presentation/onboarding/onboarding.dart';

import 'core/configs/utils/image_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ImageUtils.svgPrecacheImage();
  runApp(const MyApp());
}

Future<void> svgPrecacheImages() async {
  return ImageUtils.svgPrecacheImage();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ring Pay',
      theme: AppTheme.lightTheme,
      home: OnboardingScreen(),
    );
  }
}
