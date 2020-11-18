import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter/semantics.dart';
import "2.dart";
import "3.dart" as good;
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(FavoriteWidget());
}

//---------------------------- ParentWidget ----------------------------
var outerIdxState;

class FavoriteWidget extends StatefulWidget {
  @override
  MyApp createState() {
    outerIdxState = MyApp("first app");
    return outerIdxState;
  }
}

class MyApp extends State<FavoriteWidget> {
  String title = "default!!";
  MyApp(this.title);
  num idx = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: [
            RaisedButton(
              child: Text("original11 button${(idx).toString()}"),
              onPressed: () {
                setState(() => {idx--});
              },
            ),
          ],
        ),
      ),
    );
  }
}
