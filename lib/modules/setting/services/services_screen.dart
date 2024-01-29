import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controller/cubit.dart';
import '../../../controller/states.dart';
import '../../../widgets/service_item.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getServicesList();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return cubit.servicesModel != null
            ? GridView.count(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 2 / 2,
          shrinkWrap: true,
          children: List.generate(
            cubit.servicesModel!.serviceCategory.length,
                (index) => ServiceItem(
              service: cubit.servicesModel!.serviceCategory[index],
              itemIndex: index,
            ),
          ),
        )
            : const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
