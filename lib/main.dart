import 'package:flutter/material.dart';
import 'package:news_nepal/view/home.dart';


void main() {
  runApp(News());
}
class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top News',
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Home(),
    );
  }
}
