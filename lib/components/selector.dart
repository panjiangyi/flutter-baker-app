import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';

class Selector extends StatefulWidget {
  @override
  _SelectorState createState() => _SelectorState();
}

List<String> _meals = [
  "Breakfast1",
  "Breakfast2",
  "Lunch1",
  "Lunch2",
  "Dinner1",
  "Dinner2",
];

class _SelectorState extends State<Selector> {
  List<String> _food = ["Chicken", "Pork", "Vegetables", "Cheese", "Bread"];

  List<String> _foodVariants = [
    "Chicken grilled",
    "Pork grilled",
    "Vegetables as is",
    "Cheese as is",
    "Bread tasty"
  ];

  List<String> _portionSize = [
    "Small portion",
    "Medium portion",
    "Large portion",
    "Huge portion"
  ];

  List<String> _numbers = ["1.0", "2.0", "3.0", "4.0", "5.0", "6.0", "7.0"];

  int selectedFoodVariants = 0;
  int selectedPortionCounts = 0;
  int selectedPortionSize = 0;

  DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Text(value);
        });
  }

  _getDslDecoration() {
    return BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Colors.black12),
        top: BorderSide(width: 1, color: Colors.black12),
      ),
    );
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final appBar = PreferredSize(
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(246, 247, 249, 1),
              border: BorderDirectional(
                  bottom: BorderSide(width: 1, color: Colors.black12))),
          child: Padding(
              padding: EdgeInsets.only(left: 16, bottom: 24),
              child: Column(
                  verticalDirection: VerticalDirection.up,
                  children: <Widget>[
                    Container(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text("Add Food",
                            style: TextStyle(
                                fontSize: 26,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))),
                    Container(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text("Journal",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold)))
                  ])),
        ),
        preferredSize: Size.fromHeight(90));

    return Scaffold(
      appBar: appBar,
      key: scaffoldKey,
      body: DirectSelectContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                              child: Padding(
                                  child: DirectSelectList<String>(
                                      onUserTappedListener: () {
                                        _showScaffold();
                                      },
                                      values: _numbers,
                                      defaultItemIndex: selectedPortionCounts,
                                      itemBuilder: (String value) =>
                                          getDropDownMenuItem(value),
                                      focusedItemDecoration:
                                          _getDslDecoration(),
                                      onItemSelectedListener:
                                          (item, index, context) {
                                        setState(() {
                                          selectedPortionCounts = index;
                                        });
                                      }),
                                  padding: EdgeInsets.only(left: 22))),
                        ],
                      )),
                  // Expanded(
                  //     flex: 8,
                  //     child: Container(
                  //       decoration: _getShadowDecoration(),
                  //       child: Card(
                  //           child: Row(
                  //         mainAxisSize: MainAxisSize.max,
                  //         children: <Widget>[
                  //           Expanded(
                  //               child: Padding(
                  //                   child: DirectSelectList<String>(
                  //                       values: _portionSize,
                  //                       defaultItemIndex: selectedPortionSize,
                  //                       itemBuilder: (String value) =>
                  //                           getDropDownMenuItem(value),
                  //                       focusedItemDecoration:
                  //                           _getDslDecoration(),
                  //                       onItemSelectedListener:
                  //                           (item, index, context) {
                  //                         setState(() {
                  //                           selectedPortionSize = index;
                  //                         });
                  //                       }),
                  //                   padding: EdgeInsets.only(left: 22))),
                  //           Padding(
                  //             padding: EdgeInsets.only(right: 8),
                  //             child: _getDropdownIcon(),
                  //           )
                  //         ],
                  //       )),
                  //     )),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showScaffold() {
    final snackBar = SnackBar(content: Text('Hold and drag instead of tap'));
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Icon _getDropdownIcon() {
    return Icon(
      Icons.unfold_more,
      color: Colors.blueAccent,
    );
  }

  BoxDecoration _getShadowDecoration() {
    return BoxDecoration(
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black.withOpacity(0.06),
          spreadRadius: 4,
          offset: new Offset(0.0, 0.0),
          blurRadius: 15.0,
        ),
      ],
    );
  }
}

class MealSelector extends StatelessWidget {
  final buttonPadding = const EdgeInsets.fromLTRB(0, 8, 0, 0);

  final List<String> data;
  final String label;

  MealSelector({@required this.data, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: AlignmentDirectional.centerStart,
            margin: EdgeInsets.only(left: 4),
            child: Text(label)),
        Padding(
          padding: buttonPadding,
          child: Container(
            decoration: _getShadowDecoration(),
            child: Card(
                child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                    child: Padding(
                        child: DirectSelectList<String>(
                          values: data,
                          defaultItemIndex: 0,
                          itemBuilder: (String value) =>
                              getDropDownMenuItem(value),
                          focusedItemDecoration: _getDslDecoration(),
                        ),
                        padding: EdgeInsets.only(left: 12))),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: _getDropdownIcon(),
                )
              ],
            )),
          ),
        ),
      ],
    );
  }

  DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Text(value);
        });
  }

  _getDslDecoration() {
    return BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Colors.black12),
        top: BorderSide(width: 1, color: Colors.black12),
      ),
    );
  }

  BoxDecoration _getShadowDecoration() {
    return BoxDecoration(
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black.withOpacity(0.06),
          spreadRadius: 4,
          offset: new Offset(0.0, 0.0),
          blurRadius: 15.0,
        ),
      ],
    );
  }

  Icon _getDropdownIcon() {
    return Icon(
      Icons.unfold_more,
      color: Colors.blueAccent,
    );
  }
}

Widget _getFoodContainsRow() {
  final cardSize = 80.0;
  final cardColor = Colors.blueGrey[100];
  return Padding(
    padding: EdgeInsets.only(left: 8, right: 8),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
              child: Center(child: Text("226")),
              height: cardSize,
              margin: EdgeInsets.only(right: 3),
              decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      bottomLeft: const Radius.circular(10.0)))),
        ),
        Expanded(
          child: Container(
              child: Center(child: Text("41")),
              height: cardSize,
              margin: EdgeInsets.only(right: 3),
              decoration: BoxDecoration(color: cardColor)),
        ),
        Expanded(
          child: Container(
              child: Center(child: Text("0")),
              height: cardSize,
              margin: EdgeInsets.only(right: 3),
              decoration: BoxDecoration(color: cardColor)),
        ),
        Expanded(
          child: Container(
              child: Center(child: Text("4.5")),
              height: cardSize,
              decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.only(
                      topRight: const Radius.circular(10.0),
                      bottomRight: const Radius.circular(10.0)))),
        ),
      ],
    ),
  );
}
