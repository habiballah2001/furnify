import 'package:flutter/material.dart';
import '../components.dart';
import '../style/colors.dart';
import 'custom_container.dart';
import 'custom_texts.dart';

class CustomListTile extends StatelessWidget {
  final IconData? leading;
  final IconData icon;
  final String title;
  final bool? isDivider;
  final Function() function;
  const CustomListTile({
    Key? key,
    this.leading,
    this.icon = Icons.arrow_forward_ios_rounded,
    required this.title,
    required this.function,
    this.isDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: function,
          child: CustomContainer(
            padding: 10,
            height: 60,
            child: Row(
              children: [
                if (leading != null) Icon(leading),
                const SpaceWidth(width: 20),
                TitleMediumText(
                  title,
                ),
                const Spacer(),
                Icon(icon),
              ],
            ),
          ),
        ),
        if (isDivider == true) const Divider()
      ],
    );
  }
}
