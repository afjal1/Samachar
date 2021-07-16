import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:road_to_news/helper/news.dart';
import 'package:road_to_news/model/Article_model.dart';
import 'package:road_to_news/views/view_article.dart';

import 'mainDrawer.dart';

class NewsCategory extends StatefulWidget {
  final String category;
  NewsCategory({this.category});
  @override
  _NewsCategoryState createState() => _NewsCategoryState();
}

class _NewsCategoryState extends State<NewsCategory> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("SAMA", style: TextStyle(color: Colors.red)),
            Text(
              "CHAR",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.save),
            ),
          )
        ],
      ),
      drawer: Sidenav(),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 16),
                child: Column(
                  children: <Widget>[
                    ///Blogs
                    Container(
                        key: UniqueKey(),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: ListView.builder(
                            itemCount: articles.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return BlogContent(
                                imageUrl: articles[index].urlToImage,
                                title: articles[index].title,
                                desc: articles[index].description,
                                url: articles[index].url,
                              );
                            }))
                  ],
                ),
              ),
            ),
    );
  }
}

class BlogContent extends StatelessWidget {
  final String imageUrl, title, desc, url;
  BlogContent(
      {@required this.imageUrl,
      @required this.title,
      @required this.desc,
      @required this.url});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          print("this is selected");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ViewArticle(
                        blogUrl: url,
                      )));
        },
        child: Container(
            margin: EdgeInsets.only(bottom: 16),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(imageUrl)),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(desc, style: TextStyle(color: Colors.black54)),
                ],
              ),
            )));
  }
}
