import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SortWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var prodCount = 10;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("$prodCount Items"), new DropdownButton<String>(
                  icon: const Icon(Icons.sort),
  items: <String>['Most Relevant', 'Best Match', 'Price: Low to High', 'Price: High to Low'].map((String value) {
    return new DropdownMenuItem<String>(
      value: value,
      child: new Text(value),
    );
  }).toList(),
  onChanged: (_) {},
)]),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
