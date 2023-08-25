import 'package:flutter/material.dart';
import 'package:shoppio_app/component/constants.dart';

class layoutheader extends StatelessWidget {
  const layoutheader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Register Account",style: headingstyle,),
          SizedBox(height: 8,),
          Text(
            "Complete your details or continue\nwith social media",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
