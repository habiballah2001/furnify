import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/layout.dart';
import '../../../shared/components.dart';
import '../../../shared/constants.dart';
import '../../../shared/custom_widgets/custom_button.dart';
import '../../../shared/custom_widgets/custom_card.dart';
import '../../../shared/custom_widgets/custom_text_field.dart';
import '../../../shared/custom_widgets/custom_texts.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/style/colors.dart';
import '../../../shared/style/icon_broken.dart';
import 'sign_up_cubit.dart';
import 'sign_up_states.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final username = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final password2 = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  final city = TextEditingController();
  var formKey = GlobalKey<FormState>();

  String dropdownValue = 'Cairo';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            if (state.userDataModel.isActive == true) {
              debugPrint('${state.userDataModel.isActive}');
              debugPrint(state.userDataModel.token);
              CacheHelper.saveData(
                key: 'token',
                value: state.userDataModel.token,
              ).then((value) {
                token_ = state.userDataModel.token ?? '';
                navigateAndFinish(
                  context,
                  const AppLayout(),
                );
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Can\'t Sign Up'),
                ),
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = SignUpCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  IconBroken.Arrow___Left_2,
                  color: Colors.black,
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      cubit.userRegister(
                        username: "saasaa",
                        first_name: "fairaName",
                        last_name: "lasataNa",
                        email: "emaieta",
                        phone: "phonea.tt",
                        address: "aaddress",
                        city: 1,
                        password: "apassworda",
                        password2: "apassworda",
                      );
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
            backgroundColor: primaryColor,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: CustomCard(
                radius: 20,
                margin: const EdgeInsets.fromLTRB(30, 50, 30, 0),
                color: Colors.white,
                padding: 10,
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SpaceHeight(height: 40),
                      Center(
                        child: Text(
                          'Sign up',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: firstName,
                              hint: 'First Name',
                              type: TextInputType.text,
                              prefix: const Icon(Icons.person),
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return ' must be filled';
                                }
                                return null;
                              },
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              controller: lastName,
                              hint: 'Last Name',
                              type: TextInputType.text,
                              prefix: const Icon(Icons.person),
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return ' must be filled';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      CustomTextField(
                        controller: username,
                        hint: 'Username',
                        type: TextInputType.text,
                        prefix: const Icon(Icons.person),
                        validate: (value) {
                          if (value!.isEmpty) {
                            return ' must be filled';
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        controller: phone,
                        maxLength: 11,
                        hint: 'Phone',
                        type: TextInputType.text,
                        prefix: const Icon(Icons.phone_android),
                        validate: (value) {
                          if (value!.isEmpty || value.length < 11) {
                            return ' enter valid phone';
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        controller: email,
                        hint: 'Email',
                        prefix: const Icon(Icons.email),
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          if (value!.isEmpty ||
                              value.startsWith('_') ||
                              !value.contains('@') ||
                              !value.contains('.com')) {
                            return 'enter valid email';
                          }
                          return null;
                        },
                      ),
                      PasswordTextField(
                        controller: password,
                        maxLength: 32,
                        label: 'Password',
                        isPassword: true,
                        type: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return ' must be filled';
                          }
                          return null;
                        },
                        onSubmit: (value) {},
                      ),
                      PasswordTextField(
                        controller: password2,
                        maxLength: 32,
                        label: 'Confirm Password',
                        isPassword: cubit.isPassword,
                        type: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return ' must be filled';
                          }
                          return null;
                        },
                        onSubmit: (value) {},
                      ),
                      const SpaceHeight(),
                      Text(
                        'Address',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: city,
                              hint: 'City',
                              type: TextInputType.number,
                              prefix: const Icon(Icons.house),
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return ' must be filled';
                                }
                                return null;
                              },
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              controller: address,
                              hint: 'more...',
                              type: TextInputType.text,
                              prefix: const Icon(Icons.house),
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return ' must be filled';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      // Step 1.
                      // Step 2.
                      /*DropdownButton<String>(
                        // Step 3.
                        value: dropdownValue,
                        // Step 4.
                        items: <String>[
                          'Cairo',
                          'Obour',
                          'Nasr City',
                          'maady'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(fontSize: 30),
                            ),
                          );
                        }).toList(),
                        // Step 5.
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),*/
                      const SpaceHeight(),
                      Center(
                        child: CustomButton(
                          background: secColor,
                          height: 40,
                          width: double.infinity,
                          radius: 30,
                          text: 'Sign up',
                          function: () {
                            if (formKey.currentState!.validate()) {
                              cubit.userRegister(
                                username: username.text,
                                first_name: firstName.text,
                                last_name: lastName.text,
                                email: email.text,
                                phone: phone.text,
                                address: address.text,
                                city: int.parse(city.text),
                                password: password.text,
                                password2: password2.text,
                              );
                            }
                            //debugPrint('User : ${cubit.userDataModel?.toJson()}');
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'already have an account?',
                            style: TextStyle(color: Color(0xff3b5249)),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const BodyLargeText(
                              'Sign in',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
