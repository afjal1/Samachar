import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'mainDrawer.dart';

class ViewArticle extends StatefulWidget {
  final String blogUrl;
  ViewArticle({this.blogUrl});
  @override
  _ViewArticleState createState() => _ViewArticleState();
}

class _ViewArticleState extends State<ViewArticle> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
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
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WebView(
              initialUrl: widget.blogUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: ((WebViewController WebViewController) {
                _completer.complete(WebViewController);
              }),
            )));
  }
}
