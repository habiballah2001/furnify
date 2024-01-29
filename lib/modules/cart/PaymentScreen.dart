import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../shared/components.dart';
import '../../controller/cubit.dart';
import '../../controller/states.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/custom_text_field.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _securityCodeDateController =
      TextEditingController();
  final TextEditingController _expirationDateController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is PaymentSuccessState) Navigator.pop(context);
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Payment'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Payment method',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Shipment Address',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomTextField(
                  controller: _addressController,
                  type: TextInputType.number,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return ' must be filled';
                    }
                    return null;
                  },
                  hint: 'Shipment Address',
                  prefix: const Icon(Icons.home_work),
                ),
                const Text(
                  'Shipment Phone',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomTextField(
                  controller: _phoneController,
                  type: TextInputType.number,
                  maxLength: 50,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return ' must be filled';
                    }
                    return null;
                  },
                  hint: 'Shipment Phone',
                  prefix: const Icon(Icons.phone),
                ),
                const Text(
                  'Card Number',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomTextField(
                  controller: _cardNumberController,
                  type: TextInputType.number,
                  maxLength: 16,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return ' must be filled';
                    }
                    return null;
                  },
                  hint: 'Card Number',
                  prefix: const Icon(Icons.credit_card),
                ),
                const Text(
                  'Security Code',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomTextField(
                  controller: _securityCodeDateController,
                  type: TextInputType.number,
                  maxLength: 3,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return ' must be filled';
                    }
                    return null;
                  },
                  hint: 'Security Code',
                  prefix: const Icon(Icons.lock),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Expiration date',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomTextField(
                  controller: _expirationDateController,
                  type: TextInputType.datetime,
                  onTap: () {
                    return showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.parse('2030-05-03'),
                    ).then((value) {
                      _expirationDateController.text =
                          DateFormat('yyyy-MM-dd').format(value!.toLocal());
                    });
                  },
                  validate: (value) {
                    if (value!.isEmpty) {
                      return ' must be filled';
                    }
                    return null;
                  },
                  hint: 'Exp. date',
                  prefix: const Icon(Icons.date_range),
                ),
                const SpaceHeight(),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
          bottomNavigationBar: CustomButton(
            width: double.infinity,
            height: 50,
            radius: 30,
            function: () {
              cubit.payment(
                shipmentAddress: _addressController.text,
                shipmentPhone: _phoneController.text,
                cardNumber: _cardNumberController.text,
                expireDate: _expirationDateController.text,
                securityCode: _securityCodeDateController.text,
              );
            },
            text: 'Confirm',
          ),
        );
      },
    );
  }
}
