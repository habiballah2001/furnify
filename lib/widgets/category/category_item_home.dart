import 'package:flutter/material.dart';
import '../../../shared/components.dart';
import '../../modules/categories/category_products_screen.dart';
import '../../shared/custom_widgets/custom_container.dart';
import '../../shared/custom_widgets/custom_texts.dart';

class CategoryItemHome extends StatelessWidget {
  final int itemIndex;
  final product;
  final double? width;
  final double? height;
  const CategoryItemHome(
      {Key? key,
      required this.itemIndex,
      this.width,
      this.height,
      this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(
          context,
          CategoryProductsScreen(
            itemIndex: itemIndex,
          ),
        );
      },
      child: CustomContainer(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 100,
        height: 30,
        radius: BorderRadius.circular(30),
        color: Colors.grey.shade100,
        child: Center(
          child: TitleSmallText(
            '${product.name}',
          ),
        ),
      ),
    );
  }
}
