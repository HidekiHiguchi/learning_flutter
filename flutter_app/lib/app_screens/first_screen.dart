import 'dart:math';

import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Center(
          child: Text("The number of the devil is ${generateLuckyNumber()}",
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.red, fontSize: 40.0) ,
          )
      ),
    );
  }

  int generateLuckyNumber() {
    var random = Random();
    int luckyNumber = random.nextInt(10);

    return luckyNumber;
  }

}