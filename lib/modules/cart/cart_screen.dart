import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components.dart';
import '../../controller/cubit.dart';
import '../../controller/states.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/custom_container.dart';
import '../../shared/custom_widgets/custom_texts.dart';
import '../../widgets/cart/cart_item.dart';
import 'PaymentScreen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    AppCubit.get(context).getCartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        if (cubit.getCartsModel != null) {
          return Column(
            children: [
              Expanded(
                child: cubit.details.isNotEmpty
                    ? ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => Dismissible(
                          onDismissed: (DismissDirection d) {
                            debugPrint("removed");
                            cubit.removeFromCart(
                                productId: cubit.details[index].id!);
                          },
                          key: UniqueKey(),
                          child: CartItem(
                            itemIndex: index,
                            details: cubit.details[index],
                            onPressed: () {
                              cubit.removeFromCart(
                                  productId: cubit.details[index].id!);
                            },
                          ),
                        ),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: cubit.details.length,
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Image.asset('assets/images/nocart.jpeg'),
                            ),
                            const TitleLargeText('Cart Is Empty'),
                          ],
                        ),
                      ),
              ),
              CustomContainer(
                padding: 20,
                margin: const EdgeInsets.all(20),
                height: 200,
                color: Colors.grey.shade100,
                radius: const BorderRadius.vertical(top: Radius.circular(50)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const BodyLargeText('Subtotal'),
                        const Spacer(),
                        BodyLargeText(
                          '${cubit.getCartsModel!.total.toString()} L.E',
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        BodyLargeText('Delivery'),
                        Spacer(),
                        BodyLargeText('0 L.E'),
                      ],
                    ),
                    Row(
                      children: [
                        const BodyLargeText('Total'),
                        const Spacer(),
                        TitleMediumText(
                          '${cubit.getCartsModel!.total.toString()} L.E',
                        ),
                      ],
                    ),
                    const Spacer(),
                    CustomButton(
                      height: 55,
                      width: double.infinity,
                      textColor: Colors.white,
                      radius: 20,
                      function: () {
                        navigateTo(context, const PaymentScreen());
                        debugPrint('checkout');
                      },
                      text: 'CHECK OUT',
                    ),
                  ],
                ),
              )
            ],
          );
        } else {
          return const Center();
        }
      },
    );
  }
}
