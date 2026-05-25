import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/register_model.dart';

class RegisterViewModel extends ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _isProcessing = false;
  bool get isProcessing => _isProcessing;

  Future<void> createAccount(BuildContext context) async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      _showToast(context, 'Please fill in all fields', Colors.orange);
      return;
    }

    if (password != confirmPassword) {
      _showToast(context, 'Passwords do not match', Colors.red);
      return;
    }

    if (password.length < 6) {
      _showToast(
        context,
        'Password must be at least 6 characters',
        Colors.orange,
      );
      return;
    }

    try {
      _isProcessing = true;
      notifyListeners();

      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      String uId = credential.user!.uid;

      AppUserModel newUser = AppUserModel(
        userId: uId,
        fullName: name,
        emailAddress: email,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set(newUser.toDatabaseMap());

      _isProcessing = false;
      notifyListeners();

      if (context.mounted) {
        _showToast(context, 'Registration Successful!', Colors.green);
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      _isProcessing = false;
      notifyListeners();

      String errorMsg = 'Registration failed. Try again.';
      if (e.code == 'email-already-in-use') {
        errorMsg = 'This email is already registered.';
      } else if (e.code == 'invalid-email') {
        errorMsg = 'The email address is invalid.';
      } else if (e.code == 'weak-password') {
        errorMsg = 'The password is too weak.';
      }

      if (context.mounted) {
        _showToast(context, errorMsg, Colors.red);
      }
    } catch (e) {
      _isProcessing = false;
      notifyListeners();
      debugPrint("Error: $e");
    }
  }

  void _showToast(BuildContext context, String text, Color bg) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(text), backgroundColor: bg));
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
