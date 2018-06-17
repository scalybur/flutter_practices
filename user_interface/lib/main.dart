import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget
{
  @override
  State createState() => MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin
{
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2,vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  TabBar makeTabBar()
  {
    return TabBar(
      tabs: <Tab>[
        Tab(
          icon: Icon(Icons.home),
        ),
        Tab(
          icon: Icon(Icons.settings_power),
        )
      ],
      controller: tabController
    );
  }

  TabBarView makeTabBarView(tabs)
  {
    return TabBarView(
      children: tabs,
      controller: tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.red,
        bottom: makeTabBar()
        ),
        body: makeTabBarView(<Widget>[TheGridView().build(), SimpleWidget()]),
      ),
    );
  }
}

class SimpleWidget extends StatefulWidget
{
  @override
  SimpleWidgetState createState()=> SimpleWidgetState();
}

class SimpleWidgetState extends State<SimpleWidget>
{
  int step_counter = 0;
  List<Step> steps = [
    Step(
      title: Text("Step one!"),
      content: Text("This is the first step"),
      isActive: true
    ),
    Step(
        title: Text("Step two!"),
        content: Text("This is the second step"),
        isActive: true
    ),
    Step(
        title: Text("Step three!"),
        content: Text("This is the third step"),
        isActive: true
    ),
    Step(
        title: Text("Step four!"),
        content: Text("This is the fourth step"),
        isActive: true
    ),

  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stepper(
        currentStep: this.step_counter,
        steps: steps,
        type: StepperType.vertical,
        onStepTapped: (step)
        {
          setState(() {
            step_counter = step;
          });
        },
        onStepCancel: ()
        {
          setState(() {
            step_counter > 0 ? step_counter -= 1 : step_counter = 0;
          });
        },
        onStepContinue: ()
        {
          setState(() {
            step_counter < steps.length - 1 ? step_counter += 1 : step_counter = 0;
          });
        },
      ),
    );
  }
}

class TheGridView
{
  Card makeGridCell(String name, IconData icon)
  {
    return Card(
      elevation: 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Center(
            child: Icon(icon),
          ),
          Center(
              child: Text(name),
          )
        ],
      ),
    );
  }

  GridView build()
  {
    return GridView.count(
      primary: true,
      padding: EdgeInsets.all(1.0),
      crossAxisCount: 3,
      childAspectRatio: 1.0,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: <Widget>[
        makeGridCell("Home", Icons.home),
        makeGridCell("Email", Icons.email),
        makeGridCell("Chat", Icons.chat_bubble),
        makeGridCell("New", Icons.new_releases),
        makeGridCell("Network", Icons.network_wifi),
        makeGridCell("Options", Icons.settings),
      ],
    );
  }

}