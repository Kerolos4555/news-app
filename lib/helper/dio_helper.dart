import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_application/models/article_model.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<List<ArticleModel>> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    try {
      Response response = await dio.get(
        url,
        queryParameters: query,
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = response.data;
        List<dynamic> articles = jsonData['articles'];

        List<ArticleModel> articleList = [];
        for (var article in articles) {
          ArticleModel articleModel = ArticleModel.fromJson(article);
          articleList.add(articleModel);
        }
        return articleList;
      } else {
        debugPrint('Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      debugPrint('There was an error ${e.toString()}');
      return [];
    }
  }
}
