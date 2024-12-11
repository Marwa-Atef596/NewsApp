import 'package:dio/dio.dart';
import 'package:news_app/model/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=6acc1e7bd14f4805aaf8dd45715c08f4&category=$category');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articleList = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromjson(article);
        articleList.add(articleModel);
      }

      return articleList;
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      return [];
    }
  }
}
