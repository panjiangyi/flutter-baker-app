import "package:flutter/material.dart";

void main() {
  runApp(MyApp("first app"));
}

class MyApp extends StatelessWidget {
  String title = "default!!";
  MyApp(this.title);

  @override
  Widget build(BuildContext context) {
    final questions = ["1112dd1", "dfdfdfdfs"];
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
