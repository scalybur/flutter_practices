import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: Home(),
    theme: themeData,
  ));
}

final ThemeData themeData = ThemeData(
  canvasColor:  Colors.lightGreenAccent,
);

class Home extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: ()
          {
            Navigator.push(context, PageTwo());
          },
          child: Text("Page two!"),
        ),
      ),
    );
  }
}

class PageTwo extends MaterialPageRoute<Null>
{
  PageTwo() : super(builder: (BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 1.0,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: ()
          {
            Navigator.push(context, PageThree());
          },
          child: Text("Go three"),
        ),
      ),
    );
  });
}

class PageThree extends MaterialPageRoute<Null>
{
  PageThree() : super (builder: (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Last page :)"),
        backgroundColor: Theme.of(context).accentColor,
        elevation: 2.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: ()
            {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Center(
        child: MaterialButton(
          onPressed: ()
          {
            Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
          },
          child: Text("OK Go Home!:P"),
        ),
      ),
    );
  });
}