import 'package:flutter/material.dart';

class fotter extends StatelessWidget {
  const fotter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?",style: TextStyle(fontSize:18),),
        TextButton(onPressed: () {
          Navigator.pushNamed(context, '/register');
        }, child: Text("Sign Up",style: TextStyle(color: Colors.yellow.shade700,fontSize: 18),))
      ],
    );
  }
}
