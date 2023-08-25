import 'package:flutter/material.dart';
import 'package:shoppio_app/DataBase/DBHEALPER.dart';
import 'package:shoppio_app/model/category.dart';

import 'component/category_Body.dart';

class category_manage extends StatelessWidget {

  Category? category;

  DBHelper _dbhelp = DBHelper();
  category_manage(this.category);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(category!=null ? "Update Category": "Add Category",style: TextStyle(
          color: Colors.black
        ),),
        actions: [
        ],
      ),
      body: category_Body(category),
    );
  }


}
