import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  _ListPage createState() => new _ListPage();
}

class _ListPage extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Cranes'),
            Container(
              //  margin: const EdgeInsets.only(right: 75),
              child: Image.asset(
                'assets/images/check.svg',
              ),
            ),
            FlatButton(
              onPressed: () async {},
              child: Text("paco", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
      body: _tasksList(),
      backgroundColor: Colors.black,
    );
  }

  Widget _tasksList() {
    bool _checked = false;
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
}
