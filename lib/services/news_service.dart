import 'package:dio/dio.dart';
import 'package:news_app/models/artticles_model.dart';

class NewsService {
  final dio = Dio();
  Future<List<ArtticlesModel>> getNews({required String categoryName}) async {
    try {
      final Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=660972e7a0c249b0b2fa51fe054a41dc&category=$categoryName');
      Map<String, dynamic> data = response.data;

      List<dynamic> articlesData = data['articles'];

      List<ArtticlesModel> articles = [];
      for (int i = 0; i < articlesData.length; i++) {
        articles.add(
          ArtticlesModel.fromJson(
            articlesData[i],
          ),
        );
      }

      return articles;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
