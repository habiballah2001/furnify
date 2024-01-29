import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/cubit.dart';
import '../../../controller/states.dart';
import '../../../shared/style/icon_broken.dart';
import '../../../widgets/product_item.dart';

class GeneralProducts extends StatelessWidget {
  const GeneralProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                IconBroken.Arrow___Left_2,
                color: Colors.black,
              ),
            ),
            title: const Text('Products'),
          ),
          body: cubit.topRatedModel != null
              ? GridView.count(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(8),
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            crossAxisCount: 2,
            childAspectRatio: 2 / 2.5,
            shrinkWrap: true,
            children: List.generate(
              cubit.productsModel!.products.length,
                  (index) => ProductItem(
                product: cubit.productsModel!.products[index],
              ),
            ),
          )
              : const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
