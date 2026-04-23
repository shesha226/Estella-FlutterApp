import 'package:flutter/material.dart';
import '../models/onboarding_model.dart';
import '../views/login_screen.dart';

class OnboardingViewModel extends ChangeNotifier {
  final OnboardingModel _content = OnboardingModel(
    title: "Uncover your true",
    subTitle: "Fashion Sense",
    description: "Achieve your fitness goals with our innovative fitness App",
    imagePath: "assets/images/Gemini_Generated_Image_556xtz556xtz556x.png",
  );

  OnboardingModel get content => _content;

  void startApp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
