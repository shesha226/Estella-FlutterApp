import 'package:flutter/material.dart';
import '../viewmodels/login_view_model.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Scaffold(
        body: Consumer<LoginViewModel>(
          builder: (context, viewModel, child) {
            return Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/Gemini_Generated_Image_556xtz556xtz556x.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(color: Colors.black.withValues(alpha: 0.3)),

                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      Text(
                        'Estella',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 48,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 250),
                      _buildTextField(Icons.person, 'Username', false),
                      const SizedBox(height: 30),
                      _buildPasswordField(viewModel, 'Password'),
                      const SizedBox(height: 20),
                      _buildRememberMeRow(),
                      const SizedBox(height: 20),
                      _buildLogingButton(context, viewModel),
                      const SizedBox(height: 20),
                      _buildSignupLink(context),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hint, bool obscure) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.8),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildPasswordField(LoginViewModel viewModel, String hint) {
    return TextField(
      obscureText: viewModel.isPasswordObscure,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        hintText: hint,
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.8),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

        suffixIcon: IconButton(
          icon: Icon(
            viewModel.isPasswordObscure
                ? Icons.visibility_off
                : Icons.visibility,
          ),
          onPressed: () {
            viewModel.togglePasswordVisibility();
          },
        ),
      ),
    );
  }

  Widget _buildRememberMeRow() {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (value) {}),
        const Text('Remember me', style: TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildLogingButton(BuildContext context, LoginViewModel viewModel) {
    return ElevatedButton(
      onPressed: () {
        viewModel.login(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFEB0000),
        foregroundColor: Colors.white,
        fixedSize: const Size(270, 45),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: const Text('Login'),
    );
  }

  Widget _buildSignupLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an account?',
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterScreen()),
            );
          },
          child: const Text(
            ' Sign Up',
            style: TextStyle(color: Colors.lightBlueAccent),
          ),
        ),
      ],
    );
  }
}
