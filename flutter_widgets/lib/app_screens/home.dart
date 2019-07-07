import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Container(
            padding: EdgeInsets.only(left: 10.0, top: 40.0),
            alignment: Alignment.center,
            color: Colors.deepPurple,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Not so long",
                        style: TextStyle(
                            decoration: TextDecoration.none, fontSize: 25.0),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "This is supposed to be a longer text, so..",
                        style: TextStyle(
                            decoration: TextDecoration.none, fontSize: 25.0),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Not so long",
                        style: TextStyle(
                            decoration: TextDecoration.none, fontSize: 25.0),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "This is supposed to be a longer text, so..",
                        style: TextStyle(
                            decoration: TextDecoration.none, fontSize: 25.0),
                      ),
                    )
                  ],
                ),
                FlightImageAsset(),
                FlightBookButton(),
              ],
            )));
  }
}

class FlightImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage("images/flight.png");
    Image image = Image(image: assetImage);
    return Container(child: image);
  }
}

class FlightBookButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      width: 250,
      height: 50,
      child: RaisedButton(
          color: Colors.deepOrange,
          child: Text(
            "Book your flight",
            style: TextStyle(fontSize: 20.0),
          ),
          elevation: 5.0,
          onPressed: () {
            bookFlight(context);
          }),
    );
  }

  void bookFlight(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Flight booked seccessfully"),
      content: Text("Have a pleasant flight"),
    );
    
    showDialog(
        context: context,
        builder: (BuildContext context) => alertDialog
    );
  }
}
