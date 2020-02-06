
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter/material.dart';

import '../const/consts.dart';
import './customAddToRow.dart';


class CustomDetailsRow extends StatelessWidget {
  final List data;

   CustomDetailsRow( this.data);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  data[expandedIndex]['name'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SmoothStarRating(
                  color: Colors.yellow,
                  allowHalfRating: false,
                  borderColor: Colors.yellow,
                  rating: data[expandedIndex]['rating'] * 1.0,
                  starCount: 5,
                  size: 16,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data[expandedIndex]['brief'],
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                CustomAddToRow(),
              ],
            ),
          ),
          Expanded(
            child: Image.network(
              url + data[expandedIndex]['image'],
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}