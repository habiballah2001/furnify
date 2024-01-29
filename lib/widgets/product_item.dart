import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/in_home/products_list_model.dart';
import '../shared/components.dart';
import '../shared/constants.dart';
import '../controller/cubit.dart';
import '../controller/states.dart';
import '../modules/sign_in&sign_up/sign_in/sign_in_screen.dart';
import '../modules/home/products/product_details_screen.dart';
import '../shared/custom_widgets/cached_image.dart';
import '../shared/custom_widgets/custom_card.dart';
import '../shared/custom_widgets/custom_container.dart';
import '../shared/custom_widgets/custom_texts.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
    //required this.press,
  }) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return GestureDetector(
          onTap: () {
            navigateTo(context, DetailsScreen(product: product));
          },
          child: CustomCard(
            radius: 20,
            color: Colors.grey[100],
            padding: 5,
            //height: 180,
            child: Column(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onTap: () {
                          if (cubit.userDataModel != null) {
                            cubit.addToFavorite(
                                productId: product.id.toString());
                          } else {
                            return navigateTo(
                              context,
                              SignInScreen(),
                            );
                          }
                        },
                        child: const Icon(
                          Icons.favorite,
                          size: 25,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
                CustomCachedImage(
                  img: 'http://$ip:8000${product.photo}',
                  height: 120,
                ),
                const Spacer(),
                CustomContainer(
                  color: Colors.white,
                  margin: const EdgeInsets.all(10),
                  padding: 3,
                  radius:
                      const BorderRadius.vertical(bottom: Radius.circular(20)),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleSmallText( '${product.name}'),
                      Text(
                        '${product.price} Egp',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const BodySmallText( 'Provided By Furnify')
              ],
            ),
          ),
        );
      },
    );
  }
}
