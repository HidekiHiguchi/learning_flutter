import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Incrementer', home: SIForm()));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var i = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text('App for numeric incrementation'),
        ),
        body: Container(
          child: ListView(children: <Widget>[
            Text(i.toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 100),),
            Padding(padding: EdgeInsets.only(bottom: 200),),
            RaisedButton(
                shape: CircleBorder(),
                color: Colors.blue,
                textColor: Colors.white,
                child: Text(
                  '+',
                  style: TextStyle(fontSize: 150),
                ),
                onPressed: () {
                  setState(() {
                    i++;
                  });
                }),
          ]),
        ));
  }
}
