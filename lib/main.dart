import "package:flutter/material.dart";
import 'package:flutter/semantics.dart';
import "2.dart";
import "3.dart" as good;

void main() {
  Test ins = Test();
  good.Test();
  ins.loggg();
  runApp(FavoriteWidget());
}

class EventCenter {
  Function setState;
  EventCenter(this.setState);
}

EventCenter eventCenter;

class FavoriteWidget extends StatefulWidget {
  @override
  MyApp createState() => MyApp("first app");
}

class MyApp extends State<FavoriteWidget> {
  String title = "default!!";
  MyApp(this.title);
  num idx = 1;

  @override
  Widget build(BuildContext context) {
    eventCenter = EventCenter(() => setState(() => {idx++}));
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: [MyButtonWithState(idx)],
        ),
      ),
    );
  }
}

class MyButtonWithState extends StatefulWidget {
  final num idx;
  MyButtonWithState(this.idx);
  @override
  MyButton createState() => MyButton(idx);
}

class MyButton extends State<MyButtonWithState> {
  final num idx;
  MyButton(this.idx);
  num innerIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          child: Text((innerIdx).toString()),
          onPressed: () {
            setState(() => {innerIdx--});
          },
        ),
        RaisedButton(
          child: Text((idx).toString()),
          onPressed: () {
            eventCenter.setState();
          },
        ),
      ],
    );
  }
}
