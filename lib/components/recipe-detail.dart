import "package:flutter/material.dart";

class RecipeDetail extends StatelessWidget {
  final String title;
  RecipeDetail(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: FlatButton(
          child: Text(title),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
