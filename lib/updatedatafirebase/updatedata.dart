import 'package:flutter/material.dart';
import 'package:shoppio_app/model/product.dart';

class UpdateDatabase extends StatefulWidget {


  @override
  State<UpdateDatabase> createState() => _UpdateDatabaseState();
}

class _UpdateDatabaseState extends State<UpdateDatabase> {
  @override
  final pdes = TextEditingController();
  final pname = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Data",style: TextStyle(color: Colors.black),),),

      body: Padding(
        padding:  EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/images/user.png") as ImageProvider,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: pname,
                decoration: InputDecoration(
                  label: Text("Enter the Product Name"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: pdes,
                decoration: InputDecoration(
                  label: Text("Enter the Product Description"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(onPressed: () {
                
              },color: Colors.amber,
                padding: EdgeInsets.all(15),
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
              child: Text("Update The Data Base"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
