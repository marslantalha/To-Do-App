// ignore: file_names
import 'package:flutter/material.dart';

// ignore: camel_case_types
class toDoList extends StatefulWidget {
  const toDoList({super.key});

  @override
  State<toDoList> createState() => _toDoListState();
}

// ignore: camel_case_types
class _toDoListState extends State<toDoList> {
  TextEditingController toDoListController = TextEditingController();
  List<String> toDoList = ["Dummy Task"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: TextField(
            controller: toDoListController,
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (toDoListController.text.isNotEmpty) {
                      toDoList.add(toDoListController.text);
                      toDoListController.clear();
                    }
                  });
                },
                child: Text("Add Task"))
          ],
        ),
        body: SafeArea(
            child: ListView.builder(
                itemCount: toDoList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 8),
                    child: ListTile(
                      tileColor: Colors.grey[200],
                      title: Text(toDoList[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            toDoList.removeAt(index);
                          });
                        },
                      ),
                    ),
                    // padding: EdgeInsets.only(bottom: 3),
                  );
                })));
  }
}
