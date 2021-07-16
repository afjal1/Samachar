import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:road_to_news/ad_state.dart';
import 'package:road_to_news/helper/data.dart';
import 'package:road_to_news/helper/news.dart';
import 'package:road_to_news/model/Article_model.dart';
import 'package:road_to_news/model/CategoryModel.dart';
import 'package:road_to_news/views/view_article.dart';
import 'package:road_to_news/views/mainDrawer.dart';
import 'news_category.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  BannerAd banner;

  bool _loading = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then(status){
      setState((){
        banner=BannerAd(
          adUnitId:adState.bannerAdUnitId,
          size: AdSize.banner,
          request: AdRequest(),




        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;

    setState(() {
      _loading = false;
    });
  }

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
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: <Widget>[
                      ///Categories

                      Container(
                          height: 70,
                          child: ListView.builder(
                            itemCount: categories.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return TileCategory(
                                imageUrl: categories[index].imageUrl,
                                categoryName: categories[index].categoryName,
                              );
                            },
                          )),

                      ///Blogs
                      Container(
                          key: UniqueKey(),
                          padding: EdgeInsets.only(top: 16),
                          child: Column(
                            children: [
                              Expanded(
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
                                    }),
                              ),
                              SizedBox(height: 50),
                            ],
                          ))
                    ],
                  )),
            ),
    );
  }
}

class TileCategory extends StatelessWidget {
  final String imageUrl, categoryName, desc, url, title;
  TileCategory(
      {@required this.imageUrl,
      @required this.categoryName,
      @required this.desc,
      @required this.title,
      @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewsCategory(
                    category: categoryName.toString().toLowerCase(),
                  )),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
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
    return GestureDetector(
      onTap: () {
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
          )),
    );
  }
}
