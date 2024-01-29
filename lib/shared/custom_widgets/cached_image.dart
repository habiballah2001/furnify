import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedImage extends StatelessWidget {
  final String img;
  final double? height;
  const CustomCachedImage({Key? key, required this.img, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: img,

      height: height,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: CircularProgressIndicator(
          value: progress.progress,
        ),
      ),
      errorWidget: (context, url, error) => Center(
        child: Image.asset('assets/images/Image Icon.png'),
      ),
    );
  }
}
