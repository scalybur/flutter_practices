import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

void main()
{
  runApp(MaterialApp(
    home: Home()
  ));
}

class Home extends StatefulWidget
{
  @override
  State createState() => HomeState();
}

class HomeState extends State<Home>
{
  TextEditingController keyInputController = TextEditingController();
  TextEditingController valueInputController = TextEditingController();

  File jsonFile;
  Directory dir;
  String fileName = "myJsonFile.json";
  bool fileExists = false;

  Map<String, dynamic> fileContentForJson;

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory)
    {
      dir = directory;
      jsonFile = File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();

      if(fileExists) this.setState(()=> fileContentForJson = JSON.decode(jsonFile.readAsStringSync()));
    });
  }

  @override
  void dispose() {
    keyInputController.dispose();
    valueInputController.dispose();
    super.dispose();
  }

  void createFile(Map<String, String> content, Directory dir, String fileName)
  {
    print("Creating file!");
    File file = File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(JSON.encode(content));
  }

  void writeToFile(String key, String value)
  {
    print("Writting file");
    Map<String, String> content = {key: value};

    if(fileExists)
    {
      print("File Exists");
      Map<String, dynamic> jsonFileContent = json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(JSON.encode(jsonFileContent));
    }else
      {
        print("File does not exists");
        createFile(content, dir, fileName);
      }
      this.setState( () => fileContentForJson = JSON.decode(jsonFile.readAsStringSync()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Json practice"), backgroundColor: Colors.deepPurpleAccent,),
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top:50.0)),Padding(padding: EdgeInsets.only(top:15.0)),
          Text("File Content: ", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(fileContentForJson.toString()),
          Padding(padding: EdgeInsets.only(top:50.0)),Padding(padding: EdgeInsets.only(top:15.0)),
          Text("Add to Json file: "),
          TextField(
            controller: keyInputController,
          ),
          TextField(
            controller: valueInputController,
          ),
          Padding(padding: EdgeInsets.only(top:50.0)),Padding(padding: EdgeInsets.only(top:30.0)),
          RaisedButton(
            child: Text("Add key & value"),
            onPressed: () => writeToFile(keyInputController.text, valueInputController.text),
          )
        ],
      ),
    );
  }
//MY PROBLEM WITH THIS PROJECT IS ON MAP  - I HAVE TO CHANGE MAP<STR STR> TO MAP<STR DYN>
}