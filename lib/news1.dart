import 'dart:convert';

import 'package:exebit21_covid/ConnectivityCheck.dart';
import 'package:exebit21_covid/blog/home.dart';
import 'package:exebit21_covid/values/colors.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:page_transition/page_transition.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:exebit21_covid/Description.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:exebit21_covid/news_widget/news.dart';
import 'package:exebit21_covid/statistics_widget/statistics_widget.dart';

class Covid {
  int confvalue;
  int recvalue;
  int deaths;
  String lastupdate;

  Covid({
    this.confvalue,
    this.recvalue,
    this.deaths,
    this.lastupdate
  });

  factory Covid.fromJson(Map < dynamic, dynamic > json) {
    return Covid(
        confvalue: json['confirmed']['value'] as int,
        recvalue: json['recovered']['value'] as int,
        deaths: json['deaths']['value'] as int,
        lastupdate: json['lastUpdate'] as String);
  }
}
class News {
  String author;
  String title;
  String description;
  String url;
  String publishedAt;
  String sourcename;
  String launchurl;

  News({this.author, this.title, this.description, this.url, this.publishedAt,this.sourcename,this.launchurl});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        author: json['author'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        url: json['urlToImage'] as String,
        publishedAt: json['publishedAt'] as String,
        sourcename:json['source']['name']as String,
        launchurl:json['url'] as String
    );

  }
}

String api =
    "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=3915715457b64f29bc09a4e94d80d8f5";

class News_Feed extends StatefulWidget {
  @override
  _News_FeedState createState() => _News_FeedState();
}

class _News_FeedState extends State<News_Feed> {
  @override

  void initState() {
    super.initState();
    CheckConnectivity.isConnected().then((isConnected) {
      if (!isConnected) {
        CheckConnectivity.showInternetDialog(context);
      }
    });
    refreshList();
  }

  bool loading = false;

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  List<News> ls_news;
  Future<List<News>> getNews() async {
    final response = await http.get(Uri.parse(api));
    final res = jsonDecode(response.body);
    return (res["articles"] as List)
        .map<News>((json) => new News.fromJson(json))
        .toList();
  }

  Future<Null> refreshList() async {
    if(this.mounted){
      setState(() {
        loading = true;
      });
    }
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));

    // setState(() async {
    // //  list = List.generate(random.nextInt(10), (i) => "Item $i");

    // });
    ls_news = await getNews();
    if(this.mounted){
      setState(() {
        loading = false;
      });
    }

    //    List<News> ls=await  getNews();
    //  NewsList(news:ls);

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: FloatingNavbar(
            backgroundColor: Color.fromARGB(255, 109, 111, 197),
            width: 250,
            elevation: 0,
            borderRadius: 100.0,
            iconSize: 25,
            itemBorderRadius: 100,
            onTap: (int val) {
              if (val == 2) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => StatisticsWidget()));
              }
              else if(val==0){
                Navigator.push(context, MaterialPageRoute(builder: (context) => news()));
              }
              else if(val==3){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              }
              //else if (val==4){
              //  Navigator.push(context, MaterialPageRoute(builder: (context) => Maps()));
            //  }
            },

              currentIndex: 1,
            items: [
              FloatingNavbarItem(icon: Icons.poll_outlined,),
              FloatingNavbarItem(icon: Icons.copy_rounded, title: 'News'),
              FloatingNavbarItem(icon: Icons.local_hospital_outlined, ),
              FloatingNavbarItem(icon: Icons.mark_chat_read_outlined, ),
            ],
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.only(top:10.0),
          child: RefreshIndicator(
            child: loading
                ? Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryBackground)),
            )
                : ListView.builder(
              itemCount: ls_news == null ? 0 : ls_news.length,
              padding: new EdgeInsets.all(8.0),
              itemBuilder: (BuildContext context, int index) {
                return new GestureDetector(
                  child: new Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    elevation: 1.7,
                    child: new Padding(
                      padding: new EdgeInsets.all(10.0),
                      child: new Column(
                        children: [
                          new Row(
                            children: <Widget>[
                              new Padding(
                                padding: new EdgeInsets.only(left: 4.0),
                                child: new Text(
                                  timeago.format(DateTime.parse(
                                      ls_news[index].publishedAt.toString())),
                                  style: new TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                              new Padding(
                                padding: new EdgeInsets.all(5.0),
                                child: new Text(
                                  ls_news[index].sourcename != null
                                      ? ls_news[index].sourcename
                                      : "NDTV",
                                  style: new TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          new Row(
                            children: [
                              new Expanded(
                                child: new GestureDetector(
                                  child: new Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      new Padding(
                                        padding: new EdgeInsets.only(
                                            left: 4.0,
                                            right: 8.0,
                                            bottom: 8.0,
                                            top: 8.0),
                                        child: new Text(
                                          ls_news[index].title.toString() != null
                                              ? ls_news[index].title.toString()
                                              : "Corona Virus",
                                          style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      new Padding(
                                        padding: new EdgeInsets.only(
                                            left: 4.0,
                                            right: 4.0,
                                            bottom: 4.0),
                                        child: new Text(
                                          ls_news[index].description != null
                                              ? ls_news[index].description
                                              : "",
                                          style: new TextStyle(
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    // flutterWebviewPlugin.launch(
                                    //     data["articles"][index]["url"],
                                    //     fullScreen: false);
                                    Navigator.push(context, PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: DescriptionPage(
                                            ls_news[index].launchurl
                                                .toString())));
                                  },
                                ),
                              ),
                              new Column(
                                children: <Widget>[
                                  new Padding(
                                    padding: new EdgeInsets.only(top: 8.0),
                                    child: new SizedBox(
                                      height: 100.0,
                                      width: 100.0,
                                      child: new Image.network(
                                        ls_news[index].url != null
                                            ? ls_news[index].url
                                            : "https://image.shutterstock.com/image-vector/illustration-flat-icon-tv-channel-260nw-482689633.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  // new Row(
                                  //   children: <Widget>[
                                  //     new GestureDetector(
                                  //       child: new Padding(
                                  //           padding:
                                  //               new EdgeInsets.symmetric(
                                  //                   vertical: 10.0,
                                  //                   horizontal: 5.0),
                                  //           child: buildButtonColumn(
                                  //               Icons.share)),
                                  //       onTap: () {
                                  //         // share(data["articles"][index]
                                  //         //     ["url"]);
                                  //       },
                                  //     ),
                                  //     new GestureDetector(
                                  //       child: new Padding(
                                  //           padding:
                                  //               new EdgeInsets.all(5.0),
                                  //           child: _hasArticle(
                                  //                   data["articles"][index])
                                  //               ? buildButtonColumn(
                                  //                   Icons.bookmark)
                                  //               : buildButtonColumn(
                                  //                   Icons.bookmark_border)),
                                  //       onTap: () {
                                  //         _onBookmarkTap(
                                  //             data["articles"][index]);
                                  //       },
                                  //     ),
                                  //   ],
                                  // )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            onRefresh: refreshList,
          ),
        ));
  }}