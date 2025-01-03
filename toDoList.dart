import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  TextEditingController toDoListController = TextEditingController();
  List<String> toDoList = ["Dummy Task"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: toDoListController,
          decoration: InputDecoration(
            hintText: "Enter a task",
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  toDoList.add(toDoListController.text);
                  toDoListController.clear();
                });
              },
              child: Text("Add Task"))
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (toDoTask, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 3),
                child: ListTile(
                  tileColor: Colors.grey[200],
                  title: Text("${index + 1}.  ${toDoList[index]}"),
                  trailing: Wrap(children: [
                    IconButton(
                        onPressed: () {
                          // toDoListController.text = toDoList[index];
                          showDialog(
                              context: toDoTask,
                              builder: (toDoTask) {
                                return AlertDialog(
                                  title: Text("Update Task"),
                                  content: TextField(
                                    controller: toDoListController,
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            toDoList[index] =
                                                toDoListController.text;
                                            toDoListController.clear();
                                            Navigator.pop(toDoTask);
                                          });
                                        },
                                        child: Text("Update Task")),
                                  ],
                                );
                              });
                        },
                        icon: Icon(Icons.edit)),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          toDoList.removeAt(index);
                        });
                      },
                    ),
                  ]),
                ),
              );
            }),
      ),
    );
  }
}
