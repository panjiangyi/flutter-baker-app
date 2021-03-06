import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter/foundation.dart';
import "2.dart";
import "3.dart" as good;
import 'package:flutter/services.dart' show rootBundle;

void main() {
  Test ins = Test();
  good.Test();
  ins.loggg();
  runApp(ParentWidget());
  // loadAsset();
  loadImage();
}

void loadAsset() async {
  var result =
      jsonDecode(await rootBundle.loadString('lib/assets/config.json'));
  print(result["a"]);
}

void loadImage() async {
  var result = AssetImage('lib/assets/Jietu20201110-101343.jpg');
  print(result);
}
//---------------------------- ParentWidget ----------------------------

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//----------------------------- TapboxC ------------------------------

class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  Widget build(BuildContext context) {
    // This example adds a green border on tap down.
    // On tap up, the square changes to the opposite state.
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GestureDetector(
        onTapDown: _handleTapDown, // Handle the tap events in the order that
        onTapUp: _handleTapUp, // they occur: down, up, tap, cancel
        onTap: _handleTap,
        onTapCancel: _handleTapCancel,
        child: Container(
          child: Center(
            child: Text(widget.active ? 'Active' : 'Inactive',
                style: TextStyle(fontSize: 32.0, color: Colors.white)),
          ),
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border: _highlight
                ? Border.all(
                    color: Colors.teal[700],
                    width: 10.0,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
