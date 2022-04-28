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
  Choice(title: 'Bicycle', icon: Icons.directions_car),
  Choice(title: 'Boat', icon: Icons.directions_car),
  Choice(title: 'Bus', icon: Icons.directions_car),
  Choice(title: 'Train', icon: Icons.directions_car),
  Choice(title: 'Walk', icon: Icons.directions_car)
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final appTitle = "AppBar Layout";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: appTitle,),
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
        title: Text(widget.title),
      ),
    );
  }
}