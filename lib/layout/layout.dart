import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../modules/search/search.dart';
import '../shared/components.dart';
import '../controller/cubit.dart';
import '../controller/states.dart';
import '../shared/custom_widgets/custom_texts.dart';
import '../shared/style/colors.dart';
import '../shared/style/icon_broken.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: HeadSmallText(cubit.titlesList[cubit.currentIndex]),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  navigateTo(context, SearchScreen());
                },
                child: const Icon(
                  IconBroken.Search,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: cubit.bottomScreens[cubit.currentIndex],
        bottomNavigationBar: BottomNavyBar(
          curve: Curves.easeInCirc,
          backgroundColor: primaryColor,
          iconSize: 30,
          containerHeight: 60,
          selectedIndex: cubit.currentIndex,
          showElevation: false,
          items: cubit.bottomItems,
          onItemSelected: (value) {
            cubit.changeBottomNavBar(value);
          },
        ),
      ),
    );
  }
}
