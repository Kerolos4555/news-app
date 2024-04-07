import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/cubits/bloc_observer.dart';
import 'package:news_application/cubits/news_cubit/news_cubit.dart';
import 'package:news_application/cubits/news_cubit/news_states.dart';
import 'package:news_application/helper/cache_helper.dart';
import 'package:news_application/helper/dio_helper.dart';
import 'package:news_application/layouts/home_layout.dart';
import 'package:news_application/themes/dark_theme.dart';
import 'package:news_application/themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await ChacheHelper.init();

  bool? isDark = ChacheHelper.getData(key: 'isDark');

  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..changeThemeMode(
          fromShared: isDark,
        ),
      child: BlocConsumer<NewsCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const HomeLayout(),
            themeMode: NewsCubit.get(context).getThemeMode(),
            theme: LightThemeData.lightTheme(),
            darkTheme: DarkThemeData.darkTheme(),
          );
        },
      ),
    );
  }
}
