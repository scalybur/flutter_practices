import 'package:flutter/material.dart';
import 'firstPage.dart' as first;
import 'secondPage.dart' as second;
import 'thirdPage.dart' as third;
import 'quarter.dart' as quarter;

void main()
{
  runApp(
      new MaterialApp(
        home: MyTabs()
      ));
}

class MyTabs extends StatefulWidget
{
  @override
  MyTabsState createState() => MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin
{

  TabController ctrl;
  var title = "Tabbed pages";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ctrl = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text(title, style: TextStyle(fontSize: 12.0),),
          backgroundColor: Colors.black87,
        bottom: TabBar(
          controller: ctrl,
          tabs: <Tab>[
            Tab(icon: Icon(Icons.arrow_forward_ios)),
            Tab(icon: Icon(Icons.arrow_downward)),
            Tab(icon: Icon(Icons.arrow_downward)),
            Tab(icon: Icon(Icons.arrow_back_ios))
          ],
        ),
      ),
      body: TabBarView(
        controller: ctrl,
        children: <Widget>[

          first.First(),
          second.Second(),
          third.Third(),
          quarter.Quarter()

        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.blueAccent,
        child: TabBar(
          controller: ctrl,
          tabs: <Tab>[
            Tab(icon: Icon(Icons.arrow_forward_ios)),
            Tab(icon: Icon(Icons.arrow_downward)),
            Tab(icon: Icon(Icons.arrow_downward)),
            Tab(icon: Icon(Icons.arrow_back_ios))
          ],
        ),
      )
    );
  }
}