import 'package:flutter/material.dart';

class ShopPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ShopPage3();
  }
}

class ShopPage3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ShopPageState();
  }
}

class ShopPageState extends State<ShopPage3> {
  List<String> _list = new List();

  _getPerson() {
    for (int i = 0; i < 3; i++) {
      _list.add("nihao" + i.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    _getPerson();
    return new MaterialApp(
      home: new Scaffold(body: _buildRow()),
    );
  }

  Widget _buildRow() {
    return DefaultTabController(
      length: _list.length, // This is the number of tabs.
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // These are the slivers that show up in the "outer" scroll view.
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: SliverAppBar(
                title: const Text('Books'),
                // This is the title in the app bar.
                pinned: true,
                expandedHeight: 150.0,
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  // These are the widgets to put in each tab in the tab bar.
                  tabs: _list.map((String name) => Tab(text: name)).toList(),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          // These are the contents of the tab views, below the tabs.
          children: _list.map((String name) {
            return SafeArea(
              top: false,
              bottom: false,
              child: Builder(
                // This Builder is needed to provide a BuildContext that is "inside"
                // the NestedScrollView, so that sliverOverlapAbsorberHandleFor() can
                // find the NestedScrollView.
                builder: (BuildContext context) {
                  return CustomScrollView(
                    slivers: <Widget>[
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200.0,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 4.0,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return Container(
                              alignment: Alignment.center,
                              color: Colors.teal[100 * (index % 9)],
                              child: Text('grid item $index'),
                            );
                          },
                          childCount: 20,
                        ),
                      ),
                      SliverFixedExtentList(
                        itemExtent: 50.0,
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return Container(
                              alignment: Alignment.center,
                              color: Colors.lightBlue[100 * (index % 9)],
                              child: Text('list item $index'),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
