import 'package:flutter/material.dart';

import '../components.dart';
import '../style/colors.dart';
import 'custom_card.dart';
import 'custom_texts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.width,
    this.height,
    this.background = secColor,
    this.textColor = Colors.white,
    this.isUpperCase = false,
    this.radius = 0,
    this.function,
    required this.text,
    this.icon,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? background;
  final Color? textColor;
  final bool isUpperCase;
  final double? radius;
  final Function()? function;
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: CustomCard(
        radius: radius,
        child: Container(
          color: primaryColor,
          width: double.infinity,
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleLargeText(
                isUpperCase ? text.toUpperCase() : text,
                color: Colors.white,
              ),
              if (icon != null)
                Row(
                  children: [
                    const SpaceWidth(),
                    Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
