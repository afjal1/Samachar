import 'package:flutter/material.dart';
import 'package:road_to_news/Social/login.dart';
import 'package:road_to_news/Social/Google.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  String profilepic;
  String name;
  String email;

  Profile(this.profilepic, this.name, this.email);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(this.profilepic),
              radius: 75.0,
            ),
            SizedBox(
              height: 30.0,
            ),
            Text("NAME:", style: TextStyle(fontSize: 15.0)),
            SizedBox(
              height: 5.0,
            ),
            Text(this.name, style: TextStyle(fontSize: 25.0)),
            SizedBox(height: 20.0),
            Text("EMAIL ID:", style: TextStyle(fontSize: 15.0)),
            SizedBox(
              height: 5.0,
            ),
            Text(this.email, style: TextStyle(fontSize: 20.0)),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Colors.blueGrey,
                padding: EdgeInsets.all(15),
                child: Text(
                  "Log Out",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Login()));
                  if (AuthBlocGoogle().currentUser != null) {
                    AuthBlocGoogle().logout();
                  }
                })
          ],
        ),
      ),
    );
  }
}
