import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/layout.dart';
import '../../../shared/components.dart';
import '../../../shared/custom_widgets/custom_button.dart';
import '../../../shared/custom_widgets/custom_card.dart';
import '../../../shared/custom_widgets/custom_text_field.dart';
import '../../../shared/custom_widgets/custom_texts.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/style/colors.dart';
import '../../../shared/style/icon_broken.dart';
import '../sign_up/sign_up_screen.dart';
import 'sign_in_cubit.dart';
import 'sign_in_states.dart';

// reusable components

// 1. timing
// 2. refactor
// 3. quality
// 4. clean code
class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(SignInInitialState()),
      child: BlocConsumer<SignInCubit, SignInStates>(
        listener: (context, state) {
          if (state is SignInSuccessState) {
            debugPrint(state.userDataModel.token);
            CacheHelper.saveData(key: 'token', value: state.userDataModel.token)
                .then((value) {
              navigateTo(context, const AppLayout());
            }).catchError((error) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Can\'t sign in')));
            });
          }
        },
        builder: (context, state) {
          var cubit = SignInCubit.get(context);
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
            ),
            resizeToAvoidBottomInset: false,
            backgroundColor: primaryColor,
            body: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: CustomCard(
                  color: Colors.white,
                  radius: 20,
                  margin: const EdgeInsets.fromLTRB(30, 40, 30, 0),
                  padding: 10,
                  height: 600,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SpaceHeight(height: 50),
                        Text(
                          'Login',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SpaceHeight(
                          height: 80.0,
                        ),
                        CustomTextField(
                          controller: userNameController,
                          hint: 'user name',
                          prefix: const Icon(Icons.email),
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'User Name must be filled';
                            }
                            return null;
                          },
                        ),
                        const SpaceHeight(),
                        PasswordTextField(
                          controller: passwordController,
                          label: 'Password',
                          maxLength: 32,
                          isPassword: cubit.isPassword,
                          type: TextInputType.visiblePassword,
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              cubit.userLogin(
                                username: userNameController.text,
                                password: passwordController.text,
                              );
                            }
                            debugPrint('');
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return ' must be filled';
                            }
                            return null;
                          },
                        ),
                        const SpaceHeight(),
                        Center(
                          child: state is SignInLoadingState
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : CustomButton(
                                  background: secColor,
                                  height: 40,
                                  width: double.infinity,
                                  radius: 30,
                                  text: 'login',
                                  isUpperCase: true,
                                  function: () async {
                                    if (formKey.currentState!.validate()) {
                                      await cubit.userLogin(
                                        username: userNameController.text,
                                        password: passwordController.text,
                                      );
                                      // navigateAndFinish(
                                      //     context, const AppLayout());
                                    }
                                  },
                                ),
                        ),
                        const SpaceHeight(),
                        const SpaceHeight(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                              style: TextStyle(color: Color(0xff3b5249)),
                            ),
                            const SpaceWidth(),
                            InkWell(
                              onTap: () {
                                navigateTo(context, const SignUpScreen());
                              },
                              child: const BodyLargeText(
                                'Sign up',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
