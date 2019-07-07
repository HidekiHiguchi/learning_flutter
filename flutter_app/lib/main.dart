import "package:flutter/material.dart";

import 'app_screens/first_screen.dart';

void main() => runApp(new MyFlutterApp());


class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: "My Flutter App",
        home: Scaffold(
          appBar: AppBar(title: Text("Main"),
              backgroundColor: Colors.black
          ),
          body: FirstScreen()
        )

    );
  }

}