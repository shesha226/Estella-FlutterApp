import 'package:flutter/material.dart';
import '../viewmodels/onboarding_view_model.dart';

class OnboardingView extends StatelessWidget {
  final OnboardingViewModel viewModel = OnboardingViewModel();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 613,
            child: Image.asset(viewModel.content.imagePath, fit: BoxFit.cover),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 319,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300]?.withOpacity(0.9),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      viewModel.content.title,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      viewModel.content.subTitle,
                      style: const TextStyle(
                        fontSize: 26,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        viewModel.content.description,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Get Started Button
                    GestureDetector(
                      onTap: () => viewModel.startApp(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red[900],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
