import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget  with PreferredSizeWidget{
  final List categories;

   CustomAppBar( this.categories);
@override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Icon(Icons.live_tv),
      centerTitle: true,
      bottom: TabBar(
        tabs: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(category['name']),
          );
        }).toList(),
        isScrollable: true,
        indicatorColor: Colors.red,
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.search),
        ),
      ],
    );
    
  }
}