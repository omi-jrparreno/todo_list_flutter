import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final int number;
  final TextStyle? infoTextStyle;
  final TextStyle? numberTextStyle;

  const CustomWidget({
    super.key,
    required this.number,
    this.infoTextStyle,
    this.numberTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "You have pushed the button this many times:",
          style: infoTextStyle,
          maxLines: 1,
        ),
        Text(
          number.toString(),
          style: numberTextStyle,
        )
      ],
    );
  }
}
