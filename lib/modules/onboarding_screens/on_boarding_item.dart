import 'package:flutter/material.dart';
import '../../shared/custom_widgets/custom_texts.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem(
      {Key? key, required this.image, required this.title, required this.body})
      : super(key: key);

  final String? image;
  final String? title;
  final String? body;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: const EdgeInsets.all(50),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image!),
              fit: BoxFit.cover,
              opacity: 100,
            ),
          ),
          child: Column(
            children: [
              HeadLargeText(
                title!,
              ),
              const SizedBox(
                height: 20,
              ),
              TitleLargeText(
                body!,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
