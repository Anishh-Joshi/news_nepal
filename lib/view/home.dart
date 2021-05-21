import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_nepal/Modals/article_modal.dart';
import 'package:news_nepal/Modals/category.dart';
import 'package:news_nepal/helper/deata.dart';
import 'package:news_nepal/helper/news.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories= new List<CategoryModel>();
  List<ArticleModal> articles = new List<ArticleModal>();
  bool _loading = true;

  @override
  void initState(){
    super.initState();
    categories=getCategories();
    getNews();

  }
  getNews ()async{
    News newsObject = News();
    await newsObject.getNews();
    articles = newsObject.news;
    setState(() {
      _loading=false;

    });

  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("News", style: TextStyle(
              color: Colors.redAccent,
            ),),
            Text(" Nepal", style: TextStyle(
              color: Colors.blueAccent,
            ),)
          ],
        ),
        elevation: 1.0,
      ),
      body:_loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) :SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              /////////////////  Categories in here
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                height: 70,
                child: ListView.builder(
                    itemCount:categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return slide(
                        imageUrl: categories[index].imageUrl,
                        categoryName: categories[index].categoryName,
                      );
                    }),
              ),
              /// Blogs in here
              Container(
                padding: EdgeInsets.symmetric(horizontal:5),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                  itemCount: articles.length,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                    return BlogTile(
                        imageUrl: articles[index].urltoImage,
                        title: articles[index].title,
                        desc: articles[index].descrip,
                    );
                    }),
              ),

            ],

          ),

        ),
      ),

    );
  }
}
class slide extends StatelessWidget {
  final imageUrl, categoryName;

  slide({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Stack(
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(8),
                child:
                CachedNetworkImage(imageUrl: imageUrl, width: 120,height: 60, fit: BoxFit.cover,)),
            Container(
              alignment: Alignment.center,
              width: 120,height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black26,
              ),

              child:
              Text(categoryName,style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final imageUrl,title,desc;
  BlogTile({ @required this.imageUrl,@required this.title,@required this.desc});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        child: Column(
          children: [

            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(imageUrl)),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 2, 6, 2),
              child: Text(title,style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            ),
            SizedBox(
              height:3,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 2, 12, 10),
              child: Text(desc,style:TextStyle(
                color: Colors.white,
              ),),
            ),
            Padding(padding: EdgeInsets.only(top: 10))
          ],
        ),
      ),
    );
  }
}
class viewarticle extends StatefulWidget {
  final url;

  const viewarticle({Key key, this.url}) : super(key: key);
  @override
  _viewarticleState createState() => _viewarticleState();
}

class _viewarticleState extends State<viewarticle> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(

      ),
    );
  }
}



