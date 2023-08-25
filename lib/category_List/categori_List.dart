import 'package:flutter/material.dart';
import 'package:shoppio_app/category_List/Component/Category_list.dart';
import 'package:shoppio_app/rooutes/approutes.dart';

class Category_List extends StatelessWidget {
  const Category_List({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Category_Body(),
      appBar: AppBar(
        title: Text("Category List", style:TextStyle(color: Colors.black)),
      ),

    );
  }
}
