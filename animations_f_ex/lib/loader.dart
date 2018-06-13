import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  @override
  State createState() => LoaderState();
}

class LoaderState extends State<Loader> with SingleTickerProviderStateMixin
{
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 1500), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    animation.addListener(()
    {
      this.setState(() {});
    });
    animation.addStatusListener((AnimationStatus status){});
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.yellow,
          height: 3.0,
          width: animation.value * 50.0,
        ),
        Padding(padding: EdgeInsets.only(bottom: 60.0)),
        Container(
            color: Colors.white,
            height: 3.0,
            width: animation.value * 80.0
        ),
        Padding(padding: EdgeInsets.only(bottom: 60.0)),
        Container(
            color: Colors.black,
            height: 3.0,
            width: animation.value * 200.0
        ),
        Padding(padding: EdgeInsets.only(bottom: 60.0)),
        Container(
            color: Colors.white,
            height: 3.0,
            width: animation.value * 80.0
        ),
        Padding(padding: EdgeInsets.only(bottom: 60.0)),
        Container(
            color: Colors.yellow,
            height: 3.0,
            width: animation.value * 50.0
        )
      ],
    );
  }
}