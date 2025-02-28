import 'package:flutter/material.dart';
import 'package:food_shop/pages/auth/sign_in_page.dart';
import 'package:food_shop/styles/app_text.dart';
import 'package:food_shop/styles/assets.dart';
import 'package:food_shop/styles/app_size.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    AppSize.init(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.splash_image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: AppSize.responsiveHeight(90),
            left: AppSize.responsiveWidth(47),
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSize.responsiveWidth(50)),
              height: AppSize.responsiveHeight(200),
              width: AppSize.responsiveWidth(320),
              child: Column(
                children: [
                  Text('Welcome to', style: AppText.heading1),
                  Image.asset(Assets.big_cart),
                ],
              ),
            ),
          ),
          Positioned(
            top: AppSize.responsiveHeight(800),
            left: AppSize.responsiveWidth(147),
            child: Text('POWERED BY', style: AppText.paragraphStyle),
          ),
          Positioned(
            top: AppSize.responsiveHeight(820),
            left: AppSize.responsiveWidth(121),
            child: Text('THE CODE CRAFT', style: AppText.customTextStyle),
          ),
        ],
      ),
    );
  }
}
