import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class RecipeDetail extends StatelessWidget {
  final String title;
  RecipeDetail(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
          children: ["蛋糕", "面包"].map((i) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text("$i："),
            ),
            Expanded(
                child: new TextField(
              decoration: new InputDecoration(labelText: "输入百分比"),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
            )),
          ],
        );
      }).toList()),
    );
  }
}
