import 'package:flutter/material.dart';
import '../../../models/carts/get_carts_model.dart';
import '../../../shared/components.dart';
import '../../../shared/constants.dart';
import '../../controller/cubit.dart';
import '../../../shared/style/colors.dart';
import '../../shared/custom_widgets/cached_image.dart';
import '../../shared/custom_widgets/custom_card.dart';
import '../../shared/custom_widgets/custom_container.dart';
import '../../shared/custom_widgets/custom_texts.dart';

class CartItem extends StatefulWidget {
  final int itemIndex;
  final CartDetailsModel details;
  final void Function()? onPressed;

  const CartItem(
      {Key? key,
      required this.itemIndex,
      required this.details,
      this.onPressed})
      : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return CustomContainer(
        margin: const EdgeInsets.all(10),
        padding: 10,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomCachedImage(
                img: 'http://$ip:8000${widget.details.product!.photo}',
              ),
            ),
            SpaceWidth(),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleLargeText(widget.details.product!.name.toString()),
                  BodyLargeText(widget.details.product!.price.toString()),
                  SpaceWidth(width: 50),
                  IconButton(
                    onPressed: widget.onPressed,
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    cubit.subQuantity(productId: widget.details.id.toString());
                    if (cubit.details[widget.itemIndex].quantity == 1) {
                      cubit.removeFromCart(
                          productId: cubit.details[widget.itemIndex].id);
                    }
                  },
                  child: CustomContainer(
                    color: secColor,
                    padding: 2,
                    radius: const BorderRadius.all(Radius.circular(10)),
                    child: Icon(
                      cubit.details[widget.itemIndex].quantity == 1
                          ? Icons.delete
                          : Icons.minimize,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TitleLargeText(
                    '${cubit.getCartsModel!.details[widget.itemIndex].quantity}',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    cubit.addQuantity(productId: widget.details.id.toString());
                  },
                  child: const CustomContainer(
                    radius: BorderRadius.all(Radius.circular(10)),
                    padding: 2,
                    color: secColor,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
