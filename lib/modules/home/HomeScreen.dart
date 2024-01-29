import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components.dart';
import '../../controller/cubit.dart';
import '../../controller/states.dart';
import '../../shared/constants.dart';
import '../../shared/custom_widgets/custom_card.dart';
import '../../shared/custom_widgets/custom_texts.dart';
import '../../shared/custom_widgets/slider/custom_carousel_slider.dart';
import '../../shared/custom_widgets/slider/custom_text_button.dart';
import '../../widgets/category/category_item_home.dart';
import '../../widgets/product_item.dart';
import '../setting/services/services_screen.dart';
import 'products/general_products_screen.dart';
import 'products/top_rated_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                children: [
                  SpaceHeight(),
                  CustomCarouselSlider(height: 140, items: Lists.banners),
                  SpaceHeight(height: 20),
                ],
              ),
              const SpaceHeight(),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SpaceHeight(),
                    if (cubit.categoriesModel != null)
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => CategoryItemHome(
                            product:
                                cubit.categoriesModel!.categoryItemList[index],
                            itemIndex: cubit
                                .categoriesModel!
                                .categoryItemList[index]
                                .id!, //itemIndex ==== id
                          ),
                          separatorBuilder: (context, index) =>
                              const SpaceHeight(),
                          itemCount:
                              cubit.categoriesModel!.categoryItemList.length,
                        ),
                      )
                    else
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    const SpaceHeight(),
                    InkWell(
                      onTap: () {
                        navigateTo(context, const TopRatedScreen());
                      },
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            const HeadSmallText('Top Rated'),
                            const Spacer(),
                            CustomTextButton(
                              text: ' All ',
                              icon: Icons.arrow_forward_ios_rounded,
                              function: () {
                                navigateTo(context, const TopRatedScreen());
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    cubit.topRatedModel != null
                        ? GridView.count(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.all(8),
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 2.6,
                            shrinkWrap: true,
                            children: List.generate(
                              cubit.topRatedModel!.products.length > 4
                                  ? 4
                                  : cubit.topRatedModel!.products.length,
                              (index) => ProductItem(
                                product: cubit.topRatedModel!.products[index],
                              ),
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                    const SpaceHeight(height: 20),
                    //OFFERS
                    const Row(
                      children: [
                        HeadSmallText('Offers'),
                      ],
                    ),
                    GridView.count(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: .2 / .2,
                      shrinkWrap: true,
                      children: List.generate(
                        Lists.offers.length,
                        (index) => CustomCard(
                          child: Lists.offers[index],
                        ),
                      ),
                    ),
                    const SpaceHeight(),
                    //PRODUCTS
                    InkWell(
                      onTap: () {
                        navigateTo(
                          context,
                          const GeneralProducts(),
                        );
                      },
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            const HeadSmallText('Products'),
                            const Spacer(),
                            CustomTextButton(
                              text: ' All ',
                              icon: Icons.arrow_forward_ios_rounded,
                              function: () {
                                navigateTo(context, const GeneralProducts());
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    cubit.productsModel != null
                        ? GridView.count(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.all(8),
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 2.6,
                            shrinkWrap: true,
                            children: List.generate(
                              cubit.productsModel!.products.length > 4
                                  ? 4
                                  : cubit.productsModel!.products.length,
                              (index) => ProductItem(
                                product: cubit.productsModel!.products[index],
                              ),
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                    //SERVICES
                    SizedBox(
                      height: 40,
                      child: Row(
                        children: [
                          const HeadSmallText('Services'),
                          const Spacer(),
                          CustomTextButton(
                            text: ' All ',
                            icon: Icons.arrow_forward_ios_rounded,
                            function: () {},
                          )
                        ],
                      ),
                    ),
                    GridView.count(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: .2 / .2,
                      shrinkWrap: true,
                      children: List.generate(
                        Lists.services.length,
                        (index) => InkWell(
                          onTap: () =>
                              navigateTo(context, const ServicesScreen()),
                          child: CustomCard(
                            child: Lists.services[index],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/*
Widget categoryItem( model, BuildContext context, int itemIndex) =>
    InkWell(
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
          color: Colors.grey[100],
          child: Center(
            child: BodyLargeText(
               '${model.name}',
            ),
          ),
        ));
*/
