import 'package:flutter/material.dart';

void main() => runApp(MyApp());

var i = 0;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return MaterialApp(
      color: Colors.yellow,
      home: DefaultTabController(
        length: 4,
        child: new Scaffold(
          body: TabBarView(
            children: [
              new Container(child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    primaryColor: Colors.indigo,
                    accentColor: Colors.indigoAccent,
                    brightness: Brightness.dark),
                title: 'Simple Interest Calculator App',
                home: SIForm2(),
              )),
              new Container(child: SIForm(),),
              new Container(child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    primaryColor: Colors.indigo,
                    accentColor: Colors.indigoAccent,
                    brightness: Brightness.dark),
                title: 'Simple Interest Calculator App',
                home: SIForm(),
              )),
              new Container(
                color: Colors.red,
              ),
            ],
          ),
          bottomNavigationBar: new TabBar(
            tabs: [
              Tab(
                icon: new Icon(Icons.home),
              ),
              Tab(
                icon: new Icon(Icons.rss_feed),
              ),
              Tab(
                icon: new Icon(Icons.perm_identity),
              ),
              Tab(icon: new Icon(Icons.settings),)
            ],
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.red,
          ),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
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



class SIForm2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SIFormState2();
  }
}

class _SIFormState2 extends State<SIForm2> {
  var _currencies = ['Reais', 'Dollars', 'Euros'];

  var _currentItemSelected = "Reais";

  var _formKey = GlobalKey<FormState>();

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  var displayResult = '';

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Simple Interest Calculator'),
      ),
      body: Form(
          key: _formKey,
          // margin: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: <Widget>[
                Center(child: getImageAsset()),
                Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    child: TextFormField(
                      controller: principalController,
                      validator: (String value) {
                        if(value.isEmpty) {
                          return 'Please enter principal value';
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.yellowAccent, fontSize: 20),
                          labelText: 'Principal',
                          hintText: 'Enter principal e.g 12000',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      controller: roiController,
                      validator: (String value) {
                        if(value.isEmpty) {
                          return 'Please enter the rate';
                        }
                      },
                      //style: textStyle,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.yellowAccent, fontSize: 20),
                          labelText: 'Rate of interest',
                          hintText: 'In percent',
                          //labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            controller: termController,
                            validator: (String value) {
                              if(value.isEmpty) {
                                return 'Please enter the term in years';
                              }
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                errorStyle: TextStyle(color: Colors.yellowAccent, fontSize: 20),
                                labelText: 'Term',
                                hintText: 'Time in years',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                        Container(
                          width: 50,
                        ),
                        Expanded(
                            child: DropdownButton<String>(
                              items: _currencies.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              value: _currentItemSelected,
                              onChanged: (String newValueSelected) {
                                _onDropDownItemSelected(newValueSelected);
                              },
                            ))
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                              child: Text("Calculate"),
                              onPressed: () {
                                setState(() {
                                  if(_formKey.currentState.validate()) {
                                    this.displayResult = _calculateTotalReturns();
                                  }
                                });
                              }),
                        ),
                        Container(
                          width: 30,
                        ),
                        Expanded(
                          child: RaisedButton(
                              color: Colors.black54,
                              child: Text("Reset"),
                              onPressed: () {
                                _resetAllValues();
                              }),
                        )
                      ],
                    )),
                Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        displayResult,
                        style: TextStyle(fontSize: 20),
                      ),
                    ))
              ],
            ),
          )),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/money.png');
    Image image = Image(
      image: assetImage,
      width: 125,
      height: 125,
    );

    return Container(
      child: image,
      margin: EdgeInsets.all(50.0),
    );
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;

    String result =
        'After $term years, your investment will be worth $totalAmountPayable $_currentItemSelected';

    return result;
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  void _resetAllValues() {
    principalController.text = '';
    roiController.text = '';
    termController.text = '';

    setState(() {
      displayResult = '';
    });
  }
}

