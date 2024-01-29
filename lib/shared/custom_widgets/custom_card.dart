import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final double? radius;
  final double? width;
  final double? height;
  final double? padding;
  final EdgeInsetsGeometry? margin;
  final Color? shadowColor;
  final Color? color;
  const CustomCard({
    Key? key,
    this.radius = 10,
    required this.child,
    this.width,
    this.height,
    this.padding = 0,
    this.margin,
    this.shadowColor,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      shadowColor: shadowColor,
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius!),
      ),
      elevation: 3,
      child: Container(
        color: color,
        height: height,
        width: width,
        padding: EdgeInsets.all(padding!),
        child: child,
      ),
    );
  }
}
