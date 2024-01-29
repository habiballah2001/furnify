import 'package:flutter/material.dart';
import '../../shared/components.dart';
import '../../controller/cubit.dart';
import '../../shared/custom_widgets/custom_texts.dart';
import '../../widgets/category/category_product_item.dart';

class CategoryProductsScreen extends StatefulWidget {
  final int itemIndex;

  const CategoryProductsScreen({Key? key, required this.itemIndex})
      : super(key: key);

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  @override
  void initState() {
    AppCubit.get(context).getCategoryItem(widget.itemIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: TitleLargeText(
            '${cubit.categoriesModel!.categoryItemList[widget.itemIndex - 1].name}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: cubit.categoryProductList.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, index) => CategoryProductItem(
                      product: cubit.categoryProductList[index],
                    ),
                    separatorBuilder: (context, index) => const SpaceHeight(),
                    itemCount: cubit.categoryProductList.length,
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          )
        ],
      ),
    );
  }
}
