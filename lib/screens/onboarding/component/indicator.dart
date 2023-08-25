import 'package:flutter/material.dart';
Widget getindicator(bool isactive){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 3.0),
    height: isactive? 12:10,
    width: isactive? 12 : 10,
    decoration: BoxDecoration(
      /*color: Colors.grey,*/
        color: isactive? Colors.amber : Colors.grey,
        borderRadius: BorderRadius.circular(12)),
  );
}