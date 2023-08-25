import 'package:flutter/material.dart';

import 'Sign_up_forms.dart';
import 'layoutheader.dart';

class BodyForSignUp extends StatefulWidget {
  const BodyForSignUp({super.key});

  @override
  State<BodyForSignUp> createState() => _BodyForSignUpState();
}

class _BodyForSignUpState extends State<BodyForSignUp> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            AppBar(),
            layoutheader(),
            SizedBox(
              height: 26,
            ),
            Sign_up_forms(),
          ],
        ),
      ),
    );
  }
}
