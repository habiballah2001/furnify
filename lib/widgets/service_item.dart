import 'package:flutter/material.dart';
import '../models/services/services_list_model.dart';
import '../modules/setting/services/service_request_screen.dart';
import '../shared/components.dart';
import '../shared/constants.dart';
import '../shared/custom_widgets/custom_texts.dart';
import '../shared/style/colors.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    Key? key,
    this.width = 100,
    this.height = 100,
    required this.service,
    required this.itemIndex,
    //this.press,
  }) : super(key: key);

  final double? width;
  final double? height;
  final ServiceModel service;
  final int itemIndex;
  //final Function()? press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateTo(context, const ServiceRequestScreen()),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              opacity: 150,
              colorFilter:
                  const ColorFilter.mode(primaryColor, BlendMode.color),
              image: NetworkImage(
                'http://$ip:8000${service.photo}',
              ),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: const <BoxShadow>[
              BoxShadow(color: secColor, blurRadius: 2),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TitleMediumText(
                 '${service.name}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
