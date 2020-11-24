import "package:flutter/material.dart";
import "./recipe-detail.dart";

class Recipe extends StatelessWidget {
  final String name;
  Recipe(this.name);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return RecipeDetail(name);
          }),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom:
                BorderSide(width: 1.0, color: Color.fromRGBO(225, 225, 225, 1)),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Text(name),
      ),
    );
  }
}
