import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controller/cubit.dart';
import '../../../controller/states.dart';
import '../../../shared/style/icon_broken.dart';
import '../../../widgets/order_item.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    AppCubit.get(context).getOrders();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder:(context, state) {
        return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                IconBroken.Arrow___Left_2,
                color: Colors.black,
              )),
          title: const Text('My Orders'),
        ),
        body: cubit.ordersModel != null
            ? ListView.builder(
                itemBuilder: (context, index) => OrderItem(
                  orderListModel: cubit.ordersModel!.orders[index],
                  itemIndex: index,
                ),
                itemCount: cubit.ordersModel!.orders.length,
                scrollDirection: Axis.vertical,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      );
      },
    );
  }
}
