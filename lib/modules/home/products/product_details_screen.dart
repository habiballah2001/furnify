import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../controller/cubit.dart';
import '../../../controller/states.dart';
import '../../../shared/components.dart';
import '../../../shared/custom_widgets/custom_button.dart';
import '../../../shared/custom_widgets/custom_texts.dart';
import '../../../shared/style/colors.dart';
import '../../../shared/style/icon_broken.dart';
import '../../sign_in&sign_up/sign_in/sign_in_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  final product;

  //bool select;
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          backgroundColor: thColor,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              padding: const EdgeInsets.only(right: 20),
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: false,
            title: Text(
              'Details',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Image.asset(product.image),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: 400,
                child: Container(
                  height: 370,
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(color: Colors.grey, blurRadius: 10)
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        // margin: const EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RatingBar(
                              initialRating: 0,
                              itemSize: 35,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              glowColor: Colors.amberAccent,
                              itemCount: 5,
                              ratingWidget: RatingWidget(
                                full: const Icon(
                                  Icons.star,
                                  color: Colors.amberAccent,
                                ),
                                half: const Icon(
                                  Icons.star_half,
                                  color: Colors.amberAccent,
                                ),
                                empty: const Icon(
                                  Icons.star_border,
                                  color: Colors.amberAccent,
                                ),
                              ),
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              onRatingUpdate: (rating) {
                                cubit.rate(product.id.toString(), rating);
                                debugPrint(rating.toString());
                              },
                            ),
                            const Spacer(),
                            FloatingActionButton(
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
                              backgroundColor: Colors.white,
                              elevation: 0,
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Price :',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          TitleLargeText(
                            '${product.price} EGP ',
                          ),
                        ],
                      ),
                      const SpaceHeight(height: 15),
                      HeadSmallText(
                        '${product.name}',
                      ),
                      const SpaceHeight(height: 15),
                      Expanded(
                        child: SingleChildScrollView(
                            child: TitleSmallText(
                          '${product.description}',
                        )),
                      ),
                      const SpaceHeight(height: 15),
                      CustomButton(
                        height: 50,
                        radius: 10,
                        text: 'Add to cart',
                        width: double.infinity,
                        background: secColor,
                        icon: IconBroken.Bag,
                        function: () {
                          if (cubit.userDataModel != null) {
                            cubit.addToCart(productId: product.id);
                          } else {
                            return navigateTo(
                              context,
                              SignInScreen(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
