import 'package:flutter/material.dart';
import '../viewmodels/login_view_model.dart';
import 'package:provider/provider.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LogingViewModel(),
      child: Scaffold(
        body: Consumer<LogingViewModel>(
          builder: (context, viewModel, child) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/login_background.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(color: Colors.black.withOpacity(0.3)),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Estella', style: TextStyle(fontSize: 48, color: Colors.white, fontWeight: FontWeight.bold)),
                      Text('Login', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
                      _buildTextField(Icons.person, 'Username', false),
                      _buildPasswordField(Icons.lock, 'Password', false),
                      SizedBox(height: 20),
                      _buildRememberMeRow(),
                      SizedBox(height: 20),
                      _buildLogingButton(context, viewModel),
                      SizedBox(height: 20),
                      SizedBox(height: 20),
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
      ),
    );
  }

  Widget _buildPasswordField(IconData icon, String hint, bool obscure) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
      ),
    );
  }

  Widget _buildRememberMeRow() {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (value) {}),
        Text('Remember me'),
      ],
    );
  }

  Widget _buildLogingButton(BuildContext context, LogingViewModel viewModel) {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Login'),
    );
  }

  Widget _buildSignupLink(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterScreen()));
      },
      child: Text('Sign up'),
    );
  }
}
