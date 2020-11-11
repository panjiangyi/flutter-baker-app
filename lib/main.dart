import "package:flutter/material.dart";
import "2.dart";
import "3.dart" as good;

void main() {
  Test ins = Test();
  good.Test();
  ins.loggg();
  runApp(MyApp("first app"));
}

class MyApp extends StatelessWidget {
  String title = "default!!";
  MyApp(this.title);

  @override
  Widget build(BuildContext context) {
    final questions = ["111211ddddffuckdd1", "dfdfdfdfs"];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: questions
              .map((e) => RaisedButton(
                    child: Text(e.toString()),
                    onPressed: null,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
