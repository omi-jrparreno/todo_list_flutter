import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list/note.dart';
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
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(title: 'Task List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Note> todoList = [];
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    todoList.add(const Note(
        title: "Groceries",
        description: "A list of things to buy during Groceries"));
    //todoList.add("My second todo list");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
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
                      hintText: 'Add an Item to the List',
                    ),
                    controller: _textController),
                TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Add an Item Description'),
                    controller: _descriptionController),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10.0)),
                    onPressed: () {
                      setState(() {
                        todoList.add(Note(
                            title: _textController.value.text,
                            description: _descriptionController.value.text));
                      });
                      _textController.text = "";
                      _descriptionController.text = "";
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
                  return Slidable(
                    endActionPane: ActionPane(
                      extentRatio: 0.3,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          label: "Edit",
                          onPressed: (context) => {
                            showDialog(
                                context: context,
                                builder: (context) => SimpleDialog(
                                      title: const Text('Edit your List'),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            children: [
                                              TextField(
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: ' Edit Title',
                                                ),
                                                onChanged: (value) {
                                                  setState(() {
                                                    _textController.text =
                                                        value;
                                                  });
                                                },
                                              ),
                                              TextField(
                                                decoration:
                                                    const InputDecoration(
                                                  labelText:
                                                      ' Edit Description',
                                                ),
                                                onChanged: (value) {
                                                  setState(() {
                                                    _descriptionController
                                                        .text = value;
                                                  });
                                                },
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      todoList[index] = Note(
                                                          title: _textController
                                                              .value.text,
                                                          description:
                                                              _descriptionController
                                                                  .value.text);
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text("Update")),
                                            ],
                                          ),
                                        )
                                      ],
                                    ))
                          },
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                        ),
                      ],
                    ),
                    startActionPane: ActionPane(
                      extentRatio: 0.3,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          label: "Delete",
                          onPressed: (context) => {
                            setState(
                              () {
                                todoList.remove(todoList[index]);
                              },
                            )
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        CustomListTile(
                            text: data.title,
                            number: index + 1,
                            listDescription: data.description)
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
