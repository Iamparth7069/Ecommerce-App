class Users{
  String? id;
  String? Fname;
  String? Lname;
  String? email;
  String? contect;
  String? gender;
  String? dob;
  String? usertype;
  String? address;
  String? pass;
  Users(
      {this.id,
        required this.Fname,
        required this.Lname,
        required  this.email,
        required  this.contect,
      this.gender,
      this.dob,
      this.usertype,
      this.address,
        this.pass,
      });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'Fname': this.Fname,
      'Lname': this.Lname,
      'email': this.email,
      'contect': this.contect,
      'gender': this.gender,
      'dob': this.dob,
      'usertype': this.usertype,
      'address': this.address,
      'pass': this.pass,
    };
  }
}