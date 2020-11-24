import "package:flutter/material.dart";
import "store.dart";
import "./components/recipe.dart";
import "./components/num-selector.dart";

BakerState appState;
void main() {
  runApp(Baker());
}

class Baker extends StatefulWidget {
  @override
  BakerState createState() => store.init(BakerState());
}

class BakerState extends State<Baker> {
  String title = "烘焙面包计算器";
  num idx = 1;
  void value(String v) {
    setState(() {
      title = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    BakerState state = store.getState();
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("$title success!"),
          ),
          body: Container(
            color: Color.fromRGBO(125, 125, 125, 1),
            height: double.infinity,
            child: ListView(
              children: ["蛋糕", "面包"].map((i) {
                return Recipe(i.toString());
              }).toList(),
            ),
          )),
    );
  }
}
