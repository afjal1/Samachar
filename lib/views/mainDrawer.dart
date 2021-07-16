import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:road_to_news/Social/login.dart';
import 'package:road_to_news/Social/profile.dart';
import 'package:road_to_news/authentication/auth_service.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:road_to_news/Social/Facebook.dart';
import 'package:road_to_news/Social/Google.dart';

class Sidenav extends StatelessWidget {
  String profilepic;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.blue,
            child: Center(
                child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 30, bottom: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(this.profilepic), fit: BoxFit.fill),
                  ),
                ),
                Text('Afjal',
                    style: TextStyle(fontSize: 22, color: Colors.white)),
                Text('afjalru@gmail.com',
                    style: TextStyle(color: Colors.white)),
              ],
            ))),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Profile',
              style: TextStyle(
                fontSize: 18,
              )),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Setting',
              style: TextStyle(
                fontSize: 18,
              )),
          onTap: null,
        ),
        ListTile(
          leading: Icon(Icons.arrow_back),
          title: Text('Logout',
              style: TextStyle(
                fontSize: 18,
              )),
          onTap: null,
        ),
      ],
    ));
  }
}
