

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shoppio_app/model/Users.dart';
import 'package:shoppio_app/model/product.dart';

class FireBaseServicesdem0 {
  static final _instance = FireBaseServicesdem0.instance();

  factory FireBaseServicesdem0() {
    return _instance;
  }
  final FirebaseAuth _mAuth = FirebaseAuth.instance;
  FireBaseServicesdem0.instance();

  final DatabaseReference _mRsf = FirebaseDatabase.instance.ref();
  final Reference _storageRef = FirebaseStorage.instance.ref();
  static final DatabaseReference db = FirebaseDatabase.instance.ref("product-node");// get path of Firebase Data Base
  Future<dynamic> login(String email, String password, BuildContext context) async {
    try {
      UserCredential credential = await _mAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
        print("User id ${credential.user!.uid}");
        return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "No user found for that email";
      } else if (e.code == 'wrong-password') {
        return "Wrong password provided for that user";
      }
    }
  }

  Future<dynamic> CreateAuser(String email, String password) async {
    try{
      final credential =await _mAuth.createUserWithEmailAndPassword(email: email, password: password);
      if(credential.user!=null){
        return credential;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "No user found for that email";
      } else if (e.code == 'wrong-password') {
        return "Wrong password provided for that user";
      }
    }
  }

  Future<void> logOut() async {
          await _mAuth.signOut();
  }


  Future<void> add(Users user)async{
    return await _mRsf.child('user-node').child(user.id!).set(user.toMap());
  }

  Future<bool> addProduct(Product product) async {
    String? Id = _mRsf.push().key; // ganrate Auto key
    try{
      if(Id != null){
        product.Pid = Id;
        await _mRsf.child("Product-node").child(product.Pid!).set(product.toMap());
        return true;
      }
    }catch(e){
      print(e);
    }
    return false;
  }

  Stream<DatabaseEvent> getProductList() {
    Stream<DatabaseEvent> event = _mRsf.child('Product-node').onValue;
    return event;
  }

   Future<void> deleteData({String? key}) async {
    await db.child(key!).remove();
  }

  Future<void> delete(String? pid)async{
    return _mRsf.child("Product-node").child(pid!).remove();
  }


  Future<void> updateData(String? Pid,String? Pname,String? Pdesc,int? categoryId,int? price,int? discount,String? imageUrl)async{
    return await _mRsf.child("Product-node").child(Pid!).update({
      "CategoryId" : categoryId,
      "Pname" : Pname,
      "Pdes" : Pdesc,
      "discount": discount,
      "price" : price,
      "imageUrl" : imageUrl
    });
  }



  // Firebase Storage
  Future<String?> uploadProduct(File imageFile) async {
    String url = "";
    String tempFile = basename(imageFile.path);
    var ex = extension(tempFile);
     String filename = '$tempFile$ex';
    try{
      var image = await _storageRef.child("Product").child(filename).putFile(imageFile);
      if(image != null){
        url = await _storageRef.child("Product").child(filename).getDownloadURL();
      }else{
        print("Error");
      }
    } on FirebaseException catch(e){
      print("Error Is e");
    }
    return url;
  }


  updateImageUrl(Product? product) {
    return product?.imageUrl;
  }
}
