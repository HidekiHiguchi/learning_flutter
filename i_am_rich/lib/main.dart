import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "I'm rich!",
    home: Scaffold(
      appBar: AppBar(
        title: Text("I Am rich"),
        backgroundColor: Colors.blueGrey[900],
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Image(
          image: AssetImage('assets/diamond.png'),
        ),
      ),
    ),
  ));
}
