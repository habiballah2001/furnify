import 'package:flutter/material.dart';

import '../../shared/components.dart';
import '../../controller/cubit.dart';
import '../../widgets/category/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return cubit.categoriesModel != null
        ? Padding(
            padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => CategoryItem(
                categoryModel: cubit.categoriesModel!.categoryItemList[index],
                itemIndex: cubit.categoriesModel!.categoryItemList[index].id,
              ),
              separatorBuilder: (context, index) => const SpaceHeight(),
              itemCount: cubit.categoriesModel!.categoryItemList.length,
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
