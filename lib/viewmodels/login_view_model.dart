import 'package:flutter/material.dart';
import '../models/login_model.dart';

class LogingViewModel extends ChangeNotifier {
  bool _isObscure = true;
  bool get isObscure => _isObscure;

  void togglePasswordVisibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  void loginavigate(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }
}
