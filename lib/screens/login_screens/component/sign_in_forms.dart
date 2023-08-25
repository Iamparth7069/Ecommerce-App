import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoppio_app/rooutes/approutes.dart';
import 'package:shoppio_app/screens/FirebaseServices/FirebaseServices.dart';
import 'package:shoppio_app/utils/utils.dart';

import '../../../preferences/pref_manager.dart';

class sign_in_forms extends StatefulWidget {
  const sign_in_forms({super.key});

  @override
  State<sign_in_forms> createState() => _sign_in_formsState();
}
class _sign_in_formsState extends State<sign_in_forms> {
  var _emailcontroller = TextEditingController();
  var _paswoordController = TextEditingController();
  bool _passeordvisible= true;
  String? erroremail,errorpassword;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  FireBaseServicesdem0 fireBaseServicesdem0 =FireBaseServicesdem0();
  Future<void> login(String email, String password, BuildContext context) async {

  }
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildemailformetfiled(),
        SizedBox(
          height: 24,
        ),
        buildpasswordformfild(),
        SizedBox(
          height: 24,
        ),
        forgetpasspoerWiget(),
        SizedBox(
          height: 20,
        ),
        buildLoginButtonWidget(),
      ],
    ));
  }

  buildemailformetfiled() {
    return TextFormField(
      controller: _emailcontroller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(Icons.email),
          onPressed: () {},
        ),
        labelText: 'Email',
        hintText: 'Email address',
        errorText: erroremail,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildpasswordformfild() {
    return TextFormField(
      controller: _paswoordController,
      keyboardType: TextInputType.text,
      obscureText: _passeordvisible,
      decoration: InputDecoration( suffixIcon: IconButton(onPressed: () {
        setState(() {
          _passeordvisible = !_passeordvisible;
        });
      }, icon: Icon(_passeordvisible ? Icons.visibility_off:Icons.visibility),),
        labelText: "Password",
        hintText: 'Enter password',
        errorText: errorpassword,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildLoginButtonWidget() {
    return MaterialButton(onPressed: () async {
      String email = _emailcontroller.text.toString().trim();
      String password = _paswoordController.text.toString().trim();
      resetvalidater();
      if(!utils.isvalidemail(email)){
        // error for not valid
        setState(() {
          erroremail = 'Enter the Valid Email';
        });
      }else if(!utils.isvalidpassword(password)){
        // error for not validpassword
        setState(() {
          errorpassword  = 'Enter The valid Password';
        });
      }else{
        setState(() {

        });
        var check = await fireBaseServicesdem0.login(email,password,context);
        if(check is UserCredential){
          if(check.user! != null){

            Navigator.pushNamedAndRemoveUntil(
                context, AppRoute.homeScreen, (route) => false);
          }else if(check is String){
            print(check);
          }
        }

      }
    },color: Colors.green,
    minWidth: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      child: Text('Sign in', style: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),),
    );
  }
  forgetpasspoerWiget() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/forget');
        },
        child: Text("Forget Password",style: TextStyle(color: Colors.black,decoration: TextDecoration.underline,fontSize: 20),),
      ),
    );
  }

  void resetvalidater() {
    setState(() {
      erroremail = null;
      errorpassword  = null;
    });
  }


}
