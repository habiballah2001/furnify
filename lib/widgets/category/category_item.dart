import 'package:flutter/material.dart';
import '../../../models/category_model.dart';
import '../../../shared/components.dart';
import '../../../shared/constants.dart';
import '../../modules/categories/category_products_screen.dart';
import '../../shared/custom_widgets/custom_card.dart';
import '../../shared/custom_widgets/custom_texts.dart';
import '../../shared/style/icon_broken.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    this.width = 100,
    this.height = 160,
    required this.categoryModel,
    required this.itemIndex,
    //this.press,
  }) : super(key: key);

  final itemIndex;
  final CategoryModel categoryModel;
  final double? width;
  final double? height;
  //final Function()? press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(
          context,
          CategoryProductsScreen(
            itemIndex: itemIndex,
          ),
        );
      },
      child: CustomCard(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              'http://$ip:8000${categoryModel.photo.toString()}',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TitleMediumText(
                '${categoryModel.name}',
              ),
            ),
            const Spacer(),
            const Icon(IconBroken.Arrow___Right_2),
            const SpaceWidth(),
          ],
        ),
      ),
    );
  }
}
