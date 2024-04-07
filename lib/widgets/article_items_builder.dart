import 'package:flutter/material.dart';
import 'package:news_application/models/article_model.dart';
import 'package:news_application/widgets/article_item.dart';

class ArticleItemsBuilder extends StatelessWidget {
  final List<ArticleModel> articleList;
  const ArticleItemsBuilder({super.key, required this.articleList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ArticleItem(
          article: articleList[index],
        );
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey,
          ),
        );
      },
      itemCount: articleList.length,
    );
  }
}
