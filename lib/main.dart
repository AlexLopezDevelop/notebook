import 'package:flutter/material.dart';
import 'package:notebook/src/pages/list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notebook App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SafeArea(
            child: ListPage(),
          ),
        ),
      ),
    );
  }
}
