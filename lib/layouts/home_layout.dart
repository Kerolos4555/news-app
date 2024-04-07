import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/cubits/news_cubit/news_cubit.dart';
import 'package:news_application/cubits/news_cubit/news_states.dart';
import 'package:news_application/pages/search_page.dart';
import 'package:news_application/widgets/bot_nav_bar.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'News App',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SearchPage();
                      },
                    ),
                  );
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: () {
                  NewsCubit.get(context).changeThemeMode();
                },
                icon: const Icon(
                  Icons.brightness_4_outlined,
                ),
              ),
            ],
          ),
          body: NewsCubit.get(context)
              .pages[NewsCubit.get(context).currentIndex],
          bottomNavigationBar: CustomBotNavBar(
            key: ValueKey(NewsCubit.get(context).currentIndex),
          ),
        );
      },
    );
  }
}
