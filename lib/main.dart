import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/cart_view_model.dart'; // ඔයාගේ Path එක හරියට දාන්න
import 'viewmodels/login_view_model.dart';
import 'views/login_screen.dart';

void main() {
  runApp(
    // මෙන්න මෙතනදී තමයි අපි ViewModels ටික ඇප් එකට හඳුන්වා දෙන්නේ
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        // වෙනත් ViewModels තියෙනවා නම් ඒවත් මෙතනට දාන්න
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Estella Fashion',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const LoginScreen(), // මුලින්ම Login එකට යනවා
    );
  }
}
