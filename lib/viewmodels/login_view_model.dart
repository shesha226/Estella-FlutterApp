import 'package:flutter/material.dart';
import '../views/home_screen.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isPasswordObscure = true;
  bool get isPasswordObscure => _isPasswordObscure;

  void togglePasswordVisibility() {
    _isPasswordObscure = !_isPasswordObscure;
    notifyListeners();
  }

  void login(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }
}
