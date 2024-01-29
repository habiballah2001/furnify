import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({Key? key, this.height, required this.items,}) : super(key: key);

  final double? height;
  final List<Widget> items;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items,
      options: CarouselOptions(
        height: height,
        initialPage: 0,

        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlay: true,
        //autoPlayCurve: Curves.fastOutSlowIn
      ),
    );
  }
}
