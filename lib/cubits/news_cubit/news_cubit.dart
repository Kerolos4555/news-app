import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/cubits/news_cubit/news_states.dart';
import 'package:news_application/helper/cache_helper.dart';
import 'package:news_application/helper/dio_helper.dart';
import 'package:news_application/models/article_model.dart';
import 'package:news_application/pages/business_page.dart';
import 'package:news_application/pages/science_page.dart';
import 'package:news_application/pages/sports_page.dart';

class NewsCubit extends Cubit<NewsAppStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> pages = const [
    BusinessPage(),
    SportsPage(),
    SciencePage(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(NewsNavBarState());
  }

  List<ArticleModel> businessNewsList = [];
  List<ArticleModel> sportsNewsList = [];
  List<ArticleModel> scienceNewsList = [];
  List<ArticleModel> searchNewsList = [];

  Future<void> getBusinessNews() async {
    emit(NewsGetBusinessLoadingState());
    try {
      businessNewsList = await DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'business',
          'apiKey': 'c338c3ea61074394bc9205fe65f516cc',
        },
      );
      emit(NewsGetBusinessSuccessState());
    } catch (error) {
      debugPrint('Error ${error.toString()}');
      emit(NewsGetBusinessErrorState());
    }
  }

  Future<void> getSportsNews() async {
    emit(NewsGetSportsLoadingState());
    try {
      sportsNewsList = await DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sports',
          'apiKey': 'c338c3ea61074394bc9205fe65f516cc',
        },
      );
      emit(NewsGetSportsSuccessState());
    } catch (error) {
      debugPrint('Error ${error.toString()}');
      emit(NewsGetSportsErrorState());
    }
  }

  Future<void> getScienceNews() async {
    emit(NewsGetScienceLoadingState());
    try {
      scienceNewsList = await DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': 'c338c3ea61074394bc9205fe65f516cc',
        },
      );
      emit(NewsGetScienceSuccessState());
    } catch (error) {
      debugPrint('Error ${error.toString()}');
      emit(NewsGetScienceErrorState());
    }
  }

  Future<void> getSearchNews(String value) async {
    emit(NewsGetSearchLoadingState());
    try {
      searchNewsList = await DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': value,
          'apiKey': 'c338c3ea61074394bc9205fe65f516cc',
        },
      );
      emit(NewsGetSearchSuccessState());
    } catch (error) {
      debugPrint('Error ${error.toString()}');
      emit(NewsGetSearchErrorState());
    }
  }

  bool isDark = false;

  ThemeMode getThemeMode() {
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void changeThemeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ThemeModeState());
    } else {
      isDark = !isDark;
      ChacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(ThemeModeState());
      });
    }
  }
}
