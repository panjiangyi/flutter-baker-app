import "package:flutter/material.dart";
import "store.dart";

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

  @override
  Widget build(BuildContext context) {
    BakerState state = store.getState();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: [
            RaisedButton(
              child: Text("button${(state.idx).toString()}"),
              onPressed: () {
                state.setState(() => {idx--});
              },
            ),
          ],
        ),
      ),
    );
  }
}
