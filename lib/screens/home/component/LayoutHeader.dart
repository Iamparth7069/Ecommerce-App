import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppio_app/component/custom_rouded_icons.dart';
import 'package:shoppio_app/component/search_filed.dart';

class LayoutHeader extends StatelessWidget {
  const LayoutHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomRoudedIcons(
          iconData: Icons.menu,
          onPress: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(child: Search_Filed()),
        SizedBox(
          width: 10,
        ),
        CustomRoudedIcons(iconData: CupertinoIcons.cart,onPress: () {
        },)
      ],
    );
  }
}
