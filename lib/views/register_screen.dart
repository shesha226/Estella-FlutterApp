import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          Container(color: Colors.black.withValues(alpha: 0.4)),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Text(
                    'Create Account',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 120),

                  // Fields ටික
                  _buildTextField(Icons.person, 'Full Name'),
                  const SizedBox(height: 30),
                  _buildTextField(Icons.email, 'Email'),
                  const SizedBox(height: 30),
                  _buildTextField(Icons.lock, 'Password', obscure: true),
                  const SizedBox(height: 30),
                  _buildTextField(
                    Icons.lock_outline,
                    'Confirm Password',
                    obscure: true,
                  ),

                  const SizedBox(height: 140),

                  ElevatedButton(
                    onPressed: () {
                      print("Registered!");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEB0000),
                      fixedSize: const Size(270, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hint, {bool obscure = false}) {
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
}
