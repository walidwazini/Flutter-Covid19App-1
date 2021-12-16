import 'package:flutter/material.dart';
import 'package:covid19_app_1/Constant.dart';

class Counter extends StatelessWidget {
  final int number;
  final Color colorType;
  final String title;
  const Counter({
    Key? key,
    required this.number,
    required this.colorType,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kInfectedColor.withOpacity(.24),
          ),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  color: colorType,
                  width: 2,
                )),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '$number',
          style: TextStyle(
            fontSize: 40,
            color: colorType,
          ),
        ),
        Text(title, style: kSubTextStyle,)
      ],
    );
  }
}