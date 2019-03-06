import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/Result.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("抢羊神器"),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form Widget
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class will hold the data related to
// the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    var _name, _password,_projectNum;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: new InputDecoration(labelText: '请输入登录名'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              } else {
                _name = value;
                print(_name);
              }
            },
          ),
          TextFormField(
            decoration: new InputDecoration(labelText: '请输入密码'),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              } else {
                _password = value;
                print(_password);
              }
            },
          ),
          TextFormField(
            decoration: new InputDecoration(labelText: '请输入购买第几期,比如1，2，3，4，5即可'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              } else {
                _projectNum = value;
                print(_projectNum);
              }
            },
          ),
          Center(
            child: RaisedButton(
              color: Colors.blue,
              textTheme: ButtonTextTheme.primary,
              shape: Border.all(
                  color: Colors.green, style: BorderStyle.solid, width: 2),
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, we want to show a Snackbar
                  loadData(context, _name, _password,_projectNum);
                }
              },
              child: Text('提交'),
            ),
          ),
        ],
      ),
    );
  }

  loadData(BuildContext context, String name, String password,String projectNum) async {
    String dataURL =
        "http://192.168.31.116:8080/webCapture/autoBuySheep?telephone=" +
            name +
            "&password=" +
            password+"&prejectNum="+projectNum;
    http.Response response = await http.get(dataURL);
    setState(() {
      final jsonResponse = json.decode(response.body);
      Result result=new Result.fromJson(jsonResponse);
      if (result.code == 100) {
        showAlertDialog(context);
      } else {
        print(response.body);
      }
    });
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
                title: new Text("Dialog"),
                content: new Text("提交成功"),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("CANCEL"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  new FlatButton(
                    child: new Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ]));
  }
}
