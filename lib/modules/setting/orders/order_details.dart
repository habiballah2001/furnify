import 'package:flutter/material.dart';
import 'package:furnify/modules/setting/orders/product_in_order.dart';
import '../../../models/orders/orders_model.dart';
import '../../../shared/components.dart';
import '../../../controller/cubit.dart';
import '../../../shared/custom_widgets/custom_texts.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen(
      {Key? key, required this.orderListModel, required this.itemIndex})
      : super(key: key);

  final int itemIndex;
  final OrdersListModel orderListModel;
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);

    return Scaffold(
      appBar: AppBar(
        title: const TitleLargeText('Order Details'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const TitleMediumText(
                      'Total : ',
                    ),
                    const Spacer(),
                    TitleLargeText(
                      '${orderListModel.total} EGP ',
                    ),
                  ],
                ),
                SpaceHeight(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const TitleMediumText(
                      'Products : ',
                    ),
                    const Spacer(),
                    TitleLargeText(
                      '${orderListModel.details.length} ',
                    ),
                  ],
                ),
                SpaceHeight(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const TitleMediumText(
                      'Order Date : ',
                    ),
                    const Spacer(),
                    TitleLargeText(
                      '${orderListModel.orderDate} ',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => ProductInOrder(
                itemIndex: index,
                orderProduct: orderListModel.details[index].product!,
              ),
              separatorBuilder: (context, index) => const SpaceHeight(),
              itemCount: cubit.ordersModel!.orders[itemIndex].details.length,
            ),
          ),
        ],
      ),
    );
  }
}
