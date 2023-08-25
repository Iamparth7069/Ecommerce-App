import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shoppio_app/component/constants.dart';
import 'package:shoppio_app/component/theme.dart';
import 'package:shoppio_app/preferences/pref_manager.dart';
import 'package:shoppio_app/rooutes/approutes.dart';
import 'package:shoppio_app/screens/splash/splash_screen.dart';

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    await PrefManager.init(); // initialize here ! important
    runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appname,
      theme: appTheme(),
      // home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
