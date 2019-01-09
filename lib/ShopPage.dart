import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}
class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);
  }
}
class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: new RandomWords(),
      ),
    );
  }
}