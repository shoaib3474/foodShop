import 'package:flutter/material.dart';
import 'package:food_shop/pages/add_to_cart_page.dart';
import 'package:food_shop/pages/card_page.dart';
import 'package:food_shop/pages/check_out_page.dart';
import 'package:food_shop/styles/app_size.dart';

import 'pages/auth/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        AppSize.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ShoppingCartPage(),
        );
      },
    );
  }
}
