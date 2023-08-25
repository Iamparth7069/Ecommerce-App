import 'package:flutter/material.dart';

class Search_Filed extends StatelessWidget {
  const Search_Filed({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.black38.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'Search Product',
          prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(horizontal: 20 , vertical: 12)
        ),
      ),
    );
  }
}
