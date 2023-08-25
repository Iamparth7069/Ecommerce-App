import 'package:flutter/material.dart';
import 'package:shoppio_app/component/constants.dart';


class LayoutHeader extends StatelessWidget {
  const LayoutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/app_logo.png',
          height: 100,
          width: 100,
        ),
        SizedBox(height: 16,),
        Text(
          "Welcome Back",
          style: headingstyle,
        ),
        SizedBox(height: 8,),
        Text(
          "Sign in with your email and password",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
