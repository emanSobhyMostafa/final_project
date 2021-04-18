import 'package:final_project/config/theme_colors.dart';
import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  final int initNumber;
  final Function(int) counterCallback;

  CounterView({
    this.initNumber,
    this.counterCallback,
  });
  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int currentCount;
  Function _counterCallback;

  @override
  void initState() {
    currentCount = widget.initNumber ?? 1;
    _counterCallback = widget.counterCallback ?? (int number) {};

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(BorderRadiusMedium),

          ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _createIncrementDicrementButton(Icons.remove, () => _dicrement()),
          Text(currentCount.toString()),
          _createIncrementDicrementButton(Icons.add, () => _increment()),
        ],
      ),
    );
  }

  void _increment() {
    setState(() {
      currentCount++;
      _counterCallback(currentCount);
    });
  }

  void _dicrement() {
    setState(() {
      if (currentCount > 1) {
        currentCount--;
        _counterCallback(currentCount);
      }
    });
  }

  Widget _createIncrementDicrementButton(IconData icon, Function onPressed) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: BoxConstraints(minWidth: 32.0, minHeight: 32.0),
      onPressed: onPressed,
      elevation: 2.0,
      fillColor: third,
      child: Icon(
        icon,
        color: white,
        size: 12.0,
      ),
      shape: CircleBorder(),
    );
  }
}
