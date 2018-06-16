import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

void main ()
{
  runApp(MaterialApp(
    home: StarWarsData(),
  ));
}

class StarWarsData extends StatefulWidget
{
  @override
  State createState()=> StarWarsDataState();
}

class StarWarsDataState extends State<StarWarsData>
{
  final String url = "http://www.fruitmap.sk/api/trees";
  List data;

  Future<String> getSWData() async
  {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept" : "application/json"});

    setState(() {
      var resBody = json.decode(response.body);
      data = resBody;
    });

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Fruit Trees"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index)
        {
          return Card(
            color: Color(getColorHexFromStr(data[index]["color"])),
            child: Container(
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Card(
                        color: Colors.transparent,
                        child: Container(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              children: <Widget>[
                                Text("Name: ",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),),
                                Text(data[index]["name"],
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold
                                  ),),
                              ],
                            )
                        ),
                      ),
                      Center(
                        child: Container(
                          alignment: Alignment.center,
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              children: <Widget>[
                                Text("Arround the world: ",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),),
                                Text(data[index]["count"],
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold
                                  ),),
                              ],
                            )
                        ),
                      )
                    ]
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getSWData();
  }
}

int getColorHexFromStr(String colorStr)
{
  colorStr = "FF" + colorStr;
  colorStr = colorStr.replaceAll("#", "");
  int val = 0;
  int len = colorStr.length;
  for (int i = 0; i < len; i++) {
    int hexDigit = colorStr.codeUnitAt(i);
    if (hexDigit >= 48 && hexDigit <= 57) {
      val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 65 && hexDigit <= 70) {
      // A..F
      val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 97 && hexDigit <= 102) {
      // a..f
      val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
    } else {
      throw new FormatException("An error occurred when converting a color");
    }
  }
  return val;
}