//@dart=2.9
import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {

  CustomStepper({
    @required this.lowerLimit,
    @required this.upperLimit,
    @required this.stepValue,
    @required this.iconSize,
    @required this.value,
    @required this.onChanged,
});

  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  final double iconSize;
  final int value;
  final ValueChanged<dynamic> onChanged;

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(icon: Icon(Icons.remove), onPressed: (){}),
          Container(
            width: this.widget.iconSize,
            child: Text('${widget.value}'),
          ),
          IconButton(icon: Icon(Icons.add), onPressed: (){},)
        ],
      ),
    );
  }
}
