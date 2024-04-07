import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/cubits/news_cubit/news_cubit.dart';
import 'package:news_application/cubits/news_cubit/news_states.dart';
import 'package:news_application/widgets/article_items_builder.dart';

class SciencePage extends StatelessWidget {
  const SciencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      NewsCubit.get(context).getScienceNews();
      return BlocBuilder<NewsCubit, NewsAppStates>(
        builder: (context, state) {
          if (state is NewsGetScienceLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else if (state is NewsGetScienceErrorState) {
            return const Center(
              child: Text(
                'Error occurred while loading science news.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            );
          } else if (state is NewsGetScienceSuccessState) {
            var list = NewsCubit.get(context).scienceNewsList;
            return ArticleItemsBuilder(articleList: list);
          } else {
            return Container();
          }
        },
      );
    });
  }
}
