import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main()
{
  runApp(MaterialApp(
    home: HomePage()
  ));
}

class HomePage extends StatefulWidget
{
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
{

  List data;

  Future<String> getData() async
  {
    http.Response response = await http.get(
      Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      headers:
      {
        "Accept": "application/json"
      }
    );

    this.setState((){
      data = JSON.decode(response.body);
    });

    return "Success!";
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listviews"),
      ),

      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index)
        {
          return Card(
            child: Text(data[index]["title"]),
          );
        },
      )
    );
  }


}