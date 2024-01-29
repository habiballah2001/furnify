import 'package:flutter/material.dart';
import '../components.dart';
import '../style/colors.dart';
import 'custom_texts.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function()? function;
  final String title;
  final double padding;
  final double? height;
  final double? radius;
  final IconData? icon;

  const CustomOutlinedButton({
    Key? key,
    this.function,
    required this.title,
    this.padding = 50,
    this.height,
    this.radius = 30,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: OutlinedButton(
        onPressed: function,
        style: OutlinedButton.styleFrom(
          foregroundColor: secColor,
          padding: EdgeInsets.symmetric(horizontal: padding),
          backgroundColor: Colors.white,
          side: const BorderSide(color: secColor, width: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleLargeText(
              title,
            ),
            if (icon != null)
              Row(
                children: [
                  SpaceWidth(),
                  Icon(
                    icon,
                    color: secColor,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
