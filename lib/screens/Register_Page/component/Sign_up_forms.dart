import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoppio_app/component/constants.dart';
import 'package:shoppio_app/component/custom_sufix_icons.dart';
import 'package:shoppio_app/model/Users.dart';
import 'package:shoppio_app/model/user.dart';
import 'package:shoppio_app/screens/FirebaseServices/FirebaseServices.dart';
import 'package:shoppio_app/utils/utils.dart';

import '../../../preferences/pref_manager.dart';
import '../../../rooutes/approutes.dart';

class Sign_up_forms extends StatefulWidget {
  Sign_up_forms({super.key});

  @override
  State<Sign_up_forms> createState() => _Sign_up_formsState();
}

class _Sign_up_formsState extends State<Sign_up_forms> {

  final _globlaKey = GlobalKey<FormState>();
  final _text = TextEditingController();
  final _emailvalid = TextEditingController();
  var _contectemailtest = TextEditingController();
  final _dob = TextEditingController();

  final _password = TextEditingController();
  String? emailerror, phoneerror, contecterror, password;
  var gender = "male";
  void _updateGenderSelection(String? value) {
    setState(() {
      gender = value!;
    });
  }
  String dob = '',
      password1 = '',
      firstName = '',
      lastName = '',
      email = '',
      contact = '',
      userType = '',
      address = '';
FireBaseServicesdem0 _baseServicesdem0 = FireBaseServicesdem0();
  Future<void> CreateAccount(Users user, BuildContext contact) async {
    var check = await _baseServicesdem0.CreateAuser(user.email!,user.pass!);
    if(check is UserCredential){
      if(check.user != null){
        print("User id ${check.user!.uid}");

        user.id = check.user!.uid;
        _baseServicesdem0.add(user).then((value) => {
          // Navigate To Home Screens
          Navigator.pushNamedAndRemoveUntil(context, AppRoute.homeScreen, (route) => false)
        }).catchError((error){
          print(error.toString());
        });
        // user!.id =
      }
    }else if(check is String){
      print(check);

    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _globlaKey,
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            buildformFild(),
            SizedBox(
              height: 20,
            ),
            buildEmailformFild(),
            SizedBox(
              height: 20,
            ),
            buildcontectformfiled(),
            SizedBox(
              height: 16,
            ),
            buildGenderSelectionWidget(),
            SizedBox(
              height: 16,
            ),
            builduserformfild(),
            SizedBox(
              height: 16,
            ),
            builddayofthebirth(),
            SizedBox(
              height: 16,
            ),
            builaddressformfild(),
            SizedBox(
              height: 16,
            ),
            buildpasswordformfild(),
            SizedBox(
              height: 16,
            ),
            buildcpasswordformfild(),
            SizedBox(
              height: 16,
            ),
            buildSignupButtonWigits(context),
          ],
        ),
      ),
    );
  }

  buildEmailformFild() {
    return TextFormField(
      controller: _emailvalid,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if(value == null || !utils.isvalidemail(value)){
          return "Enter the Valid Email";
        }else{
          return null;
        }
      },
      onSaved: (newValue) {
        email = newValue.toString();
      },
      decoration: InputDecoration(
          suffixIcon: custom_suffix(iconEmail),
          hintText: "Email",
          errorText: emailerror,
          labelText: "Enter Email"),
    );
  }
  buildformFild() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: TextFormField(
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter the First Name";
              } else {
                return null;
              }
            },
            onSaved: (newValue) {
              firstName = newValue.toString();
            },
            decoration: InputDecoration(
              labelText: "First Name",
              hintText: "First Name",
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          )),
          SizedBox(
            width: 16,
          ),
          Expanded(
              child: TextFormField(
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Emter the Last Name";
              } else {
                return null;
              }
            },
                onSaved: (newValue) {
                  lastName = newValue.toString();
                },
            decoration: InputDecoration(
              labelText: "Last Name",
              hintText: "Last Name",
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          )),
        ],
      ),
    );
  }

  buildcontectformfiled() {
    return TextFormField(
      controller: _contectemailtest,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (value) {
        if(value == null || !utils.isvalidmobile(value)){
          return "Enter the Valid Contects ";
        }else{
          return null;
        }
      },
      onSaved: (newValue) {
        contact = newValue.toString();
      },
      decoration: InputDecoration(
        labelText: "Contact",
        hintText: 'Contact',
        // errorText: contecterror,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: custom_suffix('assets/icons/call3.svg'),
      ),
    );
  }

  buildGenderSelectionWidget() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          children: [
            Text("Gemder"),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 'mail',
                    groupValue: gender,
                    onChanged: (value) {
                      _updateGenderSelection(value);
                      print(value);
                    },
                  ),
                  Text("Male"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 'femail',
                    groupValue: gender,
                    onChanged: (value) {
                      _updateGenderSelection(value);
                    },
                  ),
                  Text("Femail"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 'other',
                    groupValue: gender,
                    onChanged: (value) {
                      _updateGenderSelection(value);
                    },
                  ),
                  Text("other"),
                ],
              ),
            )
          ],
        ));
  }

  builduserformfild() {
    return DropdownButtonFormField(
      iconEnabledColor: Colors.black45,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Select user type';
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        userType = newValue.toString();
      },
      decoration: InputDecoration(
          labelText: "User Type",
          hintText: 'Select User Type',
          floatingLabelBehavior: FloatingLabelBehavior.auto),
      items: [
        DropdownMenuItem(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            child: Text("Vandor"),
          ),
          value: 'Vandor',
        ),
        DropdownMenuItem(
          child: Text("user"),
          value: 'user',
        )
      ],
      onChanged: (String? value) {
        print(value);
      },
    );
  }

  builddayofthebirth() {
    return TextFormField(
      controller: _text,
      onTap: () {
        _selectdate();
        FocusScope.of(context).requestFocus(FocusNode());
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Select date of birth';
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        dob = newValue.toString();
      },
      decoration: InputDecoration(
          labelText: "Date of birth",
          hintText: 'Date of birth',
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: custom_suffix('assets/icons/Dob.svg')),
    );
  }

  Future<void> _selectdate() async {
    var pickdate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      cancelText: 'Cancel',
      confirmText: 'Done',
      fieldLabelText: 'DOB',
    );
    if (pickdate != null) {
      var dob =
          '${pickdate.day.toString().padLeft(2, '0')}/${pickdate.month.toString().padLeft(2, '0')}/${pickdate.year}';
      _text.text = dob;
    } else {
      print('please select date of birth');
    }
  }

  builaddressformfild() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: 3,
      onSaved: (newValue) {
        address = newValue.toString();
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: 'Address',
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildpasswordformfild() {
    return TextFormField(
      controller: _password,
      keyboardType: TextInputType.text,
      obscureText: true,
      validator: (value) {
        if (value == null || !utils.isvalidpassword(value)) {
          return 'Enter valid password';
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        password = newValue.toString();
      },
      decoration: InputDecoration(
          labelText: "Password",
          helperText: 'must contains digit, alphabet and special character (*,@,_)',
          hintText: 'Enter password',
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: custom_suffix('assets/icons/Lock.svg')),
    );
  }

  buildcpasswordformfild() {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      validator: (value) {
        if(value == null || value != _password.text.toString()){
          return "The Conform PassWord is Mismatch ";
        }else{
            return null;
        }
      },
      onSaved: (newValue) {
        password = newValue.toString();
      },
      decoration: InputDecoration(
          labelText: "Confirm password",
          hintText: 'Enter password',
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: custom_suffix('assets/icons/Lock.svg')),
    );
  }

  buildSignupButtonWigits(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        resetvalidator();
        // String email = _emailvalid.text.toString().trim();
        // String phone = _contectemailtest.text.toString().trim();
        // String password = _password.text.toString().trim();
        // String cpassword = _cpassword.text.toString().trim();
        //
        // if (!utils.isvalidemail(email)) {
        //   setState(() {
        //     emailerror = "Enter the Valid Email";
        //   });
        // } else if (!utils.isvalidmobile(phone)) {
        //   setState(() {
        //     contecterror = "Enter the Valid Number";
        //   });
        // }
        if (_globlaKey.currentState!.validate()) {
          _globlaKey.currentState!.save();

          // var user = User(
          //     addresh: address,
          //     name: '$firstName $lastName',
          //     Contect: contact,
          //     DateofBirth: dob,
          //     Email: email,
          //     Gender: gender,
          //     Passeord: password,
          //     Usertype: userType);

          // print('''
          // Name : ${user.name}
          // contact : ${user.Contect}
          // address : ${user.addresh}
          // password : ${user.Passeord}
          // userType : ${user.Usertype}
          // email : ${user.Email}
          // dob : ${user.DateofBirth}
          // gender : ${user.Gender}
          // ''');
          var user = Users(Fname: firstName, Lname: lastName, email: email, contect: contact ,usertype: userType,gender: gender ,address: address,dob: dob,pass: password);
          CreateAccount(user,context);

        }
        else{
          print("It is Error");
        }
      },
      color: Colors.green,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      child: Text(
        "Sign up",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
  void resetvalidator() {
    setState(() {
      emailerror = null;
      contecterror = null;
    });
  }


}

