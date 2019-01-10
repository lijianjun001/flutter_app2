import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: Center(
          child: Container(
            constraints: BoxConstraints.expand(
              height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
            ),
            padding: const EdgeInsets.all(8.0),
            color: Colors.teal.shade700,
            alignment: Alignment.center,
            child: Text('Hello World', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
            foregroundDecoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547111226654&di=ea78bab3eb529b06fb9b05a561224405&imgtype=0&src=http%3A%2F%2Fscimg.jb51.net%2Fallimg%2F170209%2F106-1F20916102V08.jpg'),
                centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
              ),
            ),
            transform: Matrix4.rotationZ(0.2),
          )

        )
      ),
    );
  }
}