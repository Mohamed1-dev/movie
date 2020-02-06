

import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import '../const/consts.dart';

class CustomCircleAvatar extends StatelessWidget {
  final List data;
  final int i;

   CustomCircleAvatar( this.data, this.i);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage('assets/images/img.jpg'),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(url + data[i]['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              BorderedText(
                strokeWidth: 8.0,
                strokeColor: Colors.black,
                child: Text(
                  data[i]['name'],
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
      radius: 70,
    );
  }
}