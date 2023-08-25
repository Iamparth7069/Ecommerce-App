import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppio_app/model/product.dart';
import 'package:shoppio_app/rooutes/approutes.dart';
import 'package:shoppio_app/screens/FirebaseServices/FirebaseServices.dart';

class product_list extends StatefulWidget {
  const product_list({super.key});

  @override
  State<product_list> createState() => _product_listState();
}


class _product_listState extends State<product_list> {
  var productList = [];
  DatabaseReference mRef = FirebaseDatabase.instance.ref();

  FireBaseServicesdem0 _servicesdem0 = FireBaseServicesdem0();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product List",style: TextStyle(color: Colors.black87),)),
      body: StreamBuilder(
        stream: _servicesdem0.getProductList(),
        builder: (context, snapshot) {
           if(snapshot.hasData){
             List<Product> productList = [];
             DatabaseEvent data = snapshot.data!;
              Map<dynamic,dynamic>? map = data.snapshot.value as Map<dynamic,dynamic>?;
              map?.values.forEach((element) {
                productList.add(Product.fromMap(element));
              });
             return ListView.builder(
               itemCount: productList.length,
               itemBuilder: (context, index) {
                 String? ImageUrl = productList[index].imageUrl;
               return ListTile(
                 title: Text("${productList[index].Pname}"),
                 subtitle: Text("${productList[index].Pdes}"),
                 onTap: () {
                    Navigator.pushNamed(context,AppRoute.productadd,arguments: productList[index]);
                 },
                 leading: CircleAvatar(
                   radius: 32,
                     child: ImageUrl != null ? CircleAvatar(
                       radius: 32,
                       backgroundImage: NetworkImage(ImageUrl),
                     ) : Image.asset("assets/images/user.png")
                 ),
                 trailing: IconButton(icon: Icon(Icons.delete),
                 onPressed: () async {
                   _servicesdem0.delete(productList[index].Pid).then((value) => {
                     print("delete product"),
                   });
                 },),
               );
             },);
           }else if(snapshot.hasError){
             // error
             return Center(child: Text("This is Error"),);
           }else {
             return Center(child: CircularProgressIndicator(),);
           }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.productadd);
        },
      ),
    );
  }








}
