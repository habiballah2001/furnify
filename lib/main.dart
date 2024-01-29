import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controller/states.dart';
import 'layout/layout.dart';
import 'modules/onboarding_screens/on_boarding_screen.dart';
import 'controller/cubit.dart';
import 'shared/custom_widgets/choose_color/color_option_cubit/color_selector_cubit.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';
import 'shared/observer.dart';
import 'shared/style/themes.dart';

Future<void> main() async {
  //to sure (all in main method is done)then(run app).
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  debugPrint("TOKEN ==========>${CacheHelper.getData(key: "token")}");

  bool? onBoard_ = CacheHelper.getData(key: 'onBoard');

  debugPrint('onBoard :$onBoard_');
  bool? isDark_ = CacheHelper.getData(key: 'isDark');

  String? token_ = "Token ${CacheHelper.getData(key: "token")}";

  debugPrint('TOKEN : ===== $token_');

  Widget widget;

  if (onBoard_ != null) {
    widget = const AppLayout();
  } else {
    widget = const OnBoardingScreen();
  }
  runApp(
    MyApp(
      startWidget: widget,
      isDark: isDark_,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget startWidget;
  const MyApp({
    super.key,
    this.isDark,
    required this.startWidget,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AppCubit()
              ..getProducts()
              ..getCategoriesData()
              ..getTopRated()
              ..getUserData()),
        BlocProvider(
          create: (context) => ColorSelectorCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);

          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}
