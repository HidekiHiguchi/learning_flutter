import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Exploring UI Widgets",
    home: Scaffold(
      appBar: AppBar(
        title: Text("long list"),
        backgroundColor: Colors.black,
      ),
      body: Container(child: getListView(), color: Colors.black87),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          debugPrint("FAB clicked");
        },
        child: Icon(Icons.add, color: Colors.amberAccent,),
        tooltip: "add one more item",
      ),
    ),
  ));
}

void showSnackBar(BuildContext context, String item) {
  var snackBar = SnackBar(
    content: Text(item),
    action: SnackBarAction(label: "UNDO", onPressed: () {
      debugPrint("Pressing undo");
    }),
  );

  Scaffold.of(context).showSnackBar(snackBar);
}

List<String> getListElements() {
  var items = List<String>.generate(1000, (counter) => "item $counter");
  return items;
}

Widget getListView() {
  var listItems = getListElements();

  var listView = ListView.builder(itemBuilder: (context, index) {
    var listTile;
    if (index == 666) {
      listTile = ListTile(
        onTap: () {showSnackBar(context,  "The darkside");},
        title: Text(
          "😈",
          style: TextStyle(fontSize: 100),
        ),
      );
    } else {
      listTile = ListTile(
        title: Text(listItems[index], style: TextStyle(color: Colors.deepPurple),),
        onTap: () {showSnackBar(context,  listItems[index]);},

      );
    }
    return listTile;
  });

  return listView;
}

//void main() {
//  runApp(MaterialApp(
//    title: "Exploring UI Widgets",
//    home: Scaffold(
//      appBar: AppBar(title: Text("Basic List View"),),
//      body: getListView(),
//    ),
//  ));
//}
//
//Widget getListView() {
//  var listView = ListView(
//    children: <Widget>[
//      ListTile(
//        leading: Icon(Icons.landscape),
//        title: Text("Landscape"),
//        subtitle: Text("Beautiful view"),
//        trailing: Icon(Icons.wb_sunny),
//      ),
//      ListTile(
//        leading: Icon(Icons.laptop_mac),
//        title: Text("Mac Sucks"),
//      ),
//      ListTile(
//        leading: Icon(Icons.laptop),
//        title: Text("Linux FTW"),
//        onTap: () {
//          debugPrint("Clicked");
//        },
//
//      )
//    ],
//  );
//
//
//  return listView;
//}
