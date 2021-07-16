import 'package:flutter/material.dart'
    show
        BuildContext,
        Colors,
        MaterialApp,
        StatelessWidget,
        ThemeData,
        Widget,
        WidgetsFlutterBinding,
        runApp;
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:road_to_news/ad_state.dart';
import 'package:road_to_news/views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  runApp(Provider.value(
    value: adState,
    builder: (context,child) =>MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Home(),
    );
  }
}
