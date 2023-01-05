import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String text;
  final int number;
  final String listDescription;

  const CustomListTile(
      {super.key,
      required this.text,
      required this.number,
      required this.listDescription});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Widget okButton = TextButton(
          child: const Text("CLOSE"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        );

        AlertDialog alert = AlertDialog(
            title: Text(text),
            content: Text('This item in the list contains $listDescription'),
            actions: [
              okButton,
            ]);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$number. $text",
                    style: const TextStyle(
                      fontSize: 20,
                    )),
                const Icon(Icons.chevron_right),
              ],
            ),
            Text(
              listDescription,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
