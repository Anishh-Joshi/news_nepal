import 'dart:convert';

import 'package:news_nepal/Modals/article_modal.dart';
import 'package:http/http.dart' as Anish;

class News {
  List<ArticleModal> news = [] ;


  Future<void> getNews() async{
    String url ="http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=b1572f871e4e41a6acbec238f2bba5e5";
    var response = await Anish.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status']=='ok'){
      jsonData["articles"].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null) {
          ArticleModal articleModal = ArticleModal(
              author: element['author'],
              title: element['title'],
              descrip: element['description'],
              url: element['url'],
              urltoImage: element['urlToImage'],
              content: element['context']
          );
          news.add(articleModal);
        }
      });
    }
  }
}
