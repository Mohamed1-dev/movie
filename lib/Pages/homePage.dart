import 'package:flutter/material.dart';
import '../widgets/customSwiper.dart';
import '../widgets/customhorizontalList.dart';

class Home extends StatefulWidget {
  final data;

  Home({this.data});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CustomSwiper(widget.data['slider']),
          CustomHorizontalList(widget.data['topViews'], "اكتر مشاهده",
              circle: false),
          CustomHorizontalList(
            widget.data['persons'],
            "مشاهير",
            circle: true,
          ),
          CustomHorizontalList(widget.data['showSoon'], "يعرض قريبا",
              circle: false),
          CustomHorizontalList(widget.data['showNow'], "يعرض الان",
              circle: false),
          CustomHorizontalList(widget.data['suggested'], "مقترح لك",
              circle: false),
          CustomHorizontalList(widget.data['topRated'], "الاكثر تقيما",
              circle: false),
          CustomHorizontalList(widget.data['topFavourite'], "الاكثر تفضيلا",
              circle: false),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10),
            child: CustomHorizontalList(widget.data['channels'], "قنوات",
                circle: true),
          ),
        ],
      ),
    );
  }
}
