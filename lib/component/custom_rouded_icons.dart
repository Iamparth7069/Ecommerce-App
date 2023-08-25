import 'package:flutter/material.dart';

class CustomRoudedIcons extends StatelessWidget {
  IconData iconData;
  VoidCallback onPress;

  CustomRoudedIcons({required this.iconData, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: MaterialButton(
       onPressed: onPress,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        padding: EdgeInsets.zero,
        color: Colors.white,
        child: Icon(
          iconData,
          color: Colors.black45,
        ),
      ),
    );
  }
}
