import 'package:flutter/material.dart';
import 'package:shoppio_app/screens/home/component/LayoutHeader.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            LayoutHeader(),
          ],
        ),
      ),
    );
  }
}
