import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:checkinpromobile/src/widgetUtilities/ProvinceSelect/select_dialog.dart';

class MultiSelecChoice extends StatefulWidget {
  @override
  _MultiSelecChoiceState createState() => _MultiSelecChoiceState();
}

class _MultiSelecChoiceState extends State<MultiSelecChoice> {
  @override
  Widget build(BuildContext context) {
    List<String> ex5 = [];
    return Center(
      child: TextButton(
        child: Text('Button'),
        onPressed: () {
          SelectDialog.showModal<String>(
            context,
            label: "Tỉnh thành đã đi qua",
            searchHint: 'Search',
            multipleSelectedValues: ex5,
            items: List.generate(54, (index) => "Tỉnh $index"),
            onMultipleItemsChange: (List<String> selected) {
              setState(() {
                ex5 = selected;
              });
            },
          );
        },
      ),
    );
  }
}
