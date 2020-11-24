import "package:flutter/material.dart";
import "package:localstorage/localstorage.dart";
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
    final LocalStorage storage = new LocalStorage('some_key');

    BakerState state = store.getState();
    return FutureBuilder(
      future: storage.ready,
      builder: (BuildContext context, snapshot) {
        // storage.setItem('key', "sdfsdf");
        String data = storage.getItem('key');
        print(data);
        return MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                title: Text(title),
              ),
              body: Container(
                color: Color.fromRGBO(255, 255, 255, 1),
                height: double.infinity,
                child: ListView(
                  children: ["蛋糕", "面包"].map((i) {
                    return Recipe(i.toString());
                  }).toList(),
                ),
              )),
        );
      },
    );
  }
}
