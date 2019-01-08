import 'package:flutter/material.dart';
class MsgPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body:  Container(
          margin: const EdgeInsets.all(10.0),
          color: const Color(0xFF00FF00),
          width: 48.0,
          height: 48.0,
        ),
      ),
    );
  }
}