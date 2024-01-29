import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/components.dart';
import '../shared/constants.dart';
import '../controller/cubit.dart';
import '../controller/states.dart';
import '../shared/custom_widgets/custom_container.dart';
import '../shared/custom_widgets/custom_texts.dart';
import '../shared/style/colors.dart';
import '../modules/home/products/product_details_screen.dart';
import '../modules/sign_in&sign_up/sign_in/sign_in_screen.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    Key? key,
    required this.product,
    //required this.press,
  }) : super(key: key);
  final product;
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 70),
                      padding: const EdgeInsets.all(8),
                      height: 160.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 8,
                            color: secColor,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TitleSmallText('${product.name}'),
                            Row(
                              children: [
                                TitleMediumText(
                                  '${product.price} Egp',
                                ),
                                const Spacer(),
                                CustomContainer(
                                  width: 30,
                                  height: 30,
                                  radius: BorderRadius.circular(20),
                                  padding: 0,
                                  color: secColor,
                                  child: IconButton(
                                    onPressed: () {
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
                                    icon: const Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                                SpaceWidth(width: 5),
                                CustomContainer(
                                  radius: BorderRadius.circular(20),
                                  padding: 0,
                                  width: 30,
                                  height: 30,
                                  color: secColor,
                                  child: IconButton(
                                    onPressed: () {
                                      if (cubit.userDataModel != null) {
                                        cubit.addToCart(productId: product.id);
                                      } else {
                                        return navigateTo(
                                          context,
                                          SignInScreen(),
                                        );
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.add_shopping_cart_outlined,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 140.0,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              height: 30,
                              width: 65,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.elliptical(80, 30),
                                  bottomRight: Radius.elliptical(80, 30),
                                  topLeft: Radius.elliptical(80, 30),
                                  topRight: Radius.elliptical(80, 30),
                                ),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    blurRadius: 16,
                                    color: Colors.grey.shade500,
                                  ),
                                ],
                              ),
                            ),
                            //Image(image: NetworkImage(productModel.photo.toString()),),
                            Image.network(
                                'http://$ip:8000${product.photo.toString()}'),
                            //Image.file(File(productModel.photo.toString())),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
