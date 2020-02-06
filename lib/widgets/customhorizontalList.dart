
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../const/consts.dart';
import './customCircleAvatar.dart';
import './customDetailsRow.dart';
import './customGridTile.dart';

class CustomHorizontalList extends StatelessWidget {
 final List data;
 final  String title;
  bool circle = false;

   CustomHorizontalList( this.data, this.title ,{this.circle});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 24),
              ),
              Spacer(),
              Icon(FontAwesomeIcons.th, size: 15),
            ],
          ),
        ),
        Container(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: circle
                    ? CustomCircleAvatar(data, i)
                    : CustomGridTile(data, i, title),
              );
            },
          ),
          height: 150,
        ),
        expandedTitle.isEmpty || expandedTitle != title
            ? Container()
            : CustomDetailsRow(data),
      ],
    );
  }
}