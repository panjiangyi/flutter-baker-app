import "package:flutter/material.dart";

class Recipe extends StatelessWidget {
  final String name;
  Recipe(this.name);
  @override
  Widget build(BuildContext context) {
    return Text(name);
  }
}
