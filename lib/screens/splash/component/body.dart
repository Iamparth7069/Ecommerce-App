
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoppio_app/preferences/pref_manager.dart';
import 'package:shoppio_app/rooutes/approutes.dart';

import '../../../component/constants.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), () {
        // if(PrefManager.getLoginStatus()){
        //   // true
        //   Navigator.pushReplacementNamed(context, AppRoute.homeScreen);
        // }else{
        //   // navigate to onboarding
        //   if(PrefManager.getVisitedStatus()){
        //     // navigate to Login
        //     Navigator.pushReplacementNamed(context, AppRoute.loginScreen);
        //   }else{
        //     Navigator.pushReplacementNamed(context, AppRoute.onBoardingScreen);
        //   }
        // }


        FirebaseAuth.instance.authStateChanges().listen((User? user) {
          if(user == null){
            var status = PrefManager.getLoginStatus();
            if(status){
              //navigate to login
              Navigator.pushReplacementNamed(context, AppRoute.loginScreen);
            }else{
              // navigate to onbodding
              Navigator.pushReplacementNamed(context, AppRoute.onBoardingScreen);
            }
          }else{
            Navigator.pushReplacementNamed(context, AppRoute.homeScreen);
          }
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Container(decoration: BoxDecoration(
        //     // gradient: kbackgroundColors),
        // color: Colors.lightBlue,
        // ),
        Container(
          // color: Colors.red,
          decoration: BoxDecoration(
            gradient: kbackgroundColors
          ),
        ),
        Center(
          child: Image.asset(
            'assets/images/app_logo.png',
            height: 140,
            width: 140,
          ),
        ),
      ],
    );
  }
}
