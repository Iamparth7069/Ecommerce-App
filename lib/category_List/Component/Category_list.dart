import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppio_app/DataBase/DBHEALPER.dart';
import 'package:shoppio_app/model/category.dart';
import '../../rooutes/approutes.dart';

class Category_Body extends StatefulWidget {
  const Category_Body({super.key});

  @override
  State<Category_Body> createState() => _Category_BodyState();
}

class _Category_BodyState extends State<Category_Body> {
  late Category categoryfordelete;
  List<Category> categoryList = [];
  @override
  final DBHelper _dbHelper = DBHelper();

  void initState() {
    // TODO: implement initState
    super.initState();
    LoadCategory();
     // categoryList.add(category1(title: "Book",imagepath: "",description: "Book Discription"));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: () async {
            Category category =await Navigator.pushNamed(context, AppRoute.addCategoty) as Category;

            setState(() {
               categoryList.add(category);
            });
          },
      ),
      body: ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () async {

              // This Is Update The Data

               Category category = categoryList[index];
               Category? cat = await Navigator.pushNamed(context, AppRoute.addCategoty ,arguments: category) as Category;
               if(cat!= null){
                 setState(() {
                   var index = categoryList.indexWhere((element) => element.id == cat.id );
                   categoryList[index] = cat;
                 });
               }
            },
            title: Text('${categoryList[index].title}'),
            subtitle: Text('${categoryList[index].description}'),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: FileImage(File('${categoryList[index].imagePath}')),
            ),
            trailing: IconButton(
              onPressed: () {
                Category category = categoryList[index];
                // This is Deleted
                Deletedatas(category,context);
                setState(() {
                  categoryList.removeWhere((element) => element.id == category!.id);
                });
              },
              icon: Icon(Icons.delete),
            ),

          );
        },),
    );
  }
  Future<void> LoadCategory() async {
   var tempList =  await _dbHelper.read();
   setState(() {
     categoryList.addAll(tempList);
   });
  }

  Future<void> Deletedatas(Category category, BuildContext context) async {
    var id = await _dbHelper.delete(category!.id);
    if(id != -1){
      print("Deleted Succsess Fully");
    }else{
      print("Deleted Uncess Fully");
    }
  }


}
