import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;

  const CustomButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
      child: const Text("+"),
      onPressed: () {
        onPressed();
      },
    );
  }
}
