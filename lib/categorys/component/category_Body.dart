import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shoppio_app/DataBase/DBHEALPER.dart';
import 'package:path/path.dart';
import '../../model/category.dart';

class category_Body extends StatefulWidget {
  Category? category;

  category_Body(this.category);

  @override
  State<category_Body> createState() => _category_BodyState(category);
}

class _category_BodyState extends State<category_Body> {
  Category? cat;

  _category_BodyState(this.cat);

  final _tital_Controller = TextEditingController();
  final _desc_Controller = TextEditingController();
  late final ImagePicker _imagePicker = ImagePicker();
  File? imagefile;
  DBHelper _dbHelper = DBHelper();
    String des = "";
  String category = "";
  String? path;

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

  final _GlobelKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (cat != null) {
      _tital_Controller.text = cat!.title ?? '';
      _desc_Controller.text = cat!.description ?? '';
      imagefile = File(cat!.imagePath!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
                      backgroundImage: imagefile != null
                          ? FileImage(imagefile!)
                          : AssetImage('assets/images/user.png')
                              as ImageProvider,
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
                buildmatirialButton(context),
                SizedBox(
                  height: 20,
                ),
                // ElevatedButton(onPressed: () {
                //     File tempFile = File("/data/user/0/com.example.shoppio_app/files/1688491640182.jpg");
                //     setState(() {
                //       imagefile = tempFile;
                //     });
                // }, child: Text("GET FILE FROM INTERNAL STORAGE"))
              ],
            ),
          ),
        ),
      ),
    );
  }
  buildtitalformfild() {
    return TextFormField(
      onSaved: (newValue) {
        category = newValue!;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Emter the Category";
        } else {
          return null;
        }
      },
      controller: _tital_Controller,
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
        setState(() {
          des = newValue!;
          print("The New Values ${newValue.toString()}");
        });
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
        String tital = _tital_Controller.text.toString().trim();
        String desc = _desc_Controller.text.toString().trim();
        if (imagefile == null) {
          print("Select The Images");
        } else {
          if (_GlobelKey.currentState!.validate()) {
            _GlobelKey.currentState!.save();
            print("The Category Name is ${category}");
            print("The Description Name is ${des}");
            path = await saveImage(imagefile);
            // print('title : $tital   desc : $desc   imagePath : $path');
            // if (path != null) {
            //   Category categoty1 =
            //       Category(title: tital, description: desc, imagePath: path);
            //   addCategory(categoty1);
            // }
            if (cat != null) {
              // update
              print("Update");
              Category cats = Category.withId(
                  title: tital,
                  description: desc,
                  imagePath: path,
                  date: cat!.date,
                  id: cat!.id);
              updatecateGory(cats, context);
            } else {
              // add
              print("Add");
              Category category1 =
                  Category(title: tital, description: desc, imagePath: path);
              addCategory(category1, context);
            }
          }
        }
      },
      color: Colors.green,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Text(
        cat != null ? "Update Category" : "Add Category",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<String?> saveImage(File? tempFile) async {
    //// pathr/samflms/gdgdfg/parth.png
    // parth.png
    String fileName = basename(tempFile!.path);
    var supportDir = await getApplicationSupportDirectory();
    var file = File('$supportDir/$fileName');
    if (await file!.exists() == false) {
      try {
        String root = supportDir.path; // root path
        String fileName = '${DateTime.now().millisecondsSinceEpoch}.svg';
        File mFile = await tempFile!.copy('${root}/${fileName}');
        if (mFile != null) {
          return mFile.path;
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return tempFile.path;
    }

    return null;
  }

  Future<void> addCategory(Category categoty1, BuildContext context) async {
    var id = await _dbHelper.insert(categoty1);
    if (id != -1) {
      print("Category add Sucssses Fully ");
      print("Add Function Call");
      categoty1.id = id;
      Navigator.pop(context, categoty1);
    } else {
      print("getting Error while adding category");
    }
  }

  Future<void> updatecateGory(Category categoty1, BuildContext context) async {
    var id = await _dbHelper.update(categoty1);
    if (id != -1) {
      print("Category Updated Sucssses Fully ");
      print("Update Function Call");
      Navigator.pop(context, categoty1);
    } else {
      print("getting Error while adding category");
    }
  }
}
