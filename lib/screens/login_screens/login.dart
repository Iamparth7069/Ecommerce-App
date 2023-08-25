import 'package:flutter/material.dart';
import 'package:shoppio_app/preferences/pref_manager.dart';
import 'package:shoppio_app/screens/login_screens/component/Body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
