class Product{
  String? Pid;
  String? Pname;
  String? Pdes;
  int? price;
  int? discount;
  int Date = DateTime.now().millisecondsSinceEpoch;
  String? imageUrl = "";
  int? CategoryId;

  Product(
      {
      required this.Pname,
      required this.Pdes,
      required this.price,
        this.imageUrl = "",
      required this.discount,
      required this.CategoryId});


  Product.withId(
      {this.Pid,
      this.Pname,
      this.Pdes,
      this.price,
      this.discount,
      required this.Date,
      required this.imageUrl,
      this.CategoryId});

  factory Product.fromMap(Map<dynamic, dynamic> map) {
    return Product.withId(
      Pid: map['Pid'] as String,
      Pname: map['Pname'] as String,
      Pdes: map['Pdes'] as String,
      price: map['price'] as int ,
      discount: map['discount'] as int,
      Date: map['data'] as int,
      imageUrl: map['imageUrl'] as String,
      CategoryId: map['CategoryId'] as int,
    );
  }
Map<String, dynamic> toMap() {
    return {
      'Pid': this.Pid,
      'Pname': this.Pname,
      'Pdes': this.Pdes,
      'price': this.price,
      'discount': this.discount,
      'data': this.Date,
      'imageUrl': this.imageUrl,
      'CategoryId': this.CategoryId,
    };
  }




}