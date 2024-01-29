import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components.dart';
import '../../controller/cubit.dart';
import '../../controller/states.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/custom_text_field.dart';
import '../../shared/style/colors.dart';
import '../../shared/style/icon_broken.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final userNameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final cityController = TextEditingController();

  final addressController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();

  @override
  void initState() {
    AppCubit.get(context).getUserData();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    cityController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        var model = AppCubit.get(context).userDataModel;
        if (model != null) {
          userNameController.text = model.username!;
          emailController.text = model.email!;
          phoneController.text = model.phone!;
          cityController.text = model.city!;
          addressController.text = model.address!;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    IconBroken.Arrow___Left_2,
                    color: Colors.white,
                  )),
              backgroundColor: secColor,
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SpaceHeight(),
                    CustomTextField(
                      controller: userNameController,
                      type: TextInputType.text,
                      hint: 'Last Name',
                      prefix:const Icon(Icons.person) ,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return ' must be filled';
                        }
                        return null;
                      },
                    ),
                    const SpaceHeight(),
                    CustomTextField(
                      controller: emailController,
                      type: TextInputType.text,
                      hint: 'E-mail',
                      prefix:const Icon(Icons.email) ,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return ' must be filled';
                        }
                        return null;
                      },
                    ),
                    const SpaceHeight(),
                    CustomTextField(
                      controller: phoneController,
                      type: TextInputType.text,
                      hint: 'Phone',
                      prefix:const Icon(Icons.phone_android) ,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return ' must be filled';
                        }
                        return null;
                      },
                    ),
                    const SpaceHeight(),
                    CustomTextField(
                      controller: cityController,
                      type: TextInputType.text,
                      hint: 'City',
                      prefix:const Icon(Icons.phone_android) ,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return ' must be filled';
                        }
                        return null;
                      },
                    ),
                    const SpaceHeight(),
                    CustomTextField(
                      controller: addressController,
                      type: TextInputType.text,
                      hint: 'Address',
                      prefix:const Icon(Icons.phone_android) ,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return ' must be filled';
                        }
                        return null;
                      },
                    ),
                    const SpaceHeight(),
                    CustomButton(
                      radius: 15,
                      text: 'Update Profile',
                      function: () {
                        cubit.updateUserData(
                          userName: userNameController.text,
                          email: emailController.text,
                          phone: cityController.text,
                          city: cityController.text,
                          address: addressController.text,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    IconBroken.Arrow___Left_2,
                    color: Colors.white,
                  )),
              backgroundColor: secColor,
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
