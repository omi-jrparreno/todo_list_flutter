import 'package:flutter/material.dart';
import 'package:todo_list/widgets/custom_list_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> todoList = [];
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    todoList.add("My first todo list");
    todoList.add("My second todo list");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // print("didChange object");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                  ),
                  controller: _textController,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10.0)),
                    onPressed: () {
                      // todoList.add(_textController.value.text);
                      // final temp = [_textController.value.text]
                      setState(() {
                        todoList.add(_textController.value.text);
                      });
                      _textController.text = "";
                    },
                    child: const Text("Save"))
              ]),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: todoList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: ((context, index) {
                  final data = todoList[index];
                  return CustomListTile(number: index + 1, text: data);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
