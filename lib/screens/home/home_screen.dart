import 'package:flutter/material.dart';
import 'package:shoppio_app/screens/home/component/HomeDrawers.dart';

import 'component/HomeBody.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
      drawer: HomeDrawer(),
    );
  }
}
