import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/cubits/news_cubit/news_cubit.dart';
import 'package:news_application/cubits/news_cubit/news_states.dart';
import 'package:news_application/widgets/article_items_builder.dart';

class SportsPage extends StatelessWidget {
  const SportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsAppStates>(
      builder: (context, state) {
        if (NewsCubit.get(context).sportsNewsList.isNotEmpty) {
          return ArticleItemsBuilder(
            articleList: NewsCubit.get(context).sportsNewsList,
          );
        } else if (state is NewsGetSportsLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else if (state is NewsGetSportsErrorState) {
          return const Center(
            child: Text(
              'Error occurred while loading sports news.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          );
        } else {
          return const Center(
            child: Text(
              'There is no data.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          );
        }
      },
    );
  }
}
