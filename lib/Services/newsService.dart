import 'package:dio/dio.dart';

import '../models/articleModel.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<Articlemodel>> getGeneral({required String category}) async {
    try {
      var response = await dio.get(
          'https://gnews.io/api/v4/top-headlines?category=$category%20&lang=ar&country=eg&max=10&apikey=5ff816d5e910a9bda80be039e253304c');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<Articlemodel> articlesList = [];
      for (var article in articles) {
        Articlemodel articleModel = Articlemodel(
            image: article['image'],
            tittle: article['title'],
            subTittle: article['description'],
            url: article['url'],
        );
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
