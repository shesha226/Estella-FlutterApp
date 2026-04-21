import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/onboarding_view_model.dart';
import 'views/onboarding_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => OnboardingViewModel())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingView(),
    );
  }
}
