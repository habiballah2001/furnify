import 'package:flutter/material.dart';

import '../models/on_boarding_model.dart';
import 'custom_widgets/slider/slider_image.dart';
import 'network/local/cache_helper.dart';

String token_ = 'Token ${CacheHelper.getData(key: 'token')}';
String ip = '192.168.1.3';

class Lists {
  static  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/on1.jpeg',
      title: 'Welcome To Homy Hub',
      body: 'Let\'s go',
    ),
    BoardingModel(
      image: 'assets/images/on2.jpeg',
      title: 'Furniture shopping',
      body: 'View Our Products',
    ),
    BoardingModel(
      image: 'assets/images/s3.png',
      title: 'Home Services',
      body: 'Always For You',
    ),
  ];

  static const List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
  ];
  static const List<Widget> banners =  [
    SliderImage(image: 'assets/images/f.jpg'),
    SliderImage(image: 'assets/images/c.jpg'),
    SliderImage(image: 'assets/images/s3.png'),
  ];

  static  List<Widget> offers =  [
    Image.asset('assets/images/1.jpg'),
    Image.asset('assets/images/2.jpg'),
    Image.asset('assets/images/3.jpg'),
    Image.asset('assets/images/4.jpg'),

  ];
  static  List<Widget> services =  [
    Image.asset('assets/images/5.jpg'),
    Image.asset('assets/images/6.jpg'),
    Image.asset('assets/images/7.jpg'),
    Image.asset('assets/images/8.jpg'),
  ];

}