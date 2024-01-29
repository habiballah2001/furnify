import 'package:flutter/material.dart';
import '../models/orders/orders_model.dart';
import '../shared/components.dart';
import '../controller/cubit.dart';
import '../shared/custom_widgets/custom_card.dart';
import '../modules/setting/orders/order_details.dart';
import '../shared/custom_widgets/custom_outlined_button.dart';

class OrderItem extends StatelessWidget {
  final OrdersListModel orderListModel;
  final int itemIndex;
  const OrderItem(
      {Key? key,
      required this.orderListModel,
      required this.itemIndex})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    //AppCubit cubit = AppCubit.get(context);
    return Column(
      children: [
        CustomCard(
          color: Colors.grey[100],
          radius: 5,
          padding: 10,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Order Date',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  // ignore: prefer_const_constructors
                  Spacer(),
                  Text(
                    '${orderListModel.orderDate}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              SpaceHeight(),
              Row(
                children: [
                  Text(
                    'total',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  Text(
                    '${orderListModel.total} Egp',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              SpaceHeight(),
              Row(
                children: [
                  Text(
                    'Delivered',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.green),
                  ),
                  const Spacer(),
                  CustomOutlinedButton(
                    title: 'Details',
                    function: () {
                      navigateTo(
                        context,
                        OrderDetailsScreen(
                          orderListModel: orderListModel,
                          itemIndex: itemIndex,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
