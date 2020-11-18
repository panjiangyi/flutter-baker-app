import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';

class NumSelector extends StatefulWidget {
  @override
  _NumSelectorState createState() => _NumSelectorState();
}

class _NumSelectorState extends State<NumSelector> {
  int selectedPortionCounts = 0;

  DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Center(child: Text(value));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 0, 0, 1),
      child: DirectSelectContainer(
        child: DirectSelectList<String>(
            onUserTappedListener: () {
              print('Hold and drag instead of tap');
            },
            values: ["1.0", "2.0", "3.0", "4.0", "5.0", "6.0", "7.0"],
            defaultItemIndex: selectedPortionCounts,
            itemBuilder: (String value) => getDropDownMenuItem(value),
            focusedItemDecoration: BoxDecoration(
              border: BorderDirectional(
                bottom: BorderSide(width: 1, color: Colors.black12),
                top: BorderSide(width: 1, color: Colors.black12),
              ),
            ),
            onItemSelectedListener: (item, index, context) {
              setState(() {
                selectedPortionCounts = index;
              });
            }),
      ),
    );
  }
}
