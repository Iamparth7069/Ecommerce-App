import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shoppio_app/DataBase/DBHEALPER.dart';
import 'package:shoppio_app/model/category.dart';
import 'package:shoppio_app/model/product.dart';
import 'package:shoppio_app/rooutes/approutes.dart';
import 'package:shoppio_app/screens/FirebaseServices/FirebaseServices.dart';
import 'package:path/path.dart';

class product_add extends StatefulWidget {
  Product? product;

  product_add(this.product);

  @override
  State<product_add> createState() => _product_addState(product);
}

class _product_addState extends State<product_add> {
  final _GlobelKey = GlobalKey<FormState>();
  final _titalControll = TextEditingController();
  final _desc_Controller = TextEditingController();
  final _price = TextEditingController(text: '0.0');
  final _discount = TextEditingController(text: '0.0');
  int categoryId = -1;
  FireBaseServicesdem0 _baseServicesdem0 = FireBaseServicesdem0();
  DBHelper _dbHelper = DBHelper();
  List<Category> categoryList = [];

  Product? product;
  File? imagefile;
  pickImagefromgallery() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    String path = '${result?.files.first.path}';
    if (result != null) {
      setState(() {
        imagefile = File(path);
        print("The Image File $imagefile");
      });
    }
  }

  _product_addState(this.product);

  String? network;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCategory();
    if (product != null) {
      //update
      _titalControll.text = product!.Pname!;
      _desc_Controller.text = product!.Pdes!;
      _discount.text = product!.discount.toString();
      _price.text = product!.price.toString();
      network = product!.imageUrl!;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        product != null ? "Update Product" : "Product Add",
        style: TextStyle(color: Colors.black),
      )),
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _GlobelKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        pickImagefromgallery();
                      },
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey.withOpacity(.30),
                        // backgroundImage: AssetImage('assets/images/user.png') as ImageProvider,
                        child: network != null
                            ? CircleAvatar(
                                radius: 55,
                                backgroundImage: imagefile != null
                                    ? FileImage(File(imagefile!.path))
                                    : NetworkImage(network!) as ImageProvider,
                              )
                            : CircleAvatar(
                                radius: 55,
                                backgroundImage: imagefile != null
                                    ? FileImage(File(imagefile!.path))
                                    : AssetImage("assets/images/user.png")
                                        as ImageProvider),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  buildtitalformfild(),
                  SizedBox(
                    height: 20,
                  ),
                  builddescription(),
                  SizedBox(
                    height: 20,
                  ),
                  buildcategoryFormFiled(),
                  SizedBox(
                    height: 20,
                  ),
                  buildpriceformfiled(),
                  SizedBox(
                    height: 20,
                  ),
                  buildmatirialButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildtitalformfild() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Emter the Category";
        } else {
          return null;
        }
      },
      controller: _titalControll,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(Icons.category_outlined),
          onPressed: () {},
        ),
        labelText: 'Category',
        hintText: 'Category Name',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  builddescription() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter Description";
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        setState(() {});
      },
      controller: _desc_Controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(Icons.description),
          onPressed: () {},
        ),
        labelText: 'Description',
        hintText: 'Description',
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildmatirialButton(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        String tital = _titalControll.text.toString().trim();
        String desc = _desc_Controller.text.toString().trim();
        int price = _price.text.toString().trim().isEmpty
            ? 0
            : int.parse(_price.text.toString().trim());
        int discount = _discount.text.toString().trim().isEmpty
            ? 0
            : int.parse(_discount.text.toString().trim());
          if (product != null) {
            // Update Product
            var check = await _baseServicesdem0.updateImageUrl(product);
            if (imagefile != null){
              String? imagepath = await _baseServicesdem0.uploadProduct(imagefile!);
              _baseServicesdem0
                  .updateData(product!.Pid, tital, desc, categoryId, price,
                  discount, imagepath)
                  .then((value) => {
                Navigator.pop(context),
              });
            }else{
              _baseServicesdem0
                  .updateData(product!.Pid, tital, desc, categoryId, price,
                  discount, check)
                  .then((value) => {
                Navigator.pop(context),
              });

            }

          }else {
          // add product
          String? imagepath = await _baseServicesdem0.uploadProduct(imagefile!);
          Product pro = Product(
              Pname: tital,
              Pdes: desc,
              price: price,
              discount: discount,
              CategoryId: categoryId,
              imageUrl: imagepath);
          addproduct(pro, context);
        }
      },
      color: Colors.green,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Text(
        product != null ? "Update Product" : "Add Product",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  buildcategoryFormFiled() {
    return DropdownButtonFormField(
      iconEnabledColor: Colors.black45,
      validator: (value) {
        if (value == null) {
          return 'Select user type';
        } else {
          return null;
        }
      },
      onSaved: (newValue) {},
      onChanged: (value) {
        categoryId = value!;
      },
      decoration: InputDecoration(
          labelText: "Category",
          hintText: 'Select Category',
          floatingLabelBehavior: FloatingLabelBehavior.auto),
      items: categoryList.map((cate) {
        return DropdownMenuItem(value: cate.id, child: Text('${cate.title}'));
      }).toList(),
    );
  }

  buildpriceformfiled() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: TextFormField(
            controller: _price,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "price";
              } else {
                return null;
              }
            },
            onSaved: (newValue) {},
            decoration: InputDecoration(
              labelText: "price",
              hintText: "price",
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          )),
          SizedBox(
            width: 16,
          ),
          Expanded(
              child: TextFormField(
            controller: _discount,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Discount";
              } else {
                return null;
              }
            },
            onSaved: (newValue) {},
            decoration: InputDecoration(
              labelText: "Discount",
              hintText: "Discount",
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          )),
        ],
      ),
    );
  }

  Future<void> loadCategory() async {
    var templist = await _dbHelper.read();
    setState(() {
      categoryList.addAll(templist);
    });
  }

  void addproduct(Product pro, BuildContext context) {
    _baseServicesdem0.addProduct(pro).then((value) {
      if (value) {
        Navigator.pushNamed(context, AppRoute.productList);
      }
    });
    // auto Ganrate Kay
  }
}
