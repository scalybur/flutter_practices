import 'package:flutter/material.dart';

void main()
{
  runApp(new MaterialApp(
    home: MyTextInput()
  ));
}


class MyTextInput extends StatefulWidget
{
  @override
  MyTextInputState createState() => MyTextInputState();
}

class MyTextInputState extends State<MyTextInput>
{
  final TextEditingController ctrlr = TextEditingController();

  var inputData = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Input"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("to clean write clear in field", style: TextStyle(fontSize: 10.00, color: Colors.grey)),
            TextField(
              decoration: InputDecoration(
                hintText: "Type here"
              ),
              /*onChanged: (String str)
              {
                setState(() {
                  inputData = str;
                });
              },*/
              onSubmitted: (String str)
              {
                setState(() {
                  if(str == "clear")
                  {
                    inputData = "";
                  }else
                    {
                      inputData = inputData + "\n" + str;
                    }
                });

                ctrlr.text = "";

              },

              controller: ctrlr
            ),
            Text(
                inputData,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 30.0
                )
            )
          ],
        ),
      ),
    );
  }
}