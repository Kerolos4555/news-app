import 'package:flutter/material.dart';
import 'package:news_application/cubits/news_cubit/news_cubit.dart';

class CustomBotNavBar extends StatelessWidget {
  const CustomBotNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: NewsCubit.get(context).currentIndex,
      onTap: (index) {
        NewsCubit.get(context).changeIndex(index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports),
          label: 'Sports',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.science),
          label: 'Science',
        ),
      ],
    );
  }
}
