import 'package:flutter/material.dart';
import 'package:notebook/src/pages/new_task_page.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  _ListPage createState() => new _ListPage();
}

class _ListPage extends State<ListPage> {
  bool _checked = false;
  List<String> tasks = ["Comprar pan", "Limpiar casa"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 10,
              child: Image.asset(
                'assets/images/check.png',
                height: 35.0,
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.add),
                color: Colors.blue[200],
                iconSize: 30.0,
                onPressed: () {
                  _navigateNewTaskPage(context);
                },
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: _tasksList(),
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget _tasksList() {
    return ListView.builder(
        itemCount: tasks.length, // TODO: change for array lenght
        itemBuilder: (BuildContext context, int index) {
          return taskItem(context, index);
        });
  }

  Widget taskItem(context, index) {
    return Dismissible(
      key: Key(tasks[index]),
      onDismissed: (direction) {
        var task = tasks[index];
        showSnackBar(context, task, index);
        removeTask(index);
      },
      background: removeTaskBG(),
      child: Card(
          child: CheckboxListTile(
        title: Text(tasks[index]),
        controlAffinity: ListTileControlAffinity.platform,
        value: _checked, // TODO:_change for variable
        onChanged: (bool value) {
          setState(() {
            _checked = value;
          });
        },
      )),
    );
  }

  showSnackBar(context, task, index) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$task (eliminada)'),
      action: SnackBarAction(
        label: "Deshacer",
        onPressed: () {
          undoDelete(index, task);
        },
      ),
    ));
  }

  undoDelete(index, task) {
    setState(() {
      tasks.insert(index, task);
    });
  }

  removeTask(index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  Widget removeTaskBG() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 4, bottom: 4),
      padding: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(
            color: Colors.red[500],
          ),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  _navigateNewTaskPage(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => new NewTaskPage(
                  tasks: tasks,
                ))).then((value) {
      setState(() {});
    });
  }
}
