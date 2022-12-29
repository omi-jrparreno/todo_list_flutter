import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String text;
  final int number;

  const CustomListTile({super.key, required this.text, required this.number});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(text);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$number. $text",
                    style: const TextStyle(
                      fontSize: 20,
                    )),
                const Icon(Icons.chevron_right)
              ],
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
