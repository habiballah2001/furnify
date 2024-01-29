import 'package:flutter/material.dart';
import '../models/favorite_products_model.dart';
import '../shared/components.dart';
import '../shared/constants.dart';
import '../controller/cubit.dart';
import '../shared/custom_widgets/custom_container.dart';
import '../shared/custom_widgets/custom_texts.dart';
import '../shared/style/colors.dart';
import '../modules/home/products/product_details_screen.dart';
import '../modules/sign_in&sign_up/sign_in/sign_in_screen.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    Key? key,
    required this.favProductModel,
  }) : super(key: key);

  final FavProductModel favProductModel;
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return GestureDetector(
      onTap: () {
        navigateTo(context, DetailsScreen(product: favProductModel));
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
                        HeadSmallText(
                           favProductModel.name.toString(),
                        ),
                        Row(
                          children: [
                            TitleLargeText(
                                '${favProductModel.price} L.E'),
                            const Spacer(),
                            CustomContainer(
                              radius: BorderRadius.circular(20),
                              padding: 0,
                              color: secColor,
                              child: IconButton(
                                onPressed: () {
                                  if (cubit.userDataModel != null) {
                                    cubit.removeFromFavorite(
                                        productId:
                                            favProductModel.id.toString());
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
                                  size: 20,
                                ),
                              ),
                            ),
                            SpaceWidth(),
                            CustomContainer(
                              radius: BorderRadius.circular(20),
                              padding: 0,
                              color: secColor,
                              child: IconButton(
                                onPressed: () {
                                  if (cubit.userDataModel != null) {
                                    cubit.addToCart(
                                        productId: favProductModel.id!.toInt());
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
                                  size: 20,
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
                          height: 40,
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.elliptical(100, 50),
                              bottomRight: Radius.elliptical(100, 50),
                              topLeft: Radius.elliptical(100, 50),
                              topRight: Radius.elliptical(100, 50),
                            ),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                blurRadius: 15,
                                color: Colors.grey.shade500,
                              ),
                            ],
                          ),
                        ),
                        Image.network(
                          fit: BoxFit.cover,
                          'http://$ip:8000${favProductModel.photo}',
                        ),
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
  }
}
