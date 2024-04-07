import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/cubits/news_cubit/news_cubit.dart';
import 'package:news_application/cubits/news_cubit/news_states.dart';
import 'package:news_application/widgets/article_items_builder.dart';
import 'package:news_application/widgets/custom_text_form_field.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomTextFormField(
              labelText: 'seraching',
              hintText: 'search',
              icon: Icons.search,
              onChange: (value) {
                NewsCubit.get(context).getSearchNews(value);
              },
            ),
          ),
          BlocBuilder<NewsCubit, NewsAppStates>(
            builder: (context, state) {
              if (state is NewsGetSearchSuccessState) {
                var list = NewsCubit.get(context).searchNewsList;
                return Expanded(
                  child: ArticleItemsBuilder(
                    articleList: list,
                  ),
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }
}
