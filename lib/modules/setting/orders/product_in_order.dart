import 'package:flutter/material.dart';
import '../../../models/orders/orders_model.dart';
import '../../../shared/constants.dart';
import '../../../controller/cubit.dart';
import '../../../shared/custom_widgets/custom_card.dart';
import '../../../shared/custom_widgets/custom_texts.dart';

class ProductInOrder extends StatelessWidget {
  const ProductInOrder({Key? key, required this.itemIndex, required this.orderProduct, })
      : super(key: key);

  final int itemIndex;
  final OrderProduct orderProduct;
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomCard(
          radius: 20,
          color: Colors.grey[100],
          padding: 5,
          child: Row(
            children: [
              Image.network(
                height: 120,
                width: 120,
                fit: BoxFit.cover,
                'http://$ip:8000${orderProduct.photo}',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleMediumText( orderProduct.name.toString()),
                  BodyLargeText( orderProduct.price.toString()),
                ],
              ),
            ],
          )
      ),
    );
  }
}
