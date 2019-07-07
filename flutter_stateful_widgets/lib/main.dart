import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(
    title: "Stateful app sample",
    home: FavoriteCity(),
  ));
}

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavoriteCityState();
  }
}

class _FavoriteCityState extends State<StatefulWidget> {
  String cityName = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful app example"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (String userInput) {
                setState(() {
                  cityName = userInput;
                });
              },
            ),
            Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "Your city is $cityName",
                  style: TextStyle(fontSize: 20.0),
                ))
          ],
        ),
      ),
    );
  }
}
