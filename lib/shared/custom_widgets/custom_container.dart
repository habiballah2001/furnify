import 'package:flutter/material.dart';


class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    this.padding = 0,
    required this.child,
    this.radius,
    this.height,
    this.width,
    this.color,
    this.margin,
  }) : super(key: key);

  final double? padding;
  final EdgeInsetsGeometry? margin;
  final Widget child;
  final BorderRadiusGeometry? radius;
  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.all(padding!),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: radius,
        color: color,
      ),
      child: child,
    );
  }
}
