class Category {
  int? id;
  String? title;
  String? description;
  String? imagePath;
  int date = DateTime.now().millisecondsSinceEpoch;

  Category({this.title, this.description, this.imagePath});

  //id = insert Id ;


  Category.withId(
      {this.id, this.title, this.description, this.imagePath, required this.date});

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'description': this.description,
      'image_path': this.imagePath,
      'date': this.date,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category.withId(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      imagePath: map['image_path'] as String,
      date: map['date'] as int,
    );
  }
// convert dart object to map object
}
