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
  final String url = "http://swapi.co/api/starships";
  List data;

  Future<String> getSWData() async
  {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept" : "application/json"});

    setState(() {
      var resBody = json.decode(response.body);
      data = resBody["results"];
    });

    return "Success!";
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        title: Text("Star Wars Starships"),
        backgroundColor: Colors.purple[900],
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index)
        {
          return Card(
            color: Colors.black87,
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
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                              ),),
                            Text(data[index]["name"],
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold
                              ),),
                          ],
                        )
                      ),
                    ),
                    Card(
                      color: Colors.transparent,
                      child: Container(
                          padding: EdgeInsets.all(15.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Model: ",
                                style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                data[index]["model"],
                                style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.red,
                                fontWeight: FontWeight.bold
                                )
                              ),
                            ],
                          )
                      ),
                    ),
                    Card(
                      color: Colors.black,
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                          child: Row(
                            children: <Widget>[
                              Text("Class: ",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold
                                ),),
                              Text(data[index]["starship_class"],
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.red,
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