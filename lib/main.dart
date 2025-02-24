import 'package:flutter/material.dart';
import 'package:food_shop/pages/auth/sign_in_page.dart';
import 'package:food_shop/pages/splash_page.dart';
import 'package:food_shop/styles/app_size.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        AppSize.init(context); // Initialize AppSize with MediaQuery data
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignInPage(),
        );
      },
    );
  }
}
