import 'package:estella/views/home_screen.dart';
import 'package:flutter/material.dart';
import '../models/login_model.dart';
import '../views/login_screen.dart';

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
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }
}
