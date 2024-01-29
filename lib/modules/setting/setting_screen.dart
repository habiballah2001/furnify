import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnify/controller/states.dart';
import 'package:furnify/modules/setting/profile_screen.dart';
import 'package:furnify/shared/custom_widgets/custom_container.dart';

import '../../controller/cubit.dart';
import '../../shared/components.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/custom_list_tile.dart';
import '../../shared/custom_widgets/custom_texts.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/style/colors.dart';
import '../favorites/favorites_screen.dart';
import '../sign_in&sign_up/sign_in/sign_in_screen.dart';
import 'orders/orders_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);

          return CustomContainer(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: TitleLargeText(
                    cubit.userDataModel != null
                        ? '${cubit.userDataModel!.username}'
                        : 'User Name',
                  ),
                  accountEmail: TitleMediumText(
                    cubit.userDataModel != null
                        ? '${cubit.userDataModel!.email}'
                        : 'email',
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                  ),
                ),
                CustomListTile(
                  function: () => navigateTo(context, const OrdersScreen()),
                  leading: Icons.production_quantity_limits,
                  title: 'Orders',
                ),
                CustomListTile(
                  function: () => navigateTo(context, const ProfileScreen()),
                  leading: Icons.person,
                  title: 'Profile',
                ),
                CustomListTile(
                  function: () => navigateTo(context, const FavoritesScreen()),
                  leading: Icons.favorite,
                  title: 'Wishlist',
                  isDivider: false,
                ),
                const Spacer(),
                SwitchListTile(
                  title: cubit.isDark
                      ? const TitleMediumText('dark')
                      : const TitleMediumText('light'),
                  value: cubit.isDark,
                  onChanged: (value) {
                    cubit.changeMode(shared: value);
                  },
                ),
                if (CacheHelper.getData(key: "token") == null)
                  CustomButton(
                    height: 40,
                    text: 'SignIn',
                    radius: 30,
                    background: primaryColor,
                    icon: Icons.login,
                    function: () {
                      navigateTo(context, SignInScreen());
                    },
                  ),
                if (CacheHelper.getData(key: "token") != null)
                  CustomButton(
                    height: 40,
                    text: 'Sign Out',
                    radius: 30,
                    background: primaryColor,
                    icon: Icons.login,
                    function: () {
                      CacheHelper.removeData(key: "token");
                      Navigator.pop(context);
                    },
                  ),
              ],
            ),
          );
        });
  }
}
