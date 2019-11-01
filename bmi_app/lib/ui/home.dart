import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BMI();
  }
}

class BMI extends State<Home> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double inches = 0.0;
  double result=0.0;
  String finalResult;
  String level;

  /*
  below 18.5 underweight
  18.5-24.9 normal
  25.0-29.0 overweight
  30.0 and above obses
     */
  void calculateBMI() {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      double weight = double.parse(_weightController.text);
      inches = height * 12;

      if ((_ageController.text.isNotEmpty || age > 0) &&
          (_heightController.text.isNotEmpty || inches > 0) &&
          (_weightController.text.isNotEmpty || weight > 0)) {
        result=weight/(inches*inches)*703;
        finalResult=result.toStringAsFixed(2);//our BMI
      }
      if (double.parse(finalResult )< 18.5)
        {
          level='UnderWeight';
        }
      else if(double.parse(finalResult)>18.5 && double.parse(finalResult)<24.9)
        {
          level='Normal';
        }
      else if (double.parse(finalResult)>25.0&&double.parse(finalResult)<29.00)
        {
          level='OverWeight';
        }
      else
        level='obses';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            new Image.asset(
              'images/bmiApple.jpg',
              width: 100.0,
              height: 120.0,
            ),
            new Padding(
              padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
            ),
            new Container(
              height: 250.0,
              color: Colors.grey.shade200,
              margin: EdgeInsets.all(10.0),
              child: ListView(
                children: <Widget>[
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Age",
                      hintText: "e.g 30",
                      icon: Icon(Icons.person_outline),
                    ),
                  ),
                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Height in feet",
                      hintText: "e.g 3.6",
                      icon: Icon(Icons.assessment),
                    ),
                  ),
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Weight in LB",
                      hintText: "e.g 180",
                      icon: Icon(Icons.assignment),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                  ),
                  new Container(
                    alignment: Alignment.center,
                    child: new RaisedButton(
                      onPressed: calculateBMI,
                      color: Colors.pinkAccent,
                      child: Text(
                        "Calculate",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0)),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Your BMI :$finalResult",
                  style: TextStyle(fontSize: 18.0, color: Colors.blue),
                ),
                new Text(
                  "$level",
                  style: TextStyle(fontSize: 18.0, color: Colors.blue),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
