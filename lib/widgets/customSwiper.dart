
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../const/consts.dart';

class CustomSwiper extends StatelessWidget {

  final List slider;

   CustomSwiper( this.slider);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Swiper(
        outer: false,
        itemBuilder: (context, i) {
          return Image.network(
            url + slider[i]['image'],
            fit: BoxFit.fill,
          );
        },
        autoplay: true,
        duration: 300,
        pagination: new SwiperPagination(
          margin: new EdgeInsets.all(5.0),
          builder: DotSwiperPaginationBuilder(
              activeColor: Colors.red, color: Colors.white),
        ),
        itemCount: slider.length,
      ),
    );
  }
}