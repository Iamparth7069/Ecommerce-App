import 'package:flutter/material.dart';
import 'package:shoppio_app/category_List/categori_List.dart';
import 'package:shoppio_app/model/category.dart';
import 'package:shoppio_app/model/product.dart';
import 'package:shoppio_app/screens/forget_password/Component/Body.dart';
import 'package:shoppio_app/screens/home/home_screen.dart';
import 'package:shoppio_app/screens/onboarding/on_boarding_screen.dart';
import 'package:shoppio_app/screens/product_add/product_add.dart';
import 'package:shoppio_app/screens/product_list/product_list.dart';

import '../categorys/category_matirial.dart';
import '../screens/Register_Page/rp_pages.dart';
import '../screens/login_screens/login.dart';
import '../screens/splash/splash_screen.dart';
import '../updatedatafirebase/updatedata.dart';

class AppRoute {
  static const splashScreen = '/';
  static const addCategoty = '/addCategory';
  static const onBoardingScreen = '/onBoarding';
  static const loginScreen = '/login';
  static const Category_List1 = '/Category_List';
  static const foegetscreens = '/forget';
  static const homeScreen = '/home';
  // static const registerpage = '/register';
  static const registerpage1 = '/register';
  static const productList = '/productList';
  static const productadd = '/productadd';
  static const updateData = "/update";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );

      case onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => OnBoardingScreen(),
        );

      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case foegetscreens:
        return MaterialPageRoute(builder: (context) => BodyForget(),);
      case registerpage1:
        return MaterialPageRoute(builder: (context) => registerpage(),);
      case homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen(),);
      case Category_List1:
        return MaterialPageRoute(builder: (context) => Category_List(),);
      case addCategoty:
        Category? cat = settings.arguments != null ? settings.arguments as Category : null;
        return MaterialPageRoute(builder: (context) => category_manage(cat),);
      case productList:
        return MaterialPageRoute(builder: (context) => product_list(),);
      case productadd:
        Product? product = settings.arguments != null ? settings.arguments as Product : null;
        return MaterialPageRoute(builder: (context) => product_add(product),);

    }
  }
}
