import 'package:flutter/material.dart';
import 'custom_widgets/custom_texts.dart';
import 'style/colors.dart';

class SpaceHeight extends StatelessWidget {
  const SpaceHeight({Key? key, this.height = 10}) : super(key: key);

  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class SpaceWidth extends StatelessWidget {
  const SpaceWidth({Key? key, this.width = 10}) : super(key: key);

  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );

void errorImageBuilder() => const SizedBox(
      width: double.infinity,
      child: BodyMediumText('error in image'),
    );
