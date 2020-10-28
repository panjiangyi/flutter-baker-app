import "package:flutter/material.dart";

void main() {
  runApp(MyApp(title: "title11!!"));
}

class MyApp extends StatelessWidget {
  String title = "default!!";
  MyApp({String title});
  Widget build(BuildContext context) {
    return MaterialApp(home: Text(title));
  }
}
