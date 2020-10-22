import 'package:flutter/material.dart';
import 'package:notebook/src/models/task.dart';

class NewTaskPage extends StatelessWidget {
  NewTaskPage({@required this.tasks});
  final List<Task> tasks;
  TextEditingController newTaskController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "¿Que quieres recordar?",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    child: TextField(
                      controller: newTaskController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Escribe una tarea...'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancelar"),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.blue[200],
                          onPressed: () {
                            print(newTaskController.text);
                            if (newTaskController.text != "") {
                              Task newTask =
                                  new Task(newTaskController.text, false);
                              tasks.add(newTask);
                              Navigator.pop(context);
                            }
                          },
                          child: Text("Añadir"),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
