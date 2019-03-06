import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  @override
  createState() => new ShopPageState();
}

class ShopPageState extends State<ShopPage> {
  final TextEditingController _controller = new TextEditingController();
  String string;
  List<String> _list = new List();

  _getPerson() {
    for (int i = 0; i < 100; i++) {
      _list.add("nihao" + i.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    _getPerson();
    return new MaterialApp(
      home: new Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: TextDirection.rtl,
          mainAxisSize: MainAxisSize.max,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            new Text(
              "lijianjun",
              style: new TextStyle(color: Colors.green, fontSize: 19),
            ),
            new Text("aaa".toString() + string.toString()),
            new TextField(
              textDirection: TextDirection.rtl,
              keyboardType: TextInputType.number,
              controller: _controller,
              decoration: new InputDecoration(
                hintText: 'Type something',
              ),
              onChanged: (s) {
                print(s);
                setState(() {
                  string = s.toString();
                });
              },
            ),
            new RaisedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  child: new AlertDialog(
                    title: new Text('What you typed'),
                    content: new Text(_controller.text),
                  ),
                );
              },
              child: new Text('DONE'),
            ),
//            new ListView.builder(itemBuilder: (context, i) {
//
//              return _buildRow(_list[i]);
//            })
          ],
        ),

      ),
    );
  }

  Widget _buildRow(String item) {
    return ListTile(
      title: new Text(item),

    );
  }
}
