import 'package:flutter/material.dart';
import 'package:notebook/src/pages/new_task_page.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  _ListPage createState() => new _ListPage();
}

class _ListPage extends State<ListPage> {
  bool _checked = false;
  List<String> tasks = [];
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
        itemCount: 5, // TODO: change for array lenght
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: CheckboxListTile(
            title: Text("Comprar pan"),
            controlAffinity: ListTileControlAffinity.platform,
            value: _checked, // TODO:_change for variable
            onChanged: (bool value) {
              setState(() {
                _checked = value;
              });
            },
          ));
        });
  }

  _navigateNewTaskPage(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewTaskPage(
                  tasks: tasks,
                )));
  }
}
