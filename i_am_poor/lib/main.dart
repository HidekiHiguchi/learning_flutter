import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(title: "I'm poor", home: Poor()));
}

class Poor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PoorState();
  }
}

class PoorState extends State<Poor> {
  var url = [
    'https://pngimg.com/uploads/soviet_union/soviet_union_PNG31.png',
    'https://pngimg.com/uploads/anarchy/anarchy_PNG6.png'
  ];
  var i = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("I am poor"),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.yellowAccent,
      body: Center(
        child: Container(
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (i == 0) {
                  i = 1;
                } else {
                  i = 0;
                }
              });
            },
            child: Image(image: NetworkImage(url[i])),
          ),
        ),
      ),
    );
  }
}
