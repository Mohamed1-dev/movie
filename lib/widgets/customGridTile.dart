import 'package:flutter/material.dart';

import '../const/consts.dart';

class CustomGridTile extends StatefulWidget {
 final List data;
  final int i;
  final String title;

   CustomGridTile( this.data, this.i, this.title);

  @override
  _CustomGridTileState createState() => _CustomGridTileState();
}

class _CustomGridTileState extends State<CustomGridTile> {


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (expandedIndex == widget.i && expandedTitle == widget.title) {
            expandedTitle = "";
            expandedIndex = -1;
          } else {
            expandedTitle = widget.title;
            expandedIndex = widget.i;
          }
        });
      },
      child: Container(
        width: 120,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/img.jpg'), fit: BoxFit.cover),
        ),
        child: GridTile(
          child: Image.network(
            url + widget.data[widget.i]['image'],
            fit: BoxFit.fill,
          ),
          footer: Icon(
            Icons.arrow_drop_down,
            color: expandedIndex == widget.i && expandedTitle == widget.title
                ? Colors.red
                : Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}
