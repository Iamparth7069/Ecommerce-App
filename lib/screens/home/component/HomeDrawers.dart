import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppio_app/preferences/pref_manager.dart';
import 'package:shoppio_app/rooutes/approutes.dart';
import 'package:shoppio_app/screens/FirebaseServices/FirebaseServices.dart';


class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final ImagePicker _imagePicker = ImagePicker();
  File? ImageFile;
   setImages() async{
    var imagepath = await _imagePicker.pickImage(source: ImageSource.camera);
    if(imagepath != null){
      setState(() {
         ImageFile = File(imagepath.path);
         print("Thee File Orignal Is ${ImageFile}");
       });
    }
  }
  FireBaseServicesdem0 fireBaseServicesdem0 = FireBaseServicesdem0();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          buildUserAccountHeader(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(Icons.favorite_border_outlined),
            title: Text('Favrotes'),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(Icons.archive_outlined),
            title: Text('Archive'),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(Icons.archive_outlined),
            title: Text('Archive'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.archive_outlined),
            title: Text('Archive'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.category_outlined),
            title: Text('Manage Category'),
            onTap: () {
              Navigator.pushNamed(context,AppRoute.Category_List1);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () async {
              fireBaseServicesdem0.logOut().then((value) => {
                Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginScreen, (route) => false)
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.production_quantity_limits),
            title: Text("Product Management"),
            onTap: () {
                Navigator.pushNamed(context, AppRoute.productList);
            },
          )
        ],
      ),
    );
  }

  buildUserAccountHeader() {
    return UserAccountsDrawerHeader(accountName: Text("Vyas Parth RajeshBhai"), accountEmail: Text(PrefManager.getName()),
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.40),
      ),
      currentAccountPicture: InkWell(
        onTap: () {
          setImages();
        },
        child: CircleAvatar(
          backgroundImage: ImageFile != null ? FileImage(ImageFile!) : AssetImage("assets/images/app_logo.png") as ImageProvider ,
        ),
      ),
    );
  }
}
