import 'package:flutter/material.dart';
import 'package:shoppio_app/component/constants.dart';

class BodyForget extends StatelessWidget {
  const BodyForget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton.outlined(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_outlined, size: 30)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              "Forgot Password",
              style: headingstyle,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  "Please enter your email and we will send you a link to return to your account",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style:
                      TextStyle(fontWeight: FontWeight.w400, wordSpacing: 0)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  labelText: 'Email',
                  hintText: 'Email address',
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            getvarificationButtons(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 18),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.yellow.shade700, fontSize: 18),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  getvarificationButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: MaterialButton(
        onPressed: () {},
        color: Colors.green,
        height: 48,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        child: Text(
          'Send Varification Email',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
