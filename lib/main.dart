// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Choice {
  final String title;
  final IconData icon;

  const Choice({required this.title, required this.icon});
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Car', icon: Icons.directions_car),
  Choice(title: 'Bicycle', icon: Icons.directions_bike),
  Choice(title: 'Boat', icon: Icons.directions_boat),
  Choice(title: 'Bus', icon: Icons.directions_bus),
  Choice(title: 'Train', icon: Icons.directions_railway),
  Choice(title: 'Walk', icon: Icons.directions_walk)
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final appTitle = "AppBar";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: appTitle,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 50,
        // titleSpacing: 150,
        //centerTitle: true,
        // titleTextStyle: const TextStyle(color: Colors.red, fontSize: 40),
        // iconTheme: IconThemeData(color: Colors.red, size: 50),
        leading: Icon(Icons.school),
        title: Text(widget.title),
        actions: [
          _buildActionButton(choices[0]),
          _buildActionButton(choices[1]),
        ],
      ),
    );
  }

  Widget _buildActionButton(Choice item) {
    return IconButton(
      onPressed: () {},
      icon: Icon(item.icon),
      // iconSize: 40,
      // color: Colors.green,
      // highlightColor: Colors.red,
      // splashColor: Colors.cyan,
      // alignment: Alignment(-10, 0),
      tooltip: item.title,
    );
  }
}
