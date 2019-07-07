import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
        brightness: Brightness.dark),
    title: 'Simple Interest Calculator App',
    home: SIForm(),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
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
